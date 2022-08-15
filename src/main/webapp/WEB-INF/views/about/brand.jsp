<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	ul, lu{margin: 0; padding: 0;}
	#topImg>img{width: 1980px; position: relative; bottom: 600px;}		
	#topImg{height: 300px; overflow: hidden;}		

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
	
	#headtitle{text-align: center; line-height: 30px;}
	#headtitle h1{margin-top: 150px; font-size: 50px; font-family: Bell MT; color: #FFA200; font-weight: bold;}
	#headtitle p{color: #FFA200; font-size: 20px; font-family: Bell MT; margin-bottom: 100px; }
	
		
	#brandimg{margin-left: 15%; width: 800px; float:left;}
	
	#brandinfo h1{
		padding-top: 120px;
		color: #FFA200;
		font-size:3em;
		font-family: Bell MT;
		margin-bottom: 80px;
		
		}
		
	#brandinfo li{line-height:40px; font-family: Bell MT; color: black; }
	#brandinfo li:last-child{margin-bottom: 300px; color:#5F5F5F;}
	
	#brandimg2 {margin: 0 13%;}
	#brandimg2 img{padding:20px; height:550px;}
	#brandinfo2 {margin-top:70px; font-weight:bold; border:50px; text-align:center; line-height:45px; color:#5F5F5F;}
	
	#brandlogo {margin-top: 80px; margin-bottom: 110px; text-align:center;}
</style>

<div id="topImg">
	<img src="/img/001.jpg">
</div>

<div>
	<ul class="menu">
		<li><a href="brand">브랜드스토리</a></li>
		<li><a href="map">찾아오시는길</a></li>
	</ul>
</div>

<div id="headtitle">
	<h1>Memories of Brilliant Wedding</h1>
	<P>인생의 모든 순간을 빛낼 일생 단 한 번의 축제,<br/>더 채플, 웨딩의 미학을 완성하다.</P>
</div>

<div id="brand">
	<ul id="brandimg">
		<li><img src="/img/brandimage1.png"></li>
	</ul>
	
	<ul id="brandinfo">
		<li><h1>The Signature of<br/>Authentic Love</h1></li>
		<li><h2>럭셔리 그 이상의 가치</h2></li>
		<li>매 순간 경이로움을 선사하는 명작(名作)의 힘.<br/>
			세대를 관통하고 시대를 초월하는 클래식이란<br/>
			본질에 대한 깊은 고민을 기반으로<br/>
			아름다움을 펼쳐낼 때 완성됩니다.<br/>
			<br/>
			신의 축복과 함께 영원한 사랑을 염원하는 채플 웨딩.<br/>
			고풍스러운 분위기와 절제된 아름다움 가운데<br/>
			진정한 사랑의 깊이를 되새길 수 있어<br/>
			종교를 뛰어넘어 경건하고 뜻 깊은 예식을 원하는<br/>
			현명한 신랑신부의 선택이 되어 왔습니다.
		</li>
	</ul>
	
	<ul id="brandimg2">
		<img src="/img/brandimage2.png"/>
		<img src="/img/brandimage3.png"/>
		<img src="/img/brandimage4.png"/>
	</ul>
	
	<ul id="brandinfo2">
		<li>모두가 인정하는 격조 높은 클래스는 웨딩, 본연의 가치에 집중하는 것에서 출발해<br/>
			상상 그 이상의 환희를 선사하기에 더욱 특별합니다.<br/>
			<br/>
			여유롭고 이국적인 휴양지의 설렘과 자연에서 영감을 얻은 싱그러운 분위기.<br/>
			우아하고 로맨틱한 예식을 도심속에서도 프라이빗하게 만끽할 수 있는<br/>
			진정한 한국형 채플 웨딩.
		</li>		
	</ul>
	
	<ul id="brandlogo">
		<li><img src="/img/logo.png"></li>
	</ul>
</div>
	





















