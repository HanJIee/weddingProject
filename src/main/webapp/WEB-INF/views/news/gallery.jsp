<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	ul, lu{margin: 0; padding: 0;}
	#topImg>img{width: 1980px; position: relative; bottom: 600px;}		
	#topImg{height: 300px; overflow: hidden;}		

	.menu{ background-color: red;}
	.menu>li{float:left; width:33.3333333333%; height:50px; line-height:50px; text-align:center; background-color: #FFA200; font-weight: bold;}
	.menu>li:last-child{background-color:white;}
	
	#headtitle{text-align: center; line-height: 30px;}
	#headtitle h1{margin-top: 150px; font-size: 50px; font-family: Bell MT; color: #FFA200; font-weight: bold;}
	#headtitle p{color: #FFA200; font-size: 20px; font-family: Bell MT; margin-bottom: 50px; }

	#gallery{
		display:flex;
    	flex-wrap:wrap;
    	margin:20px auto;
    	margin-left:150px;
    	text-align:center;
		 
	}
	#gallery li{
		width: 300px;
			
	}
	#gallery ul{
		width: 300px;
		margin-right: 0;
	}
	#gallery a{
		
		margin-right: 20px;
	}
	
	img{
	
		width:calc(33.333% - 10px);
    	
	}
	#subbox{
		font-weight: bold;
		margin-top: 10px;
		width: 300px;
		margin-bottom: 30px;
		
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
	<h1>Gallery</h1>
	<P>행복한 순간을 추억해보세요</P>
</div>

<div id="headtitle">
	<h1>Gallery</h1>
	<P>행복한 순간을 추억해보세요</P>
</div>

<div id="gallery">
	<c:forEach var="vo" items="${list}">
		<a href="galleryView?no=${vo.no}">
			<ul>
				<li><img src="/img/gallery/${vo.filename}" style=width:300px;height:300px;></li>
				<li id="subbox">${vo.subject}</li>
			</ul>
		</a>
	</c:forEach>
</div>

