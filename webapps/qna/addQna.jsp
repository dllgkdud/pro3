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
<!-- jquery -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<style>
label.title {
	font-size: 16px;
}
</style>
<body>
<jsp:include page="/header.jsp" />
	<section class="section">
		<div class="container">
			<h2 class="title">질문</h2>
			<form name="frm" id="frm" action="${path1 }/AddQnaProCtrl.do" method="post">
				<table class="table">
					<tbody>
						<tr>
							<th><label class="title">제목</label></th>
							<td><input type="text" name="title" id="title" class="input is-info" placeholder="제목 입력" required /></td>										
						</tr>
						<tr>
							<th><label class="content">내용</label></th>
							<td><textarea cols="100" rows="8" name="content" id="content" class="textarea is-info" maxlength="500" required></textarea></td>
						</tr>
						<tr>
							<th><label class="id">작성자</label></th>
							<td>
								<input type="text" name="id" id="id" class="input is-info" value='${sid }' readonly required />
								<input type="hidden" name="lev" id="lev" value="0">
							</td>						
						</tr>
						<tr>
							<th><label for="sec1">비밀</label></th>
							<td>
								<input type="radio" name="sec" id="sec1" value="N" checked>
								<label for="">공개글</label>
								<input type="radio" name="sec" id="sec2" value="Y">
								<label for="">비밀글</label>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="buttons">			
					<a href="<%=request.getContextPath() %>/GetQnaListCtrl.do" class="button is-light">목록</a>
					<input type="submit" name="submit-btn" class="button is-primary" value="등록">			
				</div>
			</form>
		</div>
	</section>
<jsp:include page="/footer.jsp" />
</body>
</html>