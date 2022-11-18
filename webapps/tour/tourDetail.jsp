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
<title>장소상세</title>
<!-- css -->
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
</style>
<body>
 <jsp:include page="/header.jsp" />
	<nav class="breadcrumb" aria-label="breadcrumbs">
	  <ul>
	    <li><a href="${path1 }/">홈</a></li>
	    <li><a href="${path1 }/GetTourListCtrl.do">장소</a></li>
	  </ul>
	</nav>
    <div class="container is-full">
		<img src="${path1 }/data/banner1.jpg"/>
	</div>
	<section class="section">
    <div class="container">
		<h1 class="title">장소 상세</h1>
      	<div id="con">
      		<table class="table">
      			<c:if test="${not empty list }">
      			<tr>
				<c:forEach items="${list }" var="pic" varStatus="status">
				<td>
					<img src="upload/${pic.picname }" class="lazy" onerror="this.style.display='none'" alt="배너" />
					<!-- onerror="this.style.display='none'"  -->
	      		</td>
				</c:forEach>	
		    	</tr>
		    	</c:if>
				<c:if test="${empty list }">
			    <tr>
			    	<td>해당 이미지가 없습니다.</td>
			    </tr>
			    </c:if>
			</table>
      	</div>
		<table class="table">
		   <tbody>
		    <tr>
		      <th>번호</th>
		      <td>${dto.no }</td>
		    </tr>
		    <tr>
		      <th>분류</th>
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
		    </tr>
		    <tr>
		      <th>투어번호</th>
		      <td><p>${dto.tourno }</p>
		      	<input type="hidden" name="tourno" id="tourno" value="${dto.tourno }" />
		      </td>
		    </tr>
		    <tr> 
		      <th>장소</th>
		      <td>${dto.place }</td>	
		    </tr>
		    <tr>
		      <th>주요설명</th>
		      <td><p>${dto.comment1 }</p></td>
		    </tr>
		    <tr>
		      <th>상세설명</th>
		      <td><p>${dto.comment2 }</p></td>
		    </tr>
		  </tbody>
		</table>
		<div class="buttons">
		  <a href="${path1 }/GetTourListCtrl.do" class="button is-primary">투어 목록</a>
		  <a href="${path1 }/GetTourCateListCtrl.do?cate=${dto.cate }" class="button is-light">카테고리 목록</a>
		  <c:if test='${sid.equals("admin") }'>
			  <a href="${path1 }/DeleteTourCtrl.do?no=${dto.no }" class="button is-light">장소 삭제</a>
			  <a href="${path1 }/UpdateTourCtrl.do?no=${dto.no }" class="button is-light">장소 수정</a>
		  </c:if>
		</div>
    </div>
  </section>
  <script>
  //image Lazy Loading : 실제로 사용자 화면에 보여질 필요가 있을 때까지 이미지 로딩을 지연하는 것으로 네트워크 대역폭을 줄이는 방법
  /* document.addEventListener("DOMContentLoaded", function() {
	  var lazyloadImages = document.querySelectorAll("img.lazy");    
	  var lazyloadThrottleTimeout;
	  
	  function lazyload () {
	    if(lazyloadThrottleTimeout) {
	      clearTimeout(lazyloadThrottleTimeout);
	    }    
	    
	    lazyloadThrottleTimeout = setTimeout(function() {
	        var scrollTop = window.pageYOffset;
	        lazyloadImages.forEach(function(img) {
	            if(img.offsetTop < (window.innerHeight + scrollTop)) {
	              img.src = img.dataset.src;
	              img.classList.remove('lazy');
	            }
	        });
	        if(lazyloadImages.length == 0) { 
	          document.removeEventListener("scroll", lazyload);
	          window.removeEventListener("resize", lazyload);
	          window.removeEventListener("orientationChange", lazyload);
	        }
	    }, 20);
	  }
	  
	  document.addEventListener("scroll", lazyload);
	  window.addEventListener("resize", lazyload);
	  window.addEventListener("orientationChange", lazyload);
	}); */
  </script>
 <jsp:include page="/footer.jsp" />	
</body>
</html>