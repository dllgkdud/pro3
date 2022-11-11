<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<%-- <c:set var="path1" value="${request.contextPath }" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지사항</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
</head>
<style>
abbr {
	text-decoration: none;
}
</style>
<body>
	<jsp:include page="/header.jsp" />
	<section class="section">
		<div class="container">
			<h1 class="title">공지사항 목록</h1>
			<table class="table">
				<thead>
					<tr>
						<th><abbr title="No">No</abbr></th>
						<th><abbr title="Title">Title</abbr></th>
						<th><abbr title="RegDate">RegDate</abbr></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="dto" varStatus="no">  
					<tr>
						<td>${no.count }</td>
						<td><a href="${path1 }/GetNoticeCtirl.do?no=${dto.no }">${dto.title }</a></td>
						<td>
							<fmt:parseDate value="${dto.regDate }" var="regdate" pattern="yyyy-MM-dd"></fmt:parseDate>
							<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="buttons">
				<a href="${path1 }/notice/addNotice.jsp" class="button is-primary">작성</a>
			</div>
		</div>
	</section>
	<jsp:include page="/footer.jsp" />
</body>
</html>