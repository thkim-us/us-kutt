# US-KUTT

**Kutt**는 사용자 정의 도메인을 지원하는 현대적인 URL 단축 서비스입니다. URL을 단축하고, 링크를 관리하며 클릭률 통계를 확인할 수 있습니다. 아래 내용은 2.7.3 버전 기준 포크 프로젝트 모노레포 구조 설정 가이드입니다.

## 목차

- [주요 기능](#주요-기능)
- [기술 스택](#기술-스택)
- [설치 방법](#설치-방법)
- [브라우저 확장 프로그램](#브라우저-확장-프로그램)
- [API](#api)
- [연동](#연동)
- [서드파티 패키지](#서드파티-패키지)
- [후원](#후원)
- [기여하기](#기여하기)

## 주요 기능

- 무료 오픈소스
- 사용자 정의 도메인 지원
- 단축 URL의 사용자 정의 경로 설정
- URL 비밀번호 설정
- URL 설명 추가
- URL 만료 시간 설정
- 단축 URL의 비공개 통계
- 링크 조회, 수정, 삭제 및 관리
- 관리자 계정으로 링크 조회, 삭제 및 차단
- 비공개 사용을 위한 회원가입 및 익명 링크 생성 비활성화
- RESTful API 제공

## 기술 스택

- Node (웹 서버)
- Express (웹 서버 프레임��크)
- Passport (인증)
- React (UI 라이브러리)
- Next (유니버설/서버사이드 렌더링 React)
- Easy Peasy (상태 관리)
- styled-components (CSS 스타일링 솔루션)
- Recharts (차트 라이브러리)
- PostgreSQL (데이터베이스)
- Redis (캐시 레이어)

## 설치 방법

### 사전 요구사항
- Node.js v20 이상
- pnpm (Node.js 패키지 매니저)
- Docker 및 Docker Compose

### pnpm 설치 및 사용

#### 1. pnpm 전역 설치
```bash
npm install -g pnpm
```

#### 2. 프로젝트 의존성 설치
```bash
pnpm install
```

#### 3. 개발 서버 실행
```bash
pnpm dev
```

> **주의사항**
> - 개발 서버를 실행하기 전에 PostgreSQL 서비스가 실행 중이어야 합니다.
> - Docker를 사용하는 경우, 아래 명령어로 먼저 데이터베이스 서비스를 시작하세요:
>   ```bash
>   docker-compose up -d
>   ```
> - 로컬 PostgreSQL을 사용하는 경우, `.env` 파일의 DB_HOST가 'localhost'로 설정되어 있는지 확인하세요.

#### 4. 프로덕션 빌드
```bash
pnpm build
```

#### 5. 프로덕션 서버 실행
```bash
pnpm start
```

### Docker 실행
전체 애플리케이션 스택(Node.js, PostgreSQL, Redis)을 한 번에 실행하려면:
```bash
docker-compose up
```