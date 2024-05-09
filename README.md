# ✌️Ddoi Story(또이스토리) 프로젝트✌️

## 💻프로젝트 소개

### **-프로젝트 주제**

유아/초등/중등/고등 교과서 및 문제집 판매 사이트 구축

### **-개발 기간**

24.04.24(수) ~ 24.05.06(월)

1) 요구사항 분석 및 개발 항목 리스트 작성, 프로젝트 생성 및 데이터베이스 설계 (24.04.24)

2) 개발 및 테스트 (24.04.25~24.05.06)

3) 프로젝트 PT 및 멘토 피드백 (24.05.07 오전 10시 예정)

### **-개발 환경**
apache-tomcat 9.0.87 / jdk 11.0.21

IntelliJ IDEA 2023.3.2

MariaDB 10.11 / dbeaver

### **-기술 스택**

|||
|---|---|
| **Frontend** |<img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=white"> <img src="https://img.shields.io/badge/jsp-004088?style=for-the-badge&logo=jsp&logoColor=white">|
| **Backend** | <img src="https://img.shields.io/badge/JDK 11.0.21 (java11)-3BABFF?style=for-the-badge&logo=java&logoColor=red"> <img src="https://img.shields.io/badge/Java Servlet-6DB33F?style=for-the-badge&logo=JavaServlet&logoColor=white">|
| **Database** | <img src="https://img.shields.io/badge/Maria DB 10.11-003545?style=for-the-badge&logo=mariadb&logoColor=white"> |
| **WAS** | <img src="https://img.shields.io/badge/Apache Tomcat 9.0.87-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black"> |
| **Library** | <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white"> <img src="https://img.shields.io/badge/mybatis-2D8C3C?style=for-the-badge&logo=mybatis&logoColor=white"> |
| **IDE / Tool** |  <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/intellij IDEA-000000?style=for-the-badge&logo=intellijidea&logoColor=white"> <img src="https://img.shields.io/badge/SourceTree-0052CC?style=for-the-badge&logo=sourcetree&logoColor=white"> <img src="https://img.shields.io/badge/HeidiSQL 12.6-83B81A?style=for-the-badge&logo=Heidi&logoColor=white"> <img src="https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white">|
<br/>




## **🔧주요 기능 및 담당자**

### **-데이터 베이스 구축**
![image](https://github.com/cmkbeew/bookstore/assets/77384277/3a9547dc-01e3-4179-914e-a745600c0a5a)
[[bookstore_table.sql 확인]](https://github.com/cmkbeew/bookstore/blob/main/bookstore_table.sql) [[table_foreign_key.sql 확인]](https://github.com/cmkbeew/bookstore/blob/main/table_foreign_key.sql)

테이블 명 추가, 디비버 이미지 다운 받아서 넣으면 될 듯.

### -페이지 구현

**1) 메인(담당자 : 전주연)**

1. 카테고리 별 새로 입고 된 책 4권 노출 및 상세 페이지 연결
2. 카테고리 별 추천 책 4권 노출 및 상세 페이지 연결
3. 공지사항 5개 리스트 노출 및 상세 페이지 연결
4. FAQ 5개 리스트 노출 및 상세 페이지 연결

**2) 회사 소개(담당자: 전주연)**

1. 회사 개요
2. 연혁

*천재교육의 회사 개요 및 연혁을 넣어 페이지 이동만 구현한 상태

**3) 도서(담당자 : 조현기)**

-리스트 페이지

1. 갤러리 형식의 게시판 구현
2. 도서 상세 페이지 이동 구현
3. 검색 필터 기능 : 학년 별(유아 전체, 초등 1~6학년, 중등 1~3학년, 고등 1~3학년), 교재 이름 검색
4. 목록 정렬 : 최신등록순, 높은가격순, 낮은가격순, 리뷰많은순(구현예정), 발행일순
5. 페이징 : 보여주는 컨텐츠 개수 4*2개, 페이징 버튼 개수 5개
<img width="150" alt="스크린샷 2024-05-03 134602" src="https://github.com/cmkbeew/bookstore/assets/109284867/2116f846-a353-44c2-9307-967b19899642">
<img width="80" alt="스크린샷 2024-05-03 110132" src="https://github.com/cmkbeew/bookstore/assets/109284867/8496ab5f-8efd-48fe-a544-c7671f908cc7">


-상세 페이지

1. 정보 노출(도서 이미지, 제목, 대상, 출간일, 페이지, 정가, 판매가, 출판사, 저자, 출간일/ 교재 소개/ 출고, 배송 안내/ 취소, 교환, 반품 안내)
2. 교재 후기 노출 및 글쓰기 기능 구현
3. 장바구니 추가 기능
4. 바로 구매 기능
5. 관련 상품 노출

-결제 페이지

1. 도서 리스트 페이지 내에서 구매 가능, 장바구니 페이지 내에서 선택 상품, 전체 상품 구매 가능
2. 주문 정보 노출(상품명, 수량, 정가, 판매가, 주문 금액, 배송비)
3. 결제 정보 노출(주문 고객 정보(이름, 휴대폰번호, 이메일), 받는 고객 정보(받는 사람, 휴대폰번호, 배송지 주소), 주문금액, 배송비, 최종결제금액)
4. 택배 회사 선택 가능
5. 결제 완료 시, 관리자 페이지 배송관리에 리스트 추가

