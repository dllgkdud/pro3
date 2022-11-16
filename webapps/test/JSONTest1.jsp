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
<title>JSON Test1</title>
<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<!-- font -->
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<jsp:include page="/header.jsp" />
<div class="container">
	<h1 class="title">JSON(JavaScript Object Notation)</h1>
	<p>자바스크립트의 객체 형태로 데이터를 교환하는 방식</p>
	<br><hr><br>
	<div id="js">
	
	</div>
	<script>
	$(document).ready(function(){
		//json(=java map) - 항목이름(key): 값(value)의 형식으로 항목에 ""사용이 가능하다. ≒ map 방식
		var obj = {name:"이하영", age:25};
		$("#js").html("<p>이름: "+obj.name+"</p>");
		$("#js").append("<p>나이: "+obj.age+"</p>");
	});
	</script>
	<br><hr><br>
	<h2 class="title">JSON 단순 텍스트 데이터</h2>
	<div id="con">
	
	</div>
	<script>
	$(document).ready(function(){
		var params = "";
		$.ajax({
			url:"${path1 }/JSONTest1.do",		//아이디가 전송되어질 곳
			type:"post",										//전송방식
			dataType:"json",								//데이터 반환 방식
			data:params,									//전송방식이 post인 경우 객체로 묶어서 전송
			success:function(result){
				console.log(result.result);
				var test = result.result;
				$("#con").html(test);
			}
		});
	});
	</script>
	<br><hr><br>
	<h2 class="title">JSON 하나의 객체 데이터</h2>
	<div id="con2">
	
	</div>
	<script>
	$(document).ready(function(){
		var params = { name : "이하영" }
		$.ajax({
			url:"${path1 }/JSONTest2.do",		//아이디가 전송되어질 곳
			type:"post",										//전송방식
			dataType:"json",								//데이터 반환 방식
			data:params,									//전송방식이 post인 경우 객체로 묶어서 전송
			success:function(data){
				console.log(data);
				var user = data;
				$("#con2").html("이름 : "+user.name+", 점수 : "+user.point);
			}
		});
	});
	</script>
	<br><hr><br>
	<h2 class="title">JSON 리스트 객체 데이터</h2>
	<div id="con3">
	
	</div>
	<script>
	$(document).ready(function(){
		var params = "";
		$.ajax({
			url:"${path1 }/JSONTest3.do",		//아이디가 전송되어질 곳
			type:"post",										//전송방식
			dataType:"json",								//데이터 반환 방식
			data:params,									//전송방식이 post인 경우 객체로 묶어서 전송
			success:function(list){
				console.log(list);
				var list = list.list;
				$("#con3").html("이름 : "+user.name+", 점수 : "+user.point);
			}
		});
	});
	</script>
</div>	
<jsp:include page="/footer.jsp" />
</body>
</html>