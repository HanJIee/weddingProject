<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/hallList.css" type="text/css">
<style>
	body, ul, li{
	margin: 0;
	padding: 0;
	}
	
	#topImg>img{
	width: 1980px;
	position: relative;
	bottom: 600px;
	}
	
	#topImg{height: 300px;
	overflow: hidden;
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
	
	.menu>li{
		float:left;
		width:50%;
		height:50px;
		line-height:50px;
		text-align:center; 
		background-color: orange;
		font-weight:bold;
	}
	.menu>li:first-child{
		background-color:white;
	}
	.menu>li:last-child>a{
		color:white;
	}
	
	
</style>

	<div id="topImg">
		<img src="/img/001.jpg">
	</div>
	
	<div>
		<ul class="menu">
			<li><a href="hallList">홀</a></li>
			<li><a href="serviceList">부대시설/서비스</a></li>
		</ul>
	</div>
	
	<div id="headtitle">
		<h1>Wedding Hall</h1>
		<P>인생의 모든 순간을 빛낼 일생 단 한 번의 축제</P>
	</div>




	<div id="garden">
		<ul id="gardenimg2">
		<li><img src="/img/space/garden1.jpg" align="left" ></li>
		</ul>
		
		<ul id="gardeninfo">
		<li><input type="button" value="예약상담" id="btn" onclick="location.href='/reservation/consult'"></li>
		<li><h1>가든홀1</h1></li>
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
		
		<div>
		<ul id="detail">
			&nbsp;
			<li>|</li>
		
			<li>DETAIL</li>
			&nbsp;
			<li><img src="/img/space/garden1-1.jpg"></li>
			<li><img src="/img/space/garden1-2.jpg"></li>
			<li><img src="/img/space/garden1-3.jpg"></li>
		</ul>
		</div>
	</div>
		
	<div id="zero">
	&nbsp;
	</div>
		
		
	<div id="garden2">
		<ul id="gardenimg2">
			<li><img src="/img/space/garden2.jpg" align="right" ></li>
		</ul>
		
		<ul id="gardeninfo2">
			<li><input type="button" value="예약상담" id="btn2" onclick="location.href='/reservation/consult'"></li>
			<li><h1>가든홀2</h1></li>
			<li><h2>GARDEN HALL</h2></li>
			<li>통유리 벽 사이로 쏟아지는 빛의 향연이 펼쳐지는 인테리어!<br/>
				마치 숲속에 와있는 듯한 웨딩파티 플레이스!<br/>
				상상만으로도 황홀함과 성스러움이 와 닿는 이곳에서  혼인 서약이 이뤄집니다.<br/>
				숲이 재현된 라포레 홀 안에서  모든 이에게 행운의 축복이 쏟아집니다.<br/>
				또한, 감각적인 플라워 아트와 아름다운 선율의 음악이 더해져 감동을 전해 줍니다<br/>
			</li>
			<li>하객분들께서 예식을 더 가까이에서 즐길 수 있는 파티분위기의 예식공간!<br/>
				또한, 대한민국 명인쉐프가 엄선한 재료로 준비되는 코스요리입니다.<br/>
			</li>
		</ul>
		
		<div>
		<ul id="detail2">
			&nbsp;
			<li>|</li>
			<li>DETAIL</li>
			&nbsp;
			<li><img src="/img/space/garden2-1.jpg"></li>
			<li><img src="/img/space/garden2-2.jpg"></li>
			<li><img src="/img/space/garden2-3.jpg"></li>
		</ul>
		</div>
	</div>