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
	opacity: 0.3
}
.cover {
	opacity: 0;
    width: 100%;
    height: 100%;
    background-repeat: no-repeat;
    background-size: cover;
    transition: all 2s;
}
</style>
<body>
<section class="hero is-light is-fullheight has-background">
	<!-- Hero head: will stick at the top -->
	<div class="hero-head">
		<jsp:include page="${path1 }/header.jsp" />
	</div>
	<!-- Hero content: will be in the middle -->
	<img class="hero-background is-transparent" src="./data/visual_bg.png" />
	<div class="hero-body">
		<div class="container has-text-centered">
			<p class="title">
			Title
			</p>
			<p class="subtitle">
				Subtitle
			</p>			
		</div>
	</div>
  <!-- Hero footer: will stick at the bottom -->
	<div class="hero-foot">
		<jsp:include page="${path1 }/footer.jsp" />
	</div>
</section>
</body>
</html>