<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	    <li><a href="${path1 }/GetQnaListCtrl.do">묻고 답하기</a></li>
	  </ul>
	</nav>
	<section class="section">
		<div class="container">
			<h1 class="title">QnA 목록</h1>
			<table class="table">
				<thead>
					<tr>
						<th><abbr title="No">No</abbr></th>
						<th><abbr title="ParNo">ParNo</abbr></th>
						<th><abbr title="Title">Title</abbr></th>
						<th><abbr title="RegDate">RegDate</abbr></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${qnaList }" var="dto" varStatus="no">
					<tr>
						<td><span>${dto.parno }</span></td>
						<td>
							<c:if test = "${dto.lev==0 }">
								<span>${dto.no }</span>
							</c:if>
							<c:if test = "${dto.lev==1 }">
								<span>${dto.no }</span>
							</c:if>
						</td>
						<td><a href="${path1 }/GetQnaCtrl.do?no=${dto.no }">${dto.title }</a></td>
						<td>
							<fmt:parseDate value="${dto.regDate }" var="regdate" pattern="yyyy-MM-dd"></fmt:parseDate>
							<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="buttons">
				<a href="${path1 }/qna/addQna.jsp" class="button is-primary">작성</a>
			</div>
		</div>
	</section>
<jsp:include page="/footer.jsp" />
</body>
</html>