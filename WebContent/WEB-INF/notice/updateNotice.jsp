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
<title>공지사항</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
</head>
<body>
	<jsp:include page="/header.jsp" />
	<section class="section">
		<div class="container">
			<h1 class="title">공지사항 수정</h1>
			<form action="${path1 }/AddNoticeCtrl.do" method="post">
				<table class="table">
					<tbody>  
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" id="title" class="input is-info" placeholder="제목" value="${dto.title }" required></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea cols="100" rows="8" name="content" id="content" class="input is-info" maxlength="800" placeholder="내용" value="${dto.content }" required></textarea></td>
						</tr>
					</tbody>
				</table>
			</form>
			<div class="buttons">
				<a href="${path1 }/GetNoticeListCtrl.do" class="button is-light">목록</a>
				<button type="reset" class="button is-primary">취소</button>
				<button type="submit" class="button is-primary">수정</button>
			</div>
		</div>
	</section>
	<jsp:include page="/footer.jsp" />
</body>
</html>