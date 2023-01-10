<h1 align='center'><img src='https://www.ddm.go.kr/common/images/layout/logo_bi_s2022.png' style='width: 60px; height: 30px;'>&nbsp;#내가_다녀온_동대문구</h1><br/>

## 목차
 - [개요](https://github.com/dllgkdud/pro3#-개요)
 - [사용자 인터페이스](https://github.com/dllgkdud/pro3#-사용자-인터페이스)
 - [기술 환경](https://github.com/dllgkdud/pro3#-기술-환경)
 - [프로젝트 설계](https://github.com/dllgkdud/pro3#-프로젝트-설계)

## 개요
코로나로 인해 축소된 관광산업의 홍보 및 주변 상업의 활성화를 위해 동대문구 문화관광 웹 애플리케이션 사이트를 주제로 구현했습니다.<br/>
담당자 : 이하영
![site-gif]( "동대문구 사이트")

## 사용자 인터페이스
![스토리보드](https://www.youtube.com/watch?v=3jJmXVQPQD0)

## 기술 환경
 - Language(Front) : `Html5`, `CSS3`, `Javascript`, `JQuery`
 - Language(Back) : `Java`, `Jsp`
 - Tool : `Eclipse`
 - DBMS : `MariaDB`
 - DBMS Model : `MVC Level 2`
 - Framework(front) : `Bootstrap 4`
 - Framework(back) : `Eclipse`
 - Security : `AES256`
 - Target : `Web Browser`
 - Server : `Tomcat 8`
 - Infra : `EC2`, `RDS`
 - Etc : `Git`

## 프로젝트 설계
### 1. 클래스 설계
    1-1. 메뉴설계도
![메뉴설계도](./img/0.png "동대문구_메뉴설계도")

	1-2. Task Flow
![TaskFlow](./img/taskflow.PNG "Task_Flow")

### 2. 화면 설계
	2-1. 스토리보드()
![스토리보드](./img/vdo/1.mp4 "스토리보드")
    
    2-2. UI 프로세스
![UI](./img/UI.png "UI 프로세스")

	2-3. 스토리보드
![메인](./img/001.PNG "메인")
![로그인](./img/002.PNG "로그인")
![회원가입](./img/003.PNG "회원가입(약관동의)")
![회원가입](./img/004.PNG "회원가입(가입양식)")
![메인](./img/005.PNG "메인(로그인)")
![카테고리](./img/006.PNG "테마관광")
![카테고리](./img/007.PNG "테마관광(세부)")
![카테고리](./img/008.PNG "축제와문화")
![카테고리](./img/009.PNG "축제와문화(세부)")
![카테고리](./img/010.PNG "문화재와역사")
![카테고리](./img/011.PNG "문화재와역사(세부)")
![카테고리](./img/012.PNG "관광과명소")
![카테고리](./img/013.PNG "관광과명소(세부)")
![카테고리](./img/014.PNG "참여마당")
![카테고리](./img/015.PNG "참여마당(세부)")
![카테고리](./img/016.PNG "공지사항")
![카테고리](./img/017.PNG "공지사항(세부)")

### 3. 기능 구현
	3-1. 기능 구현
![메인](./img/1.png "메인")
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
