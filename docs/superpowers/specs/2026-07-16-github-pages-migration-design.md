# leebokeum.com → GitHub Pages 이전 설계

- 날짜: 2026-07-16
- 상태: 사용자 승인 (Astro 기반 접근 확정)

## 배경

leebokeum.com은 AWS 위에 Nginx + Tomcat(Spring Boot 1.5 + JSP + MySQL + 디스크 파일 저장)으로
호스팅하던 개인 포트폴리오/블로그 사이트다. 비용 부담으로 서버를 내렸고, 도메인은 보유 중이다.
이 사이트를 GitHub Pages 정적 호스팅 구조로 리팩토링해 운영 비용 0원으로 되살린다.

백업 위치: `~/Library/Mobile Documents/com~apple~CloudDocs/leebokeum.com/20260124`
(MySQL 덤프, 업로드 이미지, nginx 설정, 톰캣 포함. 터미널의 iCloud Drive 접근 권한 필요 —
전체 디스크 접근 허용 또는 폴더를 워크스페이스로 복사 후 작업.)

## 확정된 요구사항

- 기존 MySQL 덤프의 블로그 글을 마이그레이션한다.
- 앞으로 글은 로컬에서 마크다운으로 작성하고 git push로 배포한다. (관리자 UI/로그인 제거)
- 유지 기능: 댓글(giscus), 검색/태그/카테고리(빌드 타임 정적 생성 + Pagefind).
- contact 폼(DB 저장 + 카카오 발송)과 조회수 기능은 제거한다. contact는 정적 연락처 페이지로.
- 기존 디자인(JSP + CSS 레이아웃, flipbook 포트폴리오)을 그대로 유지한다.
- 보유 중인 커스텀 도메인을 GitHub Pages에 연결한다.

## 전체 아키텍처

```
[로컬] 마크다운 작성 → git push
              │
              ▼
[GitHub Actions] Astro 빌드 (목록·카테고리·태그 페이지 생성 + Pagefind 색인)
              │
              ▼
[GitHub Pages] 정적 파일 서빙 ← 커스텀 도메인 (leebokeum.com, HTTPS 자동)
              │
   댓글: giscus (GitHub Discussions)
```

SSG는 Astro를 사용한다. 선정 이유: `.astro` 템플릿이 HTML에 가까워 기존 JSP의
HTML/CSS/JS를 거의 그대로 이식 가능하고, 마크다운 안에 raw HTML을 허용해
CKEditor로 작성된 기존 글(HTML 본문)을 무손실로 수용하며, 카테고리/태그 페이지의
빌드 타임 생성과 Pagefind 검색 연동이 자연스럽다.

검토 후 탈락한 대안: Jekyll(Ruby 툴체인 부담, 생태계 노후화), 순수 정적 HTML(마크다운
작성 워크플로우 성립 불가).

## 저장소 전략

- 현재 레포(`leebokeum`)를 그대로 사용한다.
- 기존 Spring Boot 코드는 `legacy-spring` 브랜치로 보존한다.
- `master`를 Astro 프로젝트로 재구성한다.
- giscus 사용을 위해 레포는 public + Discussions 활성화가 필요하다.
  (레포를 private으로 유지해야 하면 댓글용 public 레포를 별도로 둔다.)

## 새 디렉터리 구조

```
leebokeum/
├── src/
│   ├── layouts/BaseLayout.astro      # JSP common(header/footer) → 레이아웃
│   ├── components/                   # nav, giscus 임베드 등 공통 조각
│   ├── pages/
│   │   ├── index.astro               # home.jsp
│   │   ├── about.astro               # about.jsp
│   │   ├── contact.astro             # contact.jsp (정적 정보만)
│   │   ├── portfolio/har.astro       # har_portfolio.jsp
│   │   └── blog/
│   │       ├── index.astro           # 전체 글 목록 (페이징)
│   │       ├── [category].astro      # 카테고리별 목록
│   │       ├── tag/[tag].astro       # 태그별 목록
│   │       └── [id].astro            # 글 상세 (본문 + 이전 댓글 박제 + giscus)
│   └── content/blog/*.md             # 글 원본 (frontmatter + 본문)
├── public/                           # 기존 static/ 그대로: css, js, img, fonts, flipbook
│   └── upload/                       # 백업에서 복사한 업로드 이미지
├── scripts/migrate.mjs               # 1회성 마이그레이션 스크립트
└── .github/workflows/deploy.yml      # push → 빌드 → Pages 배포
```

