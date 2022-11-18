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
<title>장소</title>
<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<!-- font -->
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<style>
abbr {
	text-decoration: none;
	padding-right: 100px;
}
.breadcrumb {
	border-bottom: 1px solid #ddd; 
	padding-bottom: 8px; 
	padding-left: 20px;
	min-height: 48px; 
	line-height: 48px;
}
.inline {
	margin-right: 1rem;
}
</style>
<body>
<jsp:include page="/header.jsp" />
	<nav class="breadcrumb" aria-label="breadcrumbs">
	  <ul>
	    <li><a href="${path1 }/">홈</a></li>
	    <li><a href="${path1 }/GetTourListCtrl.do">장소</a></li>
	  </ul>
	</nav>
	<section class="section">
	    <div class="container">
			<h1 class="title">장소목록</h1>
			<form action="${path1 }/GetSearchCtrl.do" name="frm" id="frm" class="tile is-parent notification is-light search-form" method="get">
				<div class="select inline">
					<select name="sel" id="sel" class="select" required>
						<option value="">선택</option>
						<option value="place">장소</option>
						<option value="comment2">내용</option>
					</select>
				</div>
				<input type="text" name="keyword" id="keyword" class="input inline" style="width:300px;" placeholder="검색단어 입력">
				<input type="submit" class="button is-light inline" value="조회">
			</form>
			<table class="table">
			  <thead>
			    <tr>
			      <th><abbr title="Num">No</abbr></th>
			      <th><abbr title="Cate">Category</abbr></th>
			      <th><abbr title="Place">Place</abbr></th>
			    </tr>
			  </thead>
			   <tbody>
			   <c:forEach items="${list }" var="dto" varStatus="status">
			    <tr>
			      <td>${status.count }</td>
			      <td>
					<c:set var="cate" value="${dto.cate }" /> 
					<c:if test="${cate eq 'A' }">
					<span>테마관광</span>
					</c:if>
					<c:if test="${cate eq 'B' }">
					<span>축제와 문화</span>
					</c:if>
					<c:if test="${cate eq 'C' }">
					<span>문화재와 역사</span>
					</c:if>
					<c:if test="${grade eq 'D' }">
					<span>관광과 명소</span>
					</c:if>
					<c:if test="${cate eq 'E' }">
					<span>참여마당</span>
					</c:if>
			      </td>
			      <td>
			      	<a href="${path1 }/GetTourDetailCtrl.do?no=${dto.no }">${dto.place }</a>
				  </td>
			    </tr>
			    </c:forEach>
				<c:if test="${empty list }">
			    <tr>
			    	<td colspan="3">데이터가 존재하지 않습니다.</td>
			    </tr>
			    </c:if>
			  </tbody>
			</table>
			<c:if test='${sid.equals("admin") }'>
			<div class="buttons">
			  <a href="${path1 }/tour/addTour.jsp" class="button is-primary">등록</a>
			</div>
			</c:if>
		</div>
	</section>
<jsp:include page="/footer.jsp" />
</body>
</html>