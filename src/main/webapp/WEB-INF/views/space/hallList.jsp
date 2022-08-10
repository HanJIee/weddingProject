<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	ul, lu{
	margin: 0;
	padding: 0;
	}
	
	#topImg>img{
	width: 1980px;
	position: relative;
	bottom: 600px;
	}
	
	#topImg{height: 300px;
	overflow: hidden;}	
	}

	.menu{
		background-color: red;
	}
	
	.menu>li{
		float:left;
		width:50%;
		height:50px;
		line-height:50px;
		text-align:center; 
		background-color: #FFA200;
		font-weight: bold;
	}
	
	#headtitle{
		text-align: center;
		line-height: 20px;
	}
	#headtitle h1{
		margin-top: 150px;
		font-size: 50px;
		font-family: Bell MT;
		color: #FFA200;
		font-weight: bold;
	}
	#headtitle p{
		color: #FFA200;
		font-size: 20px;
		font-family: Bell MT;
		margin-bottom: 100px;
	
	}
	
	
	#garden{
		margin-left: 40px;
		margin-bottom: 0px;
		
	}
	
	#garden img{
		width: 800px;
		float: left;
	}
	
	#gardeninfo {
	padding-left:  150px;
	}
	
	#gardeninfo li:last-child {
		margin-top: 120px;
	}
	
	#detail{
		margin-top: 130px;
		text-align: center;
		font-size: 30px;
		line-height: 20px;
	}
	
	#detail img{
		float:left;
		width:31%;
		margin: 10px 15px;
		height: 300px;
		
	}
	
</style>

<div id="topImg">
	<img src="/img/001.jpg">
</div>

<div>
	<ul class="menu">
		<li><a href="">홀</a></li>
		<li><a href="">부대시설/서비스</a></li>
	</ul>
</div>

<div id="headtitle">
	<h1>WEDDING HALL</h1>
	<P>인생의 모든 순간을 빛낼 일생 단 한 번의 축제</P>
</div>

<div id="garden">
	<ul id="gardenimg">
	<li><img src="/img/4.jpg"></li>
	</ul>
	
	<ul id="gardeninfo">
	<li><input type="button" value="예약상담"></li>
	<li><h1>가든홀</h1></li>
	<li><h2>GARDEN HALL</h2></li>
	<li>야외 가든하우스 느낌의 인테리어!<br/>
		마치 숲속에 와있는 듯한 웨딩파티 플레이스!<br/>
		바로, 원주 유일의 채광형 인테리어로 설계된 그라스타입 그랜드 웨딩 공간입니다.<br/>
		따스함과 편안함 그리고 9미터 천장의 웅장함을 갖춘 곳입니다.<br/>
		또한, 감각적인 플라워 아트와 아름다운 선율의 음악이 더해져 감동을 전해 줍니다<br/>
	</li>
	<li>하객분들께서 예식을 더 가까이에서 즐길 수 있는 파티분위기의 예식공간!<br/>
		또한, 대한민국 명인쉐프가 엄선한 재료로 준비되는 코스요리입니다.<br/>
	</li>
	</ul>
	
	
	<ul id="detail">
		<p>|</p>
		<p>DETAIL</p>
		<img src="/img/5.jpg">
		<img src="/img/07.jpg">
		<img src="/img/hall_05.jpg">
	</ul>
</div>



