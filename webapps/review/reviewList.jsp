<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용후기</title>
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
	    <li><a href="${path1 }/GetReviewListCtrl.do">이용후기</a></li>
	  </ul>
	</nav>
	<section class="section">
		<div class="container">
			<h1 class="title">QnA 목록</h1>
			<table class="table">
				<thead>
					<tr>
						<th><abbr title="Place">Place</abbr></th>
						<th><abbr title="Content">Content</abbr></th>
						<th><abbr title="Author">Id</abbr></th>						
						<th><abbr title="RegDate">RegDate</abbr></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="dto" varStatus="no">
					<tr>
						<td><span>${dto.parno }</span></td>
						<td>
							<input type="hidden" name="no" id="no" value="${dto.no }" />
							<h3>${dto.place }</h3>
							<br>
		      				<img src="${path1 }/upload/${dto.imgURL }" alt="${dto.tourno }" />
						</td>
						<td>
							<div>${dto.content }</div>
						</td>
						<td>${dto.id }</td>
						<td>
							<div>
								<c:set var="string1" value="${dto.id }"/>
			      				<c:set var="length" value="${fn:length(string1)}"/>
			      				<c:set var="string2" value="${fn:substring(string1, 0, length-3)}" />
			      				${string2}<c:forEach var="i" begin="1" end="${length - 2 }"><span>*</span></c:forEach>
			      			</div>
			      			<div>
					      		<input type="hidden" name="rate" id="rate" />
					      		<div class="star_data" style="width:${dto.rate*20 }px"></div>
					      	</div>
						</td>
						<td>
							<fmt:parseDate value="${dto.regDate }" var="regdate" pattern="yyyy-MM-dd"></fmt:parseDate>
							<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
						</td>
					</tr>
					</c:forEach>
					<c:if test="${empty list }">
						<tr><td colspan="4">이용 후기가 존재하지 않습니다.</td></tr>
					</c:if>
				</tbody>
			</table>
			<c:if test='${not empty sid || sid.equals("admin")}'>		
				<table class="table">
					<tbody>
						<tr>
							<td style="width:160px">
								<div class="select">
								  <select name="cate" id="cate" class="select" onchange="changeTourNo()" style="width:150" required>
								  	<option value="">분류선택</option>
									<option value="A">테마관광</option>
									<option value="B">축제와 문화</option>
									<option value="C">문화재와 역사</option>
									<option value="D">관광과 명소</option>
									<option value="E">참여마당</option>
								  </select>
								</div>
								<div class="select">
									<select name="tourno" id="tourno" style="width:150" required>
										<option value="">선택</option>
										
									</select>
								</div>
							</td>
							<td style="width:100px">
								<input type="radio" name="rate" id="star10" class="hidden_item" value="5" checked>
								<input type="radio" name="rate" id="star9" class="hidden_item" value="4.5">
								<input type="radio" name="rate" id="star8" class="hidden_item" value="4">
								<input type="radio" name="rate" id="star7" class="hidden_item" value="3.5">
								<input type="radio" name="rate" id="star6" class="hidden_item" value="3">
								<input type="radio" name="rate" id="star5" class="hidden_item" value="2.5">
								<input type="radio" name="rate" id="star4" class="hidden_item" value="2">
								<input type="radio" name="rate" id="star3" class="hidden_item" value="1.5">
								<input type="radio" name="rate" id="star2" class="hidden_item" value="1">
								<input type="radio" name="rate" id="star1" class="hidden_item" value="0.5">
								<input type="hidden" name="starpoint" id="starpoint" value="">
								<div id="star_group">
									<div id="stardate">
										<div id="starrate"></div>
									</div>
									<div class="star_btn" id="star_btn">
										<label for="star1"></label>
										<label for="star2"></label>
										<label for="star3"></label>
										<label for="star4"></label>
										<label for="star5"></label>
										<label for="star6"></label>
										<label for="star7"></label>
										<label for="star8"></label>
										<label for="star9"></label>
										<label for="star10"></label>
									</div>
								</div>
							</td>
							<td style="min-width:400px">
								<input type="text" name="content" id="content" class="input" placeholder="후기 한 마디" required>
							</td>
							<td>
								<div class="buttons">
									<button type="button" class="button is-primary" onclick="addReview()">작성</button>
									<c:if test='${sid.equals("admin")}'>
							      		<a href="${path1 }/DeleteReviewCtrl.do?no=${dto.no }" class="button is-primary">삭제</a>
							      	</c:if>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</c:if>
		</div>
		<script>
	    $(document).ready(function(){
	    	
	    	$("#content").on("click", function(){
	    		if($("#tourno").val()==""){
	    			alert("방문 장소를 먼저 고르시기 바랍니다.");
	    		}
	    	});
	    	
	    	$("#star_btn label").click(function(){
	    		if($("#tourno").val()==""){
	    			alert("방문 장소를 먼저 고르시기 바랍니다.");
	    			$("#tourno").focus();
	    		} else {
	    			$("#starpoint").val(($(this).index()+1)/2);
	    		}
	    	});
	    });
	    function changeTourNo(){
	    	var ct = $("#cate").val(); 
	    	if(ct==""){
	    		alert("카테고리를 먼저 선택하시기 바랍니다.");
	    		return;
	    	}
	    	var params = { cate : ct }
			$.ajax({
				url:"${path1 }/CateLoadCtrl.do",
				type:"POST",
				enctype:"application/json",
				data:params,
				datatype:"json",
				success:function(result){
					$("#tourno").empty();
					$("#tourno").append("<option value=''>선택</option>");
					var trans = result;
					console.log(trans);
					$.each(trans, function(key, value){
						if(key=="result"){
							for(var i=0;i<value.length;i++){
								$("#tourno").append("<option value='"+value[i].tourno+"'>"+value[i].place+"</option>");
							}
						}
					});				
				}
			});
	    }
	    function addReview(){
	    	var ct = $("#cate").val();
	    	var tour = $("#tourno").val();
	    	var con = $("#content").val();
	    	var starpoint = $("#starpoint").val();
	    	if(ct==""){
	    		alert("카테고리를 먼저 선택하시기 바랍니다.");
	    		return;
	    	}
	    	if(tour==""){
	    		alert("방문 장소를 먼저 선택하시기 바랍니다.");
	    		return;
	    	}
	    	if(con==""){
	    		alert("내용을 입력하시기 바랍니다.");
	    		return;
	    	}
	    	if(starpoint==""){
	    		alert("별점을 먼저 선택하여 주시기 바랍니다.");
	    		return;
	    	}
	    	var params = {	cate : ct, tourno : tour, content : con, rate :	starpoint }
			$.ajax({
				url:"${path1 }/AddReviewCtrl.do",
				type:"POST",
				enctype:"application/json",
				data:params,
				datatype:"json",
				success:function(result){
					var trans = result;
					location.href = "${path1 }/GetReviewListCtrl.do";	
				}
			});
	    }
	    </script>
	</section>
<jsp:include page="/footer.jsp" />
</body>
</html>