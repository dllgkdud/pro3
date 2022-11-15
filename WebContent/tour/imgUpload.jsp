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
<title>업로드</title>
</head>
<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<!-- font -->
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<body>
<jsp:include page="../header.jsp" />
	<form name="upload" id="upload" action="${path1 }/ImgUploadCtrl.do" method="post" enctype="multipart/form-data" onchange="">
		<table class="table">
			<tbody>
				<tr>
					<th>위치</th>
					<td><input type="number" name="pos" id="pos" class="input" value=""></td>
				</tr>
				<tr>
					<th>번호</th>
					<td><input type="text" name="tourno" id="tourno" class="input" value=""></td>
				</tr>
				<tr>
					<th>파일</th>
					<td><input type="file" name="picName" id="picName" class="input" value=""></td>
				</tr>
			</tbody>
		</table>
		<div class="buttons">			
			<input type="reset" name="reset-btn" class="button button-info" value="취소">
			<input type="submit" name="submit-btn" class="button button-info" value="업로드">					
		</div>
	</form>
<jsp:include page="../footer.jsp" />
</body>
</html>