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
<style>
.breadcrumb {
	border-bottom:1px solid #ddd; 
	padding-bottom:8px; 
	padding-left:20px;
	min-height:48px; 
	line-height:48px;
}
</style>
<body>
 <jsp:include page="/header.jsp" />
 	<nav class="breadcrumb" aria-label="breadcrumbs">
	  <ul>
	    <li><a href="${path1 }/">홈</a></li>
	    <li><a href="${path1 }/GetTourCateListCtrl.do">전체장소</a></li>
	    <li class="is-active">
	    	<a href="#" aria-current="page">
	    		<c:set var="cate" value="${placeCate }" /> 
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
	    	</a>
	    </li>
	  </ul>
	</nav>
	<section class="section">
		<div class="container">
			<h1 class="title">장소 카테고리</h1>
			<div id="con">
				<c:if test="${not empty list }">
				<c:forEach items="${list }" var="dto" varStatus="status">
					<div class="tile is-3" style="box-sizing:border-box;">
			        <article class="tile is-child is-one-third notification" style="background-color:transparent; border:1px solid #eee; margin-right:10px!important;">
			          <p class="title">${dto.place }</p>
			          <p class="subtitle">
			 			<c:set var="cate" value="${placeCate }" /> 
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
			          </p>
			          <figure class="image is-4by3">
			            <img src="${path1 }/upload/${dto.imgURL }" alt="${dto.place }">
			          </figure>
			          <div class="content" style="margin:10px;">
			          	<p class="item_com">${dto.comment2 }</p>
			          </div>
			          <a href="${path1 }/GetTourDetailCtrl.do?no=${dto.no }" class="button is-primary">자세히 보기</a>
			        </article>
			      </div>
				</c:forEach>	
		    	</c:if>
				<c:if test="${empty list }">
			      <div class="tile is-parent">
			        <article class="tile is-child notification is-info">
			          <p class="title">해당 투어가 존재하지 않습니다.</p>
			        </article>
			      </div>
			    </c:if>
			</div>
      	</div>
		<div class="buttons">
		  <a href="${path1 }/GetTourListCtrl.do" class="button is-info">장소 목록</a>
		</div>
	</section>
<jsp:include page="/footer.jsp" />
</body>
</html>