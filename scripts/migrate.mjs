import fs from 'node:fs';
import path from 'node:path';

import mysql from 'mysql2/promise';
import YAML from 'yaml';
import { Scalar } from 'yaml';

// ISO 날짜 문자열이 YAML 파서에서 timestamp(Date)로 재해석되지 않도록 강제 인용
function quotedString(value) {
    const scalar = new Scalar(value);
    scalar.type = Scalar.QUOTE_DOUBLE;
    return scalar;
}

const OUT_DIR = 'src/content/blog';
const REPORT = 'scripts/migration-report.txt';

// leebokeum.com 절대 URL(프로토콜 상대 포함)을 루트 상대 경로로 치환
function rewriteUrls(html) {
    return html.replace(/(?:https?:)?\/\/(?:www\.)?leebokeum\.com\//g, '/');
}

const conn = await mysql.createConnection({
    host: '127.0.0.1',
    port: 33306,
    user: 'root',
    password: 'root',
    database: 'leebokeum',
    charset: 'utf8mb4',
});

const [categories] = await conn.execute(
    "SELECT id, category_name FROM blog_category WHERE delete_flag = 'N'");
const categoryById = new Map(categories.map((c) => [c.id, c.category_name]));

const [replies] = await conn.execute(
    "SELECT parent_id, creater_name, create_date, contents FROM reply WHERE delete_flag = 'N' ORDER BY create_date");
const repliesByPost = new Map();
for (const r of replies) {
    if (!repliesByPost.has(r.parent_id)) {
        repliesByPost.set(r.parent_id, []);
    }
    repliesByPost.get(r.parent_id).push(r);
}

const [posts] = await conn.execute("SELECT * FROM content WHERE delete_flag = 'N'");

fs.rmSync(OUT_DIR, { recursive: true, force: true }); // 멱등성: 재실행 시 결과 동일
fs.mkdirSync(OUT_DIR, { recursive: true });

const report = [];
const externalImgs = [];
let written = 0;
let skippedSecret = 0;

for (const p of posts) {
    // secret_flag: 0/'0'/'N'/null 외의 값은 비공개 글로 간주하고 제외
    if (p.secret_flag != null && !['0', 'N', ''].includes(String(p.secret_flag))) {
        skippedSecret++;
        report.push(`SKIP(secret) id=${p.id} title=${p.title}`);
        continue;
    }

    const html = rewriteUrls(p.contents ?? '');
    for (const m of html.matchAll(/src="(https?:\/\/[^"]+)"/g)) {
        externalImgs.push(`post ${p.id}: ${m[1]}`);
    }

    const frontmatter = {
        title: p.title || '(제목 없음)',
        date: p.create_date, // mysql2가 Date로 반환 → YAML이 ISO 문자열로 직렬화
        category: categoryById.get(p.category_id) ?? '미분류',
        tags: (p.tag ?? '').split(',').map((t) => t.trim()).filter(Boolean),
        author: p.creater_name || '이복음',
        subTitle: p.sub_title ?? '',
        repImg: p.rep_img ? `/images/${p.rep_img}` : null,
        hit: p.hit ?? 0,
        likes: p.likes ?? 0,
        legacyComments: (repliesByPost.get(p.id) ?? []).map((r) => ({
            author: r.creater_name ?? '익명',
            date: quotedString(r.create_date instanceof Date ? r.create_date.toISOString() : String(r.create_date)),
            body: r.contents ?? '',
        })),
    };

    const md = `---\n${YAML.stringify(frontmatter)}---\n\n${html}\n`;
    fs.writeFileSync(path.join(OUT_DIR, `${p.id}.md`), md, 'utf8');
    written++;
}

report.push('', `총 글(delete_flag=N): ${posts.length}`, `변환: ${written}`, `비공개 제외: ${skippedSecret}`);
report.push('', '=== 외부 도메인 이미지 (수동 확인 대상) ===', ...externalImgs);
fs.writeFileSync(REPORT, report.join('\n'), 'utf8');
console.log(`변환 ${written}건, 비공개 제외 ${skippedSecret}건 — 상세: ${REPORT}`);

await conn.end();
