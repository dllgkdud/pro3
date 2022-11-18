<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
</head>
<style>
.table {
	text-align: center;
}
.input {
	width: 300px;
	margin-bottom: 1rem;
}
</style>
<body>
	<jsp:include page="/header.jsp" />
	<section class="section">
		<div class="container">
			<h1 class="title">로그인</h1>
			<form action="${path1 }/UserLoginCtrl.do" method="post">
				<div class="table">
					<input type="text" name="id" id="id" class="input is-info is-rounded " placeholder="아이디" required>
					<c:if test="${empty msg }">
						<p></p>
					</c:if>
					<c:if test="${not empty msg }">
						<p>${msg }</p>
					</c:if>
					<input type="password" name="pw" id="pw" class="input is-info is-rounded " placeholder="비밀번호" required>
				</div>
				<div class="buttons">
					<button type="reset" class="button is-primary">취소</button>
					<button type="submit" class="button is-primary">로그인</button>
					<a href="${path1 }/user/agree.jsp" class="button is-light">회원가입</a>				
				</div>
			</form>				
		</div>
	</section>
	<jsp:include page="/footer.jsp" />
</body>
</html>