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
	#headtitle p{color: #FFA200; font-size: 20px; font-family: Bell MT; margin-bottom: 70px; }

	#galleryView{
		text-align:center;
		color: #FFA200; 
		font-size: 20px; 
		font-family: Bell MT;
		margin: 0 150px;
	}
	
	#subbox2{
		font-size: 30px;
		margin-bottom: 30px;
		color: black;
	}
	
	#conbox2{
		color: black;
		margin-bottom: 70px;
		margin-top:30px;
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
<script>
	function galleryDel(){
	   if(confirm("글을 삭제하시겠습니까?")){
	      location.href="/news/galleryDel?no=${vo.no}";
	   }
	}
</script>
<div id="topImg">
	<img src="/img/001.jpg">
</div>

<div>
	<ul class="menu">
		<li><a href="event">이벤트 프로모션</a></li>
		<li><a href=notice>공지사항</a></li>
		<li><a href="gallery">갤러리</a></li>
	</ul>
</div>

<div id="headtitle">
	<h1>Gallery</h1>
	<P>행복한 순간을 추억해보세요</P>
</div>


<div id="galleryView">
	<h1 id="subbox2">${vo.subject}</h1>
	<ul>
		<li><img src="/img/gallery/${vo.filename}"></li>
		<li id="conbox2">${vo.content}</li>
	</ul>

</div>
<div id="clickbox">
   <a href="/news/gallery" class="click">뒤로가기</a> &nbsp;|&nbsp;
   <c:if test="${svo.staffid==adId}">
      <a href="/staff/adGalleryEdit/${vo.no}" class="click">수정</a> &nbsp;|&nbsp;
      <a href="javascript:galleryDel()" class="click">삭제</a> 
   </c:if>
</div>