- 기존 `src/main/resources/static/`의 css/js/img/fonts/flipbook은 `public/`으로 그대로 복사한다.
- flipbook 포트폴리오는 순수 클라이언트 JS라 수정 없이 동작한다.
- 401/404는 Astro의 `404.astro`로 대체한다(GitHub Pages는 404.html만 지원).

## 데이터 마이그레이션 파이프라인 (1회성)

1. **덤프 복원**: MySQL 덤프를 로컬 Docker MySQL에 복원한다. (덤프 텍스트 직접 파싱보다 안전)
2. **글 변환**: `content`, `blog_category`, `reply` 테이블을 읽어 글 하나당
   `src/content/blog/{id}.md`를 생성한다.
   - frontmatter: `title, date, category, tags, hit`(조회수는 기록 보존용, 표시하지 않음)
   - 본문: CKEditor HTML을 그대로 유지(raw HTML). 새 글부터는 순수 마크다운으로 작성.
3. **이미지**: 백업의 업로드 파일을 `public/upload/`로 복사하고, 본문 내 이미지 URL을
   `/upload/...` 상대 경로로 치환한다.
4. **기존 댓글**: giscus로 이관이 불가하므로 글 frontmatter의 `legacyComments`에 박제하고,
   글 하단에 "이전 댓글" 섹션으로 정적 표시한다. 새 댓글은 giscus로 받는다.
5. **URL 보존**: 기존 글 URL이 `content/{id}` 형태이므로 새 URL을 `/blog/{id}`로 하고,
   `content/{id}` → `/blog/{id}` 리다이렉트 정적 페이지를 생성해 외부 링크 단절을 막는다.
   백업의 nginx 설정에서 추가 리다이렉트/리라이트 규칙을 확인해 반영한다.
6. **검증**: 글 개수가 DB와 일치하는지, 본문 내 깨진 이미지 참조가 0건인지 확인한다.

## 기능 매핑

| 기존 (서버)                          | 새 구조                                        |
|--------------------------------------|------------------------------------------------|
| 글 CRUD + CKEditor + 로그인/카카오    | 로컬 마크다운 + git push (관리 화면 제거)       |
| 카테고리/태그/검색 (MySQL 쿼리)       | 빌드 타임 정적 생성 + Pagefind 클라이언트 검색  |
| 댓글 (reply 테이블)                   | giscus (방문자는 GitHub 계정으로 댓글)          |
| contact 메시지 저장 + 카카오 발송     | 정적 연락처 페이지 (이메일/SNS 링크)            |
| 조회수(hit), 이미지 리사이즈, 업로드  | 제거 (조회수는 frontmatter에 기록만 보존)       |

## 배포와 도메인

- **배포**: GitHub Actions 공식 Astro 액션(`withastro/action`) → GitHub Pages.
  push 후 1~2분 내 자동 반영.
- **도메인**: Pages 설정에 커스텀 도메인 등록(`public/CNAME`) + DNS 설정:
  - apex: A 레코드 4개 → `185.199.108.153` ~ `185.199.111.153`
  - `www`: CNAME → `{username}.github.io`
  - HTTPS는 GitHub이 Let's Encrypt로 자동 발급 (기존 Nginx SSL 역할 대체)

## 에러 처리 / 엣지 케이스

- 마이그레이션 스크립트는 멱등하게 작성한다(재실행 시 결과 동일).
- 본문에 외부 도메인 이미지가 섞여 있으면 목록으로 보고하고 수동 판단한다.
- 덤프 인코딩(utf8/euc-kr) 문제 발견 시 복원 단계에서 문자셋을 명시한다.

## 검증 계획

- 마이그레이션: 글 수 일치 검사 + 깨진 이미지 참조 0건 스크립트 검증.
- 빌드: `astro build` 성공 + `astro preview`로 페이지별(홈/about/contact/포트폴리오/
  블로그 목록/카테고리/태그/글 상세/검색) 수동 확인.
- 배포 후: 커스텀 도메인 HTTPS 접속, 구 URL 리다이렉트, giscus 동작 확인.

## 진행 순서

1. 백업 폴더 접근 확보 → 덤프/이미지/nginx 설정 분석
2. `legacy-spring` 브랜치 생성, master에 Astro 스캐폴딩
3. JSP → Astro 템플릿 이식 (디자인 그대로)
4. 마이그레이션 스크립트 작성·실행·검증
5. giscus, Pagefind 연동
6. Actions 배포 + 도메인 연결 + 최종 확인
