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
			<h2 class="title">투어 추가</h2>
			<form name="frm" id="frm" action="${path1 }/AddTourCtrl.do" method="post" enctype="multipart/form-data">
				<table class="table">
					<tbody>
						<tr>
							<th>카테고리</th>
							<td>
								<select name="cate" id="cate" class="select" >
									<option value="cate1" id="cate1">테마관광</option>
									<option value="cate2" id="cate2">축제와 문화</option>
									<option value="cate3" id="cate3">문화재와 역사</option>
									<option value="cate4" id="cate4">관광과 명소</option>
									<option value="cate5" id="cate5">참여마당</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" id="title" class="input" placeholder="투어 이름" required /></td>
						</tr>
						<tr>
							<th>설명</th>
							<td><textarea cols="100" rows="10" name="content" maxlength="800" id="content" class="textarea" placeholder="투어 설명" required></textarea></td>
						</tr>
						<tr>
							<th>이미지1</th>
							<td><input type="file" name="img1" id="img1" class="input" required></td>
						</tr>
						<tr>
							<th>이미지2</th>
							<td><input type="file" name="img2" id="img2" class="input" required></td>
						</tr>
					</tbody>
				</table>
				<div class="buttons">			
					<input type="reset" name="reset-btn" class="button button-info" value="취소">
					<input type="submit" name="submit-btn" class="button button-info" value="업로드">					
				</div>
			</form>
			<script>
			function changeTourNo() {
				var cate = document.frm.cate.value;
				if(cate=="") {
					alert("분류를 선택해 주십시오.");
					document.frm.cate.focus();
					return;
				}
			}
			$.ajax ({
				url : "${path1 }/NoLoadCtrl.do",
				type : "post",
				dataType : "json",
				success : function(data) {
					console.log(data.no);
					$("#tourno").val(cate + data.no);
				}
			});
			</script>
		</div>
	</section>
<jsp:include page="/footer.jsp" />
</body>
</html>