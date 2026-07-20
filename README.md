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

> `.npmrc`로 공개 npm 레지스트리를 명시하고 있습니다. 사내 레지스트리 URL이 lockfile에 섞이면 CI가 깨지므로 유지해야 합니다.

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

master에 푸시하면 GitHub Actions(`.github/workflows/deploy.yml`)가 빌드 후 GitHub Pages로 배포합니다. 별도 서버·DB 없이 전부 정적으로 서빙됩니다.

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
