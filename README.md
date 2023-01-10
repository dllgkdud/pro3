<h1 align='center'><img src='https://www.ddm.go.kr/common/images/layout/logo_bi_s2022.png' style='width: 60px; height: 30px;'>&nbsp;#내가_다녀온_동대문구</h1><br/>

## 목차
 - [개요](https://github.com/dllgkdud/pro3#개요)
 - [사용자 인터페이스](https://github.com/dllgkdud/pro3#사용자-인터페이스)
 - [기술 환경](https://github.com/dllgkdud/pro3#기술-환경)
 - [시스템 구조](https://github.com/dllgkdud/pro3#시스템-구조)
 - [프로젝트 설계](https://github.com/dllgkdud/pro3#프로젝트-설계)
 - [핵심 기능](https://github.com/dllgkdud/pro3#핵심-기능)
 - [기능 구현](https://github.com/dllgkdud/pro3#기능-구현)

## 개요
코로나로 인해 축소된 관광산업의 홍보 및 주변 상업의 활성화를 위해 동대문구 문화관광 웹 애플리케이션 사이트를 주제로 구현했습니다.<br/><br/>
✔담당자 : 이하영

## 사용자 인터페이스

<details>
<summary>사용자 인터페이스</summary>

* **메인 페이지**
  * `로그인`, `회원가입`, `Ajax`로 작성된 `메뉴`로 이동합니다.

  <img width="1425" alt="메인" src="https://user-images.githubusercontent.com/112446846/211449646-97ae8fa5-97b3-4c6a-a309-be458dbbac14.png">

* **투어목록 페이지**
  * `장소`를 `검색`하고, `상세`를 `확인`하며 새로 `등록`합니다.

  <img width="1425" alt="투어 목록" src="https://user-images.githubusercontent.com/112446846/211450570-b9d5a9ba-1396-43ee-89b9-8160c067d45b.png">

* **투어상세 페이지**
  * `등록`된 장소의 `상세정보`를 `확인`하며, `수정`, `삭제`를 진행합니다.

  <img width="1425" alt="투어 상세" src="https://user-images.githubusercontent.com/112446846/211454452-1c8317fb-e1ae-448e-9118-cf043e40cd5b.png">
  
* **투어후기 페이지**
  * `등록`된 장소의 대해 간단한 `후기`를 작성하고, `별점`을 매깁니다.

  <img width="1425" alt="투어 후기" src="https://user-images.githubusercontent.com/112446846/211451203-afa33062-9f83-4cf7-9e03-aaa44ab00def.png">

</details>

## 기술 환경
 - Language(Front) : `Html5`, `CSS3`, `Javascript`, `JQuery`
 - Language(Back) : `Java`, `Jsp`
 - Editor : `Eclipse`
 - DBMS : `MariaDB`
 - DBMS Model : `MVC Level 2`
 - Framework(front) : `Bootstrap 4`
 - Framework(back) : `Spring`
 - Security : `AES256`
 - Target : `Web Browser`
 - Server : `Tomcat 8`
 - Infra : `EC2`, `RDS`
 - Etc : `Git`

## 시스템 구조
![system](https://user-images.githubusercontent.com/112446846/211471183-8f339ab6-79e7-40bd-8f69-c40532e5278b.png)

## 프로젝트 설계
### ERD
![ERD](https://user-images.githubusercontent.com/112446846/211461989-6f1c1eab-ed6d-45f8-9c12-203d8d72b00a.png)

### 메뉴설계도
![메뉴설계도](./img/0.png "동대문구_메뉴설계도")


### 스토리보드
[![스토리보드](https://user-images.githubusercontent.com/112446846/211448077-18442260-bae6-438b-a94d-cdd2f5ddb2cd.png)](https://www.youtube.com/watch?v=3jJmXVQPQD0)

### UI 프로세스
![UI](./img/UI.png "UI 프로세스")

## 핵심 기능
### 회원
 - 아이디 중복
 - 비밀번호 확인
 - 회원정보
 - 회원정보 수정

### 투어(메뉴)
 - 카테고리 목록(전체 투어 목록)
 - 투어 목록
 - 투어 상세

### 공지사항
 - 공지 목록
 - 공지 상세(조회수 책정)

### 관광 후기
 - 별점 선택
 - 후기 등록(Ajax)

### 관리자
 - 회원 목록
 - 투어 등록(카테고리)
 - 파일 업로드
 - 사진 파일명 랜덤 지정
 - 공지 등록/수정/삭제
 - 후기 등록/삭제

## 기능 구현

<details>
<summary>사용자 기능 구현</summary>

* **메인 페이지**
  * `로그인`, `회원가입`, `Ajax`로 작성된 `메뉴`로 이동합니다.

  ![메인](./img/1.png "메인")

* **카테고리 페이지**
  * `Ajax`로 작성된 `메뉴`로 이동합니다.
  ![메인](./img/2.png "카테고리")

![테마관광](./img/3.png "카테고리(테마관광)")
![테마관광](./img/4.png "상세(테마관광)")
![축제와문화](./img/5.png "카테고리(축제와문화)")
![축제와문화](./img/6.png "상세(축제와문화)")
![문화재와역사](./img/7.png "카테고리(문화재와역사)")
![문화재와역사](./img/8.png "상세(문화재와역사)")
![관광과명소](./img/9.png "카테고리(관광과명소)")
![관광과명소](./img/10.png "상세(관광과명소)")
![참여마당](./img/11.png "카테고리(참여마당)")
![참여마당](./img/12.png "상세(참여마당)")
![동대문소식](./img/13.png "공지사항목록")
![동대문소식](./img/14.png "공지사항상세")
![동대문소식](./img/15.png "공지사항수정")
![동대문소식](./img/16.png "QnA목록")
![동대문소식](./img/17.png "QnA작성")
![동대문소식](./img/18.png "이용후기목록")
![회원가입](./img/19.png "가입약관")
![회원가입](./img/20.png "가입양식")
![회원가입](./img/21.png "가입양식(아이디입력)")
![회원가입](./img/22.png "가입양식(아이디사용중)")
![회원가입](./img/23.png "가입양식(아이디사용가능)")
![로그인](./img/24.png "메인(로그인)")
![로그인](./img/25.png "메인(로그인)")
![회원정보](./img/26.png "회원정보")
![관리자](./img/27.png "관리자페이지")
![관리자](./img/28.png "관리자페이지(회원목록)")
![관리자](./img/29.pn "관리자페이지(장소목록)")
![관리자](./img/30.png "관리자페이지(이용후기목록)")
![관리자](./img/31.png "관리자페이지(투어등록)")
![관리자](./img/32.png "관리자페이지(투어등록(카테고리선택))")
![관리자](./img/33.png "관리자페이지(투어등록(사진등록))")

</details>