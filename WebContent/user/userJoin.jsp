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
<title>회원가입</title>
<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<!-- font -->
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/header.jsp" />
	<section class="section">
		<div class="container">
			<form name="frm" id="frm" action="../InsertCustomCtrl" method="post"  onsubmit="return joinCheck(this)">
				<table class="table">
					<tbody>
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" name="id" id="id" class="input is-info" placeholder="아이디 입력" required />
								<input type="button" class="button is-primary"  onclick="idCheck()" value="아이디 중복 체크" >
								<input type="hidden" name="idCk" id="idCk" value="no">
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="cusPw" id="cusPw" class="form-control" placeholder="비밀번호 입력" required /></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password" name="cusPw2" id="cusPw2" class="form-control" placeholder="비밀번호 확인" required /></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="cusName" id="cusName" class="form-control" placeholder="이름 입력" required /></td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="text" name="address1" id="address1" class="form-control" placeholder="기본 주소" required />
								<input type="text" name="address2" id="address2" class="form-control" placeholder="상세 주소" required />
								<input type="text" name="postcode" id="postcode" style="width:160px;float:left;margin-right:20px;" placeholder="우편번호" class="form-control">
								<button id="post_btn" onclick="findAddr()" class="btn btn-light">우편번호 검색</button>
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="custel" id="custel" class="form-control" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" placeholder="전화번호 입력(XXX-XXXX-XXXX)" required /></td>
						</tr>
					</tbody>
				</table>
				<div class="btn-group">
					<input type="reset" name="reset-btn" class="btn btn-light" value="취소">
					<input type="submit" name="submit-btn" class="btn btn-dark" value="회원가입">
				</div>
			</form>
		</div>
	</section>
	<script>
		function idCheck(){
			if($("#id").val()==""){
				alert("아이디를 입력해주십시오.");
				$("#id").focus();
				return;
			}
			var params = { id : $("#id").val() }		//전송될 데이터를 객체로 묶는다.
			$.ajax({
				url : "${path1 }/IdCheckCtrl.do",		//아이디가 전송될 곳
				type : "post",										//전송 방식
				dataType : "json",								//데이터 전환 방식
				data : params,									//전송방식이 post인 경우에 객체로 묶어 전송
				success : function(result) {
					console.log(result, result);
					var idChk = result.result;				//boolean형태로 지정하여 true/false 추출
					if(idChk==false) {						//사용할 수 없는 아이디
						$("#idCk").val("no");
						$("#msg").html("<strong>이미 사용 중인 아이디입니다.</strong>");
						$("#id").focus();
					} else if(idChk==true) {				//사용가능한 아이디
						$("#idCk").val("yes");
						$("#msg").html("<strong>사용 가능한 아이디입니다.</strong>");
						$("#id").focus();
					} else if(idChk=="") {					//null로 인식된 아이디
						$("#msg").html("<strong>아이디를 다시 입력해주십시오.</strong>");
					}
				}				
			});
		}
		function joinCheck(f){
			if(f.cusPw.value != f.cusPw2.value){
				alert("비밀번호가 서로 일치하지 않습니다. ");
				f.cusPw.focus();
				return false;
			}
			if(f.idCk.value!="yes"){
				alert("아이디 중복 체크를 진행해주세요.");
				return false;
			}
		}
		</script>
		<script>
		function findAddr() {
			new daum.Postcode({
				oncomplete: function(data) {
					console.log(data);
					var roadAddr = data.roadAddress;
					var jibunAddr = data.jibunAddress;
					document.getElementById("postcode").value = data.zonecode;
					if(roadAddr !== '') {
						document.getElementById("address1").value = roadAddr;				
					} else if(jibunAddr !== ''){
						document.getElementById("address1").value = jibunAddr;
					}
					document.getElementById("address2").focus();
				}
			}).open();
		}
		</script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	</script>
	<jsp:include page="/footer.jsp" />
</body>
</html>