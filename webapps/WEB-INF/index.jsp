<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>  
<c:set var="path1" value="${request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문화관광</title>
	<!-- css -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
	<!-- font -->
	<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<style>
.hero .has-background {
    position: relative;
    overflow: hidden;
}
.hero-background {
    position: absolute;
    object-fit: cover;
    object-position: center center;
    width: 100%;
    height: 100%;
}
.is-transparent {
	opacity: 0.6
}
.sns_list {
	position: relative;
    margin-top: 60px;
}
.sns_link img {
	margin-right: 1em;
}
</style>
<body>
<section class="hero is-light is-fullheight has-background">
	<!-- Header -->
	<div class="hero-head">
		<jsp:include page="${path1 }/header.jsp" />
	</div>
	<!-- MainPage1 -->
	<img class="hero-background is-transparent" src="./data/visual_bg.png" />
	<div class="hero-body">
		<div class="container has-text-centered">
			<div class="container has-text-left">
				<p class="title">동대문구<br>문화관광 페이지</p>
				<p class="subtitle" style="font-size:16px; padding-left: 1em;">
					${user }님의 테스트 화면입니다.
				</p>
			</div>
			<div class="container has-text-right">
				<img src="./data/visual1.png">
			</div>
		</div>
	</div>
	<!-- MainPage2 -->
	<div class="hero-body">
		<div class="container has-text-centered">
			<div class="container has-text-centered">
				<p class="title">#내가 다녀온 동대문구</p>
			</div>
			<div class="container has-text-centered">
				<ul class="sns_list">
					<li class="sns_item">
						<a href="" class="sns_link"><img src="./data/sns1.png"><span class="snstitle" >장안벚꽃길</span></a>
						<a href="" class="sns_link"><img src="./data/sns2.png"><span class="snstitle">청계천</span></a>
						<a href="" class="sns_link"><img src="./data/sns3.png"><span class="snstitle">배봉산</span></a>
						<a href="" class="sns_link"><img src="./data/sns4.png"><span class="snstitle">세종대왕 기념관</span></a>
						<a href="" class="sns_link"><img src="./data/sns5.png"><span class="snstitle">선농단</span></a>
						<a href="" class="sns_link"><img src="./data/sns6.png"><span class="snstitle">중앙박물관</span></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
  <!-- Footer -->
	<div class="hero-foot">
		<jsp:include page="${path1 }/footer.jsp" />
	</div>
</section>
</body>
</html>