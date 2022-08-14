<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>





<div>
	<h1>글내용보기</h1>
	<ul>
		<li>제목</li>
		<li>${vo.subject }</li>
		<li>글내용</li>
		<li>${vo.content }</li>
	</ul>	
</div>