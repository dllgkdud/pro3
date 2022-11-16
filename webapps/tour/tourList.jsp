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
</head>
<body>
<jsp:include page="/header.jsp" />
	<nav class="breadcrumb" aria-label="breadcrumbs" style="border-bottom:2px solid #ddd; padding-bottom:8px; min-height:48px; line-height:48px;">
	  <ul>
	    <li><a href="${path1 }/"><i class="ri-home-5-line"></i></a></li>
	    <li class="is-active"><a href="#" aria-current="page">장소목록</a></li>
	  </ul>
	</nav>
	<section class="section">
	    <div class="container">
			<h1 class="title">장소 목록</h1>
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
					<span>관광</span>
					</c:if>
					<c:if test="${cate eq 'B' }">
					<span>체험</span>
					</c:if>
					<c:if test="${cate eq 'C' }">
					<span>행사</span>
					</c:if>
					<c:if test="${grade eq 'D' }">
					<span>축제</span>
					</c:if>
					<c:if test="${cate eq 'E' }">
					<span>숙박</span>
					</c:if>
					<c:if test="${cate eq 'F' }">
					<span>음식</span>
					</c:if>
					<c:if test="${cate eq 'G' }">
					<span>쇼핑</span>
					</c:if>
					<c:if test="${cate eq 'H' }">
					<span>기타</span>
					</c:if>
			      </td>
			      <td>
			      	<a href="${path1 }/GetTourDetailCtrl.do?no=${dto.no }">${dto.place }</a>
				  </td>
			    </tr>
			    </c:forEach>
				<c:if test="${empty list }">
			    <tr>
			    	<td colspan="3">해당 데이터 목록이 없습니다.</td>
			    </tr>
			    </c:if>
			  </tbody>
			</table>
			<c:if test='${sid.equals("admin") }'>
			<div class="buttons">
			  <a href="${path1 }/tour/addTour.jsp" class="button is-success">장소 등록</a>
			</div>
			</c:if>
		</div>
	</section>
<jsp:include page="/footer.jsp" />
</body>
</html>