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
<title>카테고리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<!-- font -->
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<style>
.breadcrumb {
	border-bottom:1px solid #ddd; 
	padding-bottom:8px; 
	padding-left:20px;
	min-height:48px; 
	line-height:48px;
}
.container, #con {
 	padding-bottom:40px;
}
.title {
	font-size: 25px;
}
.item_com {
	text-overflow: ellipsis; 
	overflow: hidden; 
	white-space: nowrap;
	margin: 10px;
}
</style>
<body>
 <jsp:include page="/header.jsp" />
 	<nav class="breadcrumb" aria-label="breadcrumbs">
	  <ul>
	    <li><a href="${path1 }/">홈</a></li>
	    <li><a href="${path1 }/GetTourCateListCtrl.do">카테고리</a></li>
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
			<h1 class="title">투어
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
			</h1>
		</div>
		<div id="con">
			<div class="tile is-ancestor columns">
				<c:if test="${not empty list }">
				<c:forEach items="${list }" var="dto" varStatus="status">
					<div class="tile is-3 is-vertical" style="box-sizing:border-box;">
			        <article class="tile is-child notification" style="background-color:transparent; border:1px solid #eee; margin-right:10px!important;">
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
			          <div class="content">
			          	<p class="item_com">${dto.comment2 }</p>
			          </div>
			          <a href="${path1 }/GetTourDetailCtrl.do?no=${dto.no }" class="button is-primary">자세히 보기</a>
			        </article>
			      </div>
				</c:forEach>	
		    	</c:if>
				<c:if test="${empty list }">
			      <div class="tile is-parent">
			        <article class="tile is-child notification is-light">
			          <p class="title">해당 목록이 존재하지 않습니다.</p>
			        </article>
			      </div>
			    </c:if>
			</div>
		</div>
		<div class="buttons">
		  <a href="${path1 }/GetTourListCtrl.do" class="button is-primary">장소 목록</a>
		</div>
	</section>
<jsp:include page="/footer.jsp" />
</body>
</html>