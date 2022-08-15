<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	ul, lu{margin: 0; padding: 0;}
	#topImg>img{width: 1980px; position: relative; bottom: 600px;}		
	#topImg{height: 300px; overflow: hidden;}	

	.menu{ background-color: red;}
	.menu>li{float:left; width:33.3333333333%; height:50px; line-height:50px; text-align:center; background-color: #FFA200; font-weight: bold;}
	.menu>li:nth-child(2){background-color:white;}
	
	#headtitle{text-align: center; line-height: 30px;}
	#headtitle h1{margin-top: 150px; font-size: 50px; font-family: Bell MT; color: #FFA200; font-weight: bold;}
	#headtitle p{color: #FFA200; font-size: 20px; font-family: Bell MT; margin-bottom: 70px; }
	
	h1{
		text-align: center;
		margin : 50px auto;
	}
	
	#content{
		margin-left: 50px;
		margin-right: 50px;
		text-align: center;
		
	}
	#content li{
		text-align: left;
		
	}
	.winfo{
		font-weight: bold;
		font-size: 20px;
		border-bottom: 2px solid #FFA200;
	}
	.voinfo1{
		
		height: 40px;
		line-height: 40px;
		margin-top: 5px;
		margin-bottom: 30px
	}
	
	.voinfo2{
		
		margin-top: 10px;
		margin-bottom: 30px;
	}
	
	#content li:last-child {
	border-bottom: 2px solid #FFA200;
	margin-bottom: 30px;
	}
	
	#clickbox{
		margin-left: 50px;
		margin-bottom: 40px;
	}
	.click{
		font-size: 17px;
		font-weight: bold;
		line-height: 20px;
	}
</style>


<div id="topImg">
	<img src="/img/001.jpg">
</div>
<div>
	<ul class="menu">
		<li><a href="event">이벤트 프로모션</a></li>
		<li><a href="notice">공지사항</a></li>
		<li><a href="gallery">갤러리</a></li>
	</ul>
</div>
<div id="headtitle">
	<h1>News</h1>
	<P>새로운 소식을 전해드립니다.</P>
</div>

<div id="content">
	<h1>공지사항</h1>
	<ul id="box">
		<li class="winfo">제목</li>
		<li class="voinfo1">${vo.subject }</li>
		<li class="winfo">글내용</li>
		<li class="voinfo2">${vo.content }</li>
	</ul>	
</div>
<div id="clickbox">
	<a href="/news/notice" class="click">목록</a> &nbsp;|&nbsp;
	<c:if test="${svo.staffid==adId}">
		<a href="/staff/adBoardEdit/${vo.no}" class="click">수정</a> &nbsp;|&nbsp;
		<a href="javascript:noticeDel()" class="click">삭제</a>
	</c:if>
</div>