**4) 커뮤니티(담당자 : 조현기)**

4-1) 리스트 페이지(공통)

1. 게시글 상세 페이지 이동 구현
2. 검색 필터 기능 : 등록일 기준(하루, 일주일, 한 달), 게시글 제목 검색, 작성자 검색
3. 페이징 : 보여주는 컨텐츠 개수 5개, 페이징 버튼 개수 5개

4-2) 상세 페이지(공통)

1. 이전 글, 다음 글 이동 구현
2. 게시글 정보 노출(제목, 작성자, 작성일, 내용)

4-3) QnA 페이지

1. 리스트 페이지에서 글쓰기 기능 구현
2. 상세 페이지에서 본인 글 수정 및 삭제 기능 구현, 답변이 달린 경우 수정 및 삭제 불가
3. 조회수 정보 노출

**5) 자료실(담당자 : 조현기)**

-리스트 페이지

1. 게시글 상세 페이지 이동 구현
2. 검색 필터 기능 : 등록일 기준(하루, 일주일, 한 달), 게시글 제목 검색, 작성자 검색
3. 페이징 : 보여주는 컨텐츠 개수 5개, 페이징 버튼 개수 5개
4. 글쓰기 기능 구현(파일 업로드 가능)

-상세 페이지

1. 이전 글, 다음 글 이동 구현
2. 게시글 정보 노출(제목, 작성자, 작성일, 내용, 첨부파일)
3. 상세 페이지에서 본인 글 수정 및 삭제 기능 구현

**6) 마이 페이지(담당자 : 전주연)**

6-1) 내 프로필 페이지 

1. 회원 정보 노출(이메일 주소, 핸드폰번호, 주소, 평생회원 여부, 광고수신 동의 여부, 가입일)
2. 회원 정보 수정, 비밀번호 변경, 회원 탈퇴 기능

6-2) QnA 내역 페이지 : 작성한 QnA 내역 확인 기능 및 상세 페이지 이동 구현

6-3) 주문 조회 페이지

1. 주문 내역 및 결제 정보 확인 기능
2. 배송 상태(배송전, 배송중, 배송완료) 별 주문 내역 및 결제 정보 확인 기능
3. 상세 페이지 이동 구현

6-4) 장바구니 페이지

1. 장바구니 리스트 노출
2. 장바구니 수량 수정, 장바구니 삭제, 선택 상품 주문, 전체 상품 주문 기능 구현

**7) 관리자 페이지(담당자 : 강윤화)**

7-0) 커뮤니티 페이지(공지사항, FAQ, QnA 공통)

1. 커뮤니티 페이지와 동일한 기능 구현(게시글 리스트 노출, 상세 페이지 이동 구현, 검색 필터(등록일 기준, 게시글 제목, 작성자), 페이징 구현, 상세 페이지 이전 글 다음 글 이동 구)

7-1) 공지사항 페이지

1. 리스트 페이지 내에서 게시글 삭제, 상단 고정, 글쓰기 기능 구현
2. 상세 페이지에서 리스트 페이지로 이동, 게시글 수정, 게시글 삭제 기능 구현

7-2) QnA 페이지

1. 리스트 페이지 내에서 답변 쓰기 기능 구현
2. 문의글 삭제 시 답변도 함께 삭제

7-3) 회원관리 페이지

1. 리스트 페이지 내에서 메일 보내기 기능
2. 검색 필터(아이디, 이름)

7-4) 도서관리 페이지

1. 도서 상품 등록, 수정, 삭제 기능 구현

7-5) 배송관리 페이지

1. 주문 및 배송 정보 리스트 노출
2. 배송 상태(배송전, 배송중, 배송완료) 변경 기능 구현
3. 배송 상태 별 리스트 노출 기능
4. 주문 취소 요청 시 승인 기능 구현

**8) 로그인/회원가입(담당자 : 전주연)**

1. 로그인 기능 구현
2. 로그인 시, 아이디 저장 및 자동 로그인 기능 구현
3. 로그인 여부에 따라 접속 가능 페이지 구분
4. 로그인 여부에 따라 헤더 버튼  
5. 아이디 찾기 및 비밀번호 변경 기능 구현
6. 회원 가입 기능 구현
7. 회원 가입 시 유효성 검사 기능 구현
8. 아이디 중복 체크 기능 구현


   
## **🎙️발표 진행 순서**


### 1. 프로젝트 개요

### 2. 페이지 별 구현 결과 요약 발표

### 3. 프로젝트 시연

-시연 프로세스

1) 비회원 : 비회원 시 조회 가능한 페이지 확인 → 회원가입

2) 일반회원

- 아이디 찾기 → 비밀 번호 변경 → 로그인
- 주문 결제(장바구니, 바로 구매), QnA 글쓰기, 자료실 글쓰기 → 파일 업로드, 다운로드 확인
- 주문 내역, 작성 내역 확인 → 주문 취소 및 장바구니 삭제

3) 관리자

- 게시글 등록(공지사항-상단 고정 여부, FAQ, QnA 답변) → 게시글 수정 → 게시글 삭제
- 선택 이용약관 동의한 회원에 홍보 메일 발송

4) 일반회원

- 관리자가 새로 등록한 글 확인, 메일 발송 확인
