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
<title>장소수정</title>
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
		<h1 class="title">이미지 수정</h1>
		<form name="frm" id="frm" action="${path1 }/UpdateTourProCtrl.do" method="post" onsubmit="return tourCheck(this)">
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
				<div class="field">
					<label class="label">이미지</label>
					<div class="control">
						<input type="hidden" name="pic1" id="pic1" value="no" />
						<button type="button" class="button is-primary" onclick="imgUpload(1)">이미지 추가</button>
					</div>
				</div>
	      	</div>
	      	<br><hr><br>
	      	<h1 class="title">장소 수정</h1>
			<table class="table">
			   <tbody>
			    <tr>
			      <th><label for="no" class="label"></label>번호</th>
			      <td><input type="text" name="no" id="no" class="input is-info" value="${dto.no }" readonly required/></td>
			    </tr>
			    <tr>
			      <th><label for="cate" class="label"></label>카테고리</th>
			      <td>
					<input type="hidden" name="cate1" id="cate1" value="${dto.cate }">			      
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
					<div class="field">
					<div class="select">
						<select name="cate" id="cate" class="select" onchange="changeTourNo()" required>
							<option value="">분류선택</option>
							<option value="A">테마관광</option>
							<option value="B">축제와 문화</option>
							<option value="C">문화재와 역사</option>
							<option value="D">관광과 명소</option>
							<option value="E">참여마당</option>
						</select>
					</div>
				</div>
			      </td>
			    </tr>
			    <tr>
			      <th><label for="tourno" class="label"></label>투어번호</th>
			      <td><p>${dto.tourno }</p>
			      	<input type="hidden" name="tourno" id="tourno" value="${dto.tourno }" />
			      	<input type="text" name="tourno" id="tourno" class="input is-info" value="${dto.tourno }" readonly/>
			      </td>
			    </tr>
			    <tr> 
			      <th><label for="place" class="label"></label>장소</th>
			      <td><input type="text" name="place" id="place" class="input is-info" value="${dto.place }" /></td>	
			    </tr>
			    <tr>
			      <th><label for="comment1" class="label"></label>주요설명</th>
			      <td><textarea cols="100" rows="8" name="comment1" id="comment1" maxlength="500" class="textarea is-info" required>${dto.comment1 }</textarea></td>
			    </tr>
			    <tr>
			      <th><label for="comment2" class="label"></label>상세설명</th>
			      <td><textarea cols="100" rows="8" name="comment2" id="comment2" maxlength="500" class="textarea is-info" required>${dto.comment2 }</textarea></td>
			    </tr>
			  </tbody>
			</table>
			<div class="buttons">
			  <a href="${path1 }/GetTourListCtrl.do" class="button is-primary">목록</a>
			  <c:if test='${sid.equals("admin") }'>
				  <button type="submit" class="button is-light">장소 수정</button>
			  </c:if>
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
				var win1 = window.open("tour/imgUpload.jsp?no="+no+"&tourno="+tourno,"win","width=600, height=400");
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