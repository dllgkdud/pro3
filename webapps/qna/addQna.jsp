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
<title>묻고 답하기</title>
<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<!-- font -->
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<jsp:include page="/header.jsp" />
	<section class="section">
		<div class="container">
			<h2 class="title">투어 등록</h2>
			<form name="frm" id="frm" action="${path1 }/AddTourCtrl.do" method="post" onsubmit="return tourCheck(this)">
				<div class="field">
					<label class="label">제목</label>
					<div class="control">
						<input type="text" name="title" id="title" class="input is-info" placeholder="제목 입력" required />
					</div>
					<p class="help">제목를 입력하세요.</p>
				</div>
				<div class="field">
					<label class="label">제목</label>
					<div class="control">
						<input type="text" name="place" id="place" class="input is-info" placeholder="장소 입력" required />
					</div>
					<p class="help">제목을 입력하세요.</p>
				</div>
				<div class="field">
					<label class="label">내용</label>
					<div class="control">
						<textarea cols="100" rows="8" name="content" id="content" class="textarea is-info" maxlength="500" required></textarea>
					</div>
					<p class="help">내용을 입력하십시오.</p>
				</div>
				<div class="buttons">			
					<input type="reset" name="reset-btn" class="button button-info" value="취소">
					<input type="submit" name="submit-btn" class="button button-info" value="등록">					
				</div>
			</form>
			<script>
			function changeTourNo() {
				var cate = document.frm.cate.value;
				if(cate=="") {
					alert("분류를 선택하지 않아 테마관광으로 지정됩니다.");
					cate="A"
				}
				//마지막 레코드 번호를 호출한다.
				$.ajax ({
					url : "${path1 }/NoLoadCtrl.do",
					type : "post",
					dataType : "json",
					success : function(data) {
						console.log(data.no);
						$("#tourno").val(cate + data.no);
					}
				});
			}
			function imgUpload(no){
				var tourno = document.frm.tourno.value;
				if(tourno==""){
					alert("카테고리를 선택하여 주십시오.");
					return;
				}
				var win1 = window.open("imgUpload.jsp?no="+no+"&tourno="+tourno,"win","width=700, height=500");
			}
			</script>
			<script>
			function tourCheck(f){
				if(f.pic1.value!="yes"){
					alert("이미지를 등록하여 주십시오.");
					return;
				}
			}
			</script>
		</div>
	</section>
<jsp:include page="/footer.jsp" />
</body>
</html>