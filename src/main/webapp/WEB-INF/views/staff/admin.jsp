<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	
	.admin{text-align:center;
		margin-top: 30px;
		margin-bottom: 30px;}
	.admin>a:hover{background-color:orange;}
	#m{
		border-bottom: 1px solid gray;
		margin: 0 50px;
	}
</style>
<div class="admin">
	<h1 id="m">관리자페이지</h1>
	
	<h2>게시판관리</h2>
	<a href="adEvent">이벤트</a>
	<a href="adBoard">공지사항</a>
	<a href="adGallery">갤러리</a>
	<h2>예약관리</h2>
	<a href="adReservation">예약수정</a>
	<a href="adCheck">문의관리</a>
	
</div>