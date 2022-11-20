<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path0" value="${pageContext.request.contextPath }" /> 
<style>
.navbar-item img {
	max-height: none;
}
#gnb .navbar-link::after { 
	content: ""; 
	display: none; 
}
.navbar-dropdown.cate {
	min-width: 1900px;
	width: 100%;
	position: absolute;
	left: -150px;
}
.navbar-dropdown.cate a {
	display: inline-block; 
	padding: 8px;
	margin-right: 20px;  
	width: 200px; 
	text-overflow: ellipsis; 
	overflow: hidden; 
	white-space: nowrap; 
	font-weight: 500;
	text-align: center;
}
.container:not(.is-max-desktop):not(.is-max-widescreen) {
	max-width: 1900px;
}
</style>
<div id="nav-group">
	<nav class="navbar" role="navigation" aria-label="main navigation">
		<div class="navbar-brand">
			<a class="navbar-item" href="<%=request.getContextPath() %>/">
			<img src="	https://www.ddm.go.kr/common/images/layout/logo_bi_s2022.png" width="144" height="72">
			</a>
	
		<a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
			<span aria-hidden="true"></span>
			<span aria-hidden="true"></span>
			<span aria-hidden="true"></span>
		</a>
		</div>

		<div id="navbarBasicExample" class="navbar-menu">
			<div class="navbar-start" id="gnb">
				<div class="navbar-item has-dropdown is-hoverable" >
					<a href="${path0 }/GetTourCateListCtrl.do?cate=A" class="navbar-link is-arrowless">테마관광</a>
					<div class="navbar-dropdown cate" id="cate1">
						
					</div>
				</div>
				<div class="navbar-item has-dropdown is-hoverable" >
				  <a href="${path0 }/GetTourCateListCtrl.do?cate=B" class="navbar-link is-arrowless">축제와 문화</a>
				  <div class="navbar-dropdown cate" id="cate2">
				    
				  </div>
				</div>
				<div class="navbar-item has-dropdown is-hoverable">
				  <a href="${path0 }/GetTourCateListCtrl.do?cate=C" class="navbar-link is-arrowless">문화재와 역사</a>
				  <div class="navbar-dropdown cate" id="cate3">
				    
				  </div>
				</div>
				<div class="navbar-item has-dropdown is-hoverable">
				  <a href="${path0 }/GetTourCateListCtrl.do?cate=D" class="navbar-link is-arrowless">관광과 명소</a>
				  <div class="navbar-dropdown cate" id="cate4">
				    
				  </div>
				</div>
				<div class="navbar-item has-dropdown is-hoverable">
				  <a href="${path0 }/GetTourCateListCtrl.do?cate=E" class="navbar-link is-arrowless">참여마당</a>
				  <div class="navbar-dropdown cate" id="cate5">
						
				  </div>
				</div>
				<div class="navbar-item has-dropdown is-hoverable single">
					<a class="navbar-link">동대문소식</a>
					<div class="navbar-dropdown single">
					     <a class="navbar-item" href="<%=request.getContextPath() %>/GetNoticeListCtrl.do">공지사항</a>
					     <a class="navbar-item" href="<%=request.getContextPath() %>/GetQnaListCtrl.do">QnA</a>
					     <a class="navbar-item" href="">여행후기</a>			     
				    </div> 
				</div>
			</div>
		
		    <div class="navbar-end" id="tnb">
		      <div class="navbar-item">
		      	<c:if test="${empty sid }">
			        <div class="buttons">
			          <a class="button is-primary" href="<%=request.getContextPath() %>/user/userAgree.jsp"><strong>회원가입</strong></a>
			          <a class="button is-light" href="<%=request.getContextPath() %>/UserLoginCtrl.do">로그인</a>
			        </div>
		        </c:if>
		        <c:if test="${not empty sid }">
					<div class="buttons">
						<a class="button is-primary" href="<%=request.getContextPath() %>/UserInfoCtrl.do"><strong>회원정보</strong></a>
						<a class="button is-light" href="<%=request.getContextPath() %>/UserLogoutCtrl.do">로그아웃</a>
						<c:if test='${sid.equals("admin") }'>
							<a class="button is-light" href="<%=request.getContextPath() %>/AdminCtrl.do">관리자</a>
						</c:if>
			        </div>
		        </c:if>
		      </div>
		    </div>
	    </div>
	</nav>
	<script>
	$(document).ready(function(){
		$.ajax({
			url:"${path0 }/MenuCtrl.do",
			type:"post",
			entype:"UTF-8",
			datatype:"json",
			processData:false,
			contentType:false,
			cache:false,
			success:function(data){
				$(".navbar-dropdown.cate").empty();
				var trans = $.parseJSON(data);
				console.log(trans);
				$.each(trans, function(key, value){
					if(key=="data"){
						for(var i=0;i<value.length;i++){
							if(value[i].cate=="A"){
								$("#cate1").append("<a href='${path0 }/GetTourDetailCtrl.do?no="+value[i].no+"'>"+value[i].place+"</a>");
							} else if(value[i].cate=="B"){
								$("#cate2").append("<a href='${path0 }/GetTourDetailCtrl.do?no="+value[i].no+"'>"+value[i].place+"</a>");
							} else if(value[i].cate=="C"){
								$("#cate3").append("<a href='${path0 }/GetTourDetailCtrl.do?no="+value[i].no+"'>"+value[i].place+"</a>");
							} else if(value[i].cate=="D"){
								$("#cate4").append("<a href='${path0 }/GetTourDetailCtrl.do?no="+value[i].no+"'>"+value[i].place+"</a>");
							} else if(value[i].cate=="E"){
								$("#cate5").append("<a href='${path0 }/GetTourDetailCtrl.do?no="+value[i].no+"'>"+value[i].place+"</a>");
							}
						}
					}
				});
			}
		});
	});
	</script>
</div>	