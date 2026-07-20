# leebokeum.com

개인 블로그/포트폴리오 사이트 [leebokeum.com](https://leebokeum.com)입니다.

2018년부터 운영하던 Spring Boot + JSP + MySQL 서버를 2026년 7월에 **Astro 기반 정적 사이트**로 재구축했습니다. 이전 서버 코드는 [leebokeum/leebokeu.com.regacy](https://github.com/leebokeum/leebokeu.com.regacy) (private)에 아카이브되어 있습니다.

## 기술 스택

- [Astro 5](https://astro.build/) — 정적 사이트 생성
- [Pagefind](https://pagefind.app/) — 빌드 후 생성되는 정적 검색 인덱스
- GitHub Pages + GitHub Actions — 배포

## 개발

```bash
npm install
npm run dev       # 개발 서버 (localhost:4321)
npm run build     # 빌드 (astro build + pagefind 인덱싱) → dist/
npm run preview   # 빌드 결과 미리보기
```

## 글 작성

`src/content/blog/`에 마크다운 파일을 추가하고 master에 푸시하면 끝입니다.

```markdown
---
title: 글 제목
date: 2026-07-20T12:00:00.000Z
category: 일상
tags:
  - 태그1
subTitle: 목록에 표시될 요약
repImg: /images/대표이미지.jpg   # 없으면 생략
---

본문...
```

전체 스키마는 `src/content.config.ts` 참고. `hit`, `likes`, `legacyComments`는 구 서버 DB에서 마이그레이션한 값이라 새 글에는 쓰지 않습니다.

## 배포

master에 푸시하면 GitHub Actions(`.github/workflows/deploy.yml`)가 빌드 후 GitHub Pages로 배포합니다.

GitHub Pages는 Node 서버를 실행할 수 없는 정적 파일 호스팅이지만, **Node가 필요한 시점은 서빙할 때가 아니라 빌드할 때뿐**이라 문제가 없습니다:

1. **빌드** — master 푸시 시 GitHub Actions의 ubuntu VM에서 Node 22로 `npm run build`를 실행합니다. Node가 실제로 돌아가는 곳은 여기, 빌드하는 몇 분간뿐입니다.
2. **정적 파일 생성** — 빌드가 끝나면 `dist/`에 순수 HTML/CSS/JS/이미지만 남습니다. 블로그 글, 카테고리/태그별 페이지 전부가 이 시점에 미리 HTML로 만들어집니다. `blog/[id].astro` 같은 동적 라우트도 빌드 때 글 개수만큼 펼쳐져 정적 파일이 됩니다.
3. **서빙** — `dist/`를 Pages에 업로드하면, 이후 방문자 요청에는 GitHub의 정적 서버가 파일을 그대로 돌려줄 뿐입니다. 런타임에 실행되는 서버 코드는 0줄입니다.

동적으로 보이는 기능들도 서버 없이 동작합니다. 검색은 Pagefind가 빌드 때 만들어둔 인덱스를 브라우저에서 fetch해 클라이언트에서 수행하고, 구 서버의 댓글은 `legacyComments`로 frontmatter에 옮겨 빌드 시 HTML로 굳혔습니다. 서버·DB가 없으므로 트래픽 부하에 강한 대신, 쓰기가 필요한 기능(실시간 댓글, 조회수 증가 등)은 지원하지 않습니다.

## 구조

```
src/
├── content/blog/        # 블로그 글 (마크다운)
├── content.config.ts    # 콘텐츠 컬렉션 스키마
├── pages/               # 라우트
│   ├── index.astro      #   메인
│   ├── blog/            #   글 목록·상세, 카테고리/태그별 페이징
│   ├── content/[id]     #   구 URL 리다이렉트용
│   ├── portfolio/       #   포트폴리오
│   └── search.astro     #   Pagefind 검색
├── layouts/             # 공통 레이아웃
├── components/          # 컴포넌트
└── utils/               # 유틸
public/                  # 이미지 등 정적 파일
```
