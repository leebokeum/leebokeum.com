import fs from 'node:fs';
import path from 'node:path';

const BLOG_DIR = 'src/content/blog';
const PUBLIC_DIR = 'public';

let missing = 0;
let checked = 0;

for (const file of fs.readdirSync(BLOG_DIR)) {
    const text = fs.readFileSync(path.join(BLOG_DIR, file), 'utf8');
    // 본문과 frontmatter(repImg)의 로컬 참조를 모두 수집
    const refs = [
        ...text.matchAll(/src="(\/images\/[^"]+)"/g),
        ...text.matchAll(/href="(\/file\/[^"]+)"/g),
        ...text.matchAll(/repImg: (\/images\/\S+)/g),
    ].map((m) => m[1]);

    for (const ref of refs) {
        checked++;
        const localPath = path.join(PUBLIC_DIR, decodeURIComponent(ref));
        if (!fs.existsSync(localPath)) {
            missing++;
            console.error(`MISSING ${file}: ${ref}`);
        }
    }
}

console.log(`검사 ${checked}건, 누락 ${missing}건`);
process.exit(missing > 0 ? 1 : 0);
