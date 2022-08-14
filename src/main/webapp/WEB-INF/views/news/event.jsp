<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	ul, lu{margin: 0; padding: 0;}
	#topImg>img{width: 1980px; position: relative; bottom: 600px;}		
	#topImg{height: 300px; overflow: hidden;}		

	.menu{ background-color: red;}
	.menu>li{float:left; width:33.3333333333%; height:50px; line-height:50px; text-align:center; background-color: #FFA200; font-weight: bold;}
	.menu>li:first-child{background-color:white;}
	
	#headtitle{text-align: center; line-height: 30px;}
	#headtitle h1{margin-top: 150px; font-size: 50px; font-family: Bell MT; color: #FFA200; font-weight: bold;}
	#headtitle p{color: #FFA200; font-size: 20px; font-family: Bell MT; margin-bottom: 100px; }

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
	<h1>Special Offers</h1>
	<P>이벤트 목록</P>
</div>

<div id="event">
	<c:forEach var="vo" items="${list}">
		<a href="eventView?no=${vo.no}">
			<ul>
				<li><img src="${vo.content}" style=width:300px;height:300px; onclick="openimg()"></li>
				<li>${vo.subject}</li>
			</ul>
		</a>
	</c:forEach>
</div>


