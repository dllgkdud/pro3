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
<title>투어</title>
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
					<label class="label">카테고리</label>
					<div class="select">
						<select name="cate" id="cate" class="select" onchange="changeTourNo()" required>
							<option value="">분류선택</option>
							<option value="A">테마관광</option>
							<option value="B">축제와 문화</option>
							<option value="C">문화재와 역사</option>
							<option value="D">관광과 명소</option>
							<option value="E">참여마당</option>
						</select>
						<input type="hidden" name="tourno" id="tourno" value="">
					</div>
				</div>
				<div class="field">
					<label class="label">장소</label>
					<div class="control">
						<input type="text" name="place" id="place" class="input is-info" placeholder="장소 입력" required />
					</div>
					<p class="help">장소를 입력하세요.</p>
				</div>
				<div class="field">
					<label class="label">주요설명</label>
					<div class="control">
						<textarea cols="100" rows="8" name=comment1 id="comment1" class="textarea is-info" maxlength="500" required></textarea>
					</div>
					<p class="help">장소의 주요설명을 입력하십시오.</p>
				</div>
				<div class="field">
					<label class="label">상세설명</label>
					<div class="control">
						<textarea cols="100" rows="8" name=comment2 id="comment2" class="textarea is-info" maxlength="500" required></textarea>
					</div>
					<p class="help">장소의 상세설명을 입력하십시오.</p>
				</div>
				<div class="field">
					<label class="label">이미지</label>
					<div class="control">
						<input type="hidden" name="pic1" id="pic1" value="no" />
						<button type="button" class="button is-primary" onclick="imgUpload(1)">이미지 추가</button>
					</div>
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