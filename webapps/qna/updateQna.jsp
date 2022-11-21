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
			<h2 class="title">묻고 답하기 상세</h2>
			<form name="frm" id="frm" action="${path1 }/UpdateQnaProCtrl.do" method="post">
			<input type="hidden" name="no" id="no" value="${vo.no }"/>
				<table class="table">
					<tbody>
						<tr>
							<th><label class="title">제목</label></th>
							<td><input type="text" name="title" id="title" class="input is-info" placeholder="제목 입력" required /></td>
						</tr>
						<tr>
							<th><label for="content">내용</label></th>
							<td><input cols="100" rows="8" maxlength="500" type="text" name="place" id="place" class="input is-info" placeholder="내용 입력" required /></td>
						</tr>
						<tr>
							<th><label class="id">작성자</label></th>
							<td>
								<input type="text" name="id" id="id" class="input" value='${sid }' readonly required>
								<input type="hidden" name="lev" id="lev" value="${vo.lev }">
							</td>
						</tr>
						<tr>
							<th><label for="sec1">비밀글</label></th>
							<td>
								<c:if test='${vo.sec.equals("Y") }'>
									<strong>비밀글</strong>
								</c:if>
								<c:if test='${vo.sec.equals("N") }'>
									<strong>공개글</strong>
								</c:if>
								<input type="radio" name="sec" id="sec1" value="N" checked>
								<label for="">공개</label>
								<input type="radio" name="sec" id="sec2" value="Y">
								<label for="">비밀글</label>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="buttons">			
					<a href="${path1 }/GetQnaListCtrl.do" class="button is-info">목록</a>
					<input type="submit" name="submit-btn" class="button is-primary" value="변경">
					<a href="${path1 }/DeleteQnaCtrl.do?no=${vo.no }" class="button is-primary">삭제</a>			
				</div>
			</form>			
		</div>
	</section>
<jsp:include page="/footer.jsp" />
</body>
</html>