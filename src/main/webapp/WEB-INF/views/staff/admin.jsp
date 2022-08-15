<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.admin{text-align:center;}
	.admin>a:hover{background-color:orange;}
</style>
<div class="admin">
	<h1>관리자페이지</h1>
	<hr/>
	<h2>게시판관리</h2>
	<a href="adEvent">이벤트</a>
	<a href="adBoard">공지사항</a>
	<a href="adGallery">갤러리</a>
	<h2>예약관리</h2>
	<a href="adReservation">예약수정</a>
	<a href="adCheck">문의관리</a>
</div>