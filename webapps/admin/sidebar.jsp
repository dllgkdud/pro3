<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<aside class="menu">
	<p class="menu-label">
		General
	</p>
	<ul class="menu-list">
		<li><a href="${path1 }/GetNoticeListCtrl.do" class="navbar-item">공지목록</a></li>
		<li><a href="${path1 }/GetQnaListCtrl.do" class="navbar-item">질문목록</a></li>
	</ul>
	<p class="menu-label">
		Administration
	</p>
	<ul class="menu-list">
		<li><a>Settings</a></li>
		<li>
			<a class="is-active">Manage</a>
			<ul>
				<li><a href="${path1 }/GetUserListCtrl.do" class="navbar-item">회원관리</a></li>				
	        	<li><a href="${path1 }/GetTourListCtrl.do" class="navbar-item">투어관리</a></li>
	        	<li><a href="${path1 }/" class="navbar-item">리뷰관리</a></li>
			</ul>
		</li>
	    <li><a>Invitations</a></li>
	    <li><a>Cloud Storage Environment Settings</a></li>
	    <li><a>Authentication</a></li>
	</ul>
</aside>