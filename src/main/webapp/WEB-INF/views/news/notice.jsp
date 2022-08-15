<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
ul, lu{margin: 0; padding: 0;}
	#topImg>img{width: 1980px; position: relative; bottom: 600px;}		
	#topImg{height: 300px; overflow: hidden;}		

	
	.menu>li{float:left; width:33.3333333333%; height:50px; line-height:50px; text-align:center; background-color: #FFA200; font-weight: bold;}
	.menu>li:nth-child(2){
		background-color:white;
	}

	
	#headtitle{text-align: center; line-height: 30px;}
	#headtitle h1{margin-bottom: 10px; margin-top: 150px; font-size: 50px; font-family: Bell MT; color: #FFA200; font-weight: bold;}
	#headtitle p{color: #FFA200; font-size: 20px; font-family: Bell MT; margin-bottom: 50px; }
#noticelist {
	width: 1200px;
	overflow: auto;
	margin: 0 auto 50px;
}

#board {
	overflow: auto;
}

#board li {
	float: left;
	line-height: 40px;
	border-bottom: 1px solid #FFA200;
	width: 10%;
}

#board li:nth-child(4n+1) {
	width: 5%;
}

#board li:nth-child(4n+2) {
	width: 75%;
}

.b{font-weight: bold;}

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
<div id="noticelist">
	<ul id="board">
		<li class="b">번호</li>
		<li class="b">제목</li>
		<li class="b">조회수</li>
		<li class="b">작성일</li>
		<c:forEach var="vo" items="${boardList }">
			<li>${vo.no }</li>
			<li><a href="/news/noticeView?no=${vo.no }">${vo.subject }</a></li>
			<li>${vo.hit }</li>
			<li>${vo.writedate }</li>
		</c:forEach>
	</ul>
</div>	