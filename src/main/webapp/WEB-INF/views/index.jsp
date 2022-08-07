<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Martrimonium</title>

<link rel="stylesheet" href="/css/index.css" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/js_css/jquery.easing.1.3.js"></script>
<script src="/js_css/jquery.bxslider.js"></script>
<link rel="stylesheet" href="/js_css/jquery.bxslider.css" type="text/css">

<style>
.bx-wrapper {border:0;background:#fbfbfb;box-shadow:none;}
</style>

<script>
$(function() {
	$("#imgSlider").bxSlider({
		mode:'fade' //화면전환 방식 'horizontal' 'vartical'  'fade'
		, speed : 2000
		, pause: 4000
		,auto : true//자동시작
		,randomStart : true //랜덤시작
		, captions : true //title 속성값을 설명으로 표시 
		, infiniteLoop : true //반복여부
		, hideControlOnEnd : false //좌우 컨트롤보여주기 true 처음과 마지막표시안함
		, pager : true
		
		, useCSS : true //easing 사용여부 true-사용안함
		,easing : 'easeOutElastic'
		//,onSliderLode : function(){ //슬라이드가 로딩이 완료되면 호출되는 콜백함수
		//	alert("콜백함수 실행됨")
		//}
		,onSlideAfter:function(){ //슬라이드가 움직인후 실행 콜백함수
			console.log("onSliderAfter 실행됨")
		}
	});
});
</script>
</head>
<body>
	<div>
		<ul id="imgSlider"> 
		
			<li>
			<div><h1>웨딩. 가치를 품다<br/>
			<span>Martrimonium</span></h1></div>
			<img src="/img/index/4.jpg">
			</li>
			<li>
			<div><h1>웨딩. 가치를 품다<br/>
			<span>Martrimonium</span></h1></div>
			<img src="/img/index/5.jpg">
			</li>
			<li>
			<div><h1>웨딩. 가치를 품다<br/>
			<span>Martrimonium</span></h1></div>
			<img src="/img/index/6.jpg">
			</li>
			<li>
			<div><h1>웨딩. 가치를 품다<br/>
			<span>Martrimonium</span></h1></div>
			<img src="/img/index/7.jpg">
			</li>
			<li>
			<div><h1>웨딩. 가치를 품다<br/>
			<span>Martrimonium</span></h1></div>
			<img src="/img/index/07.jpg">
			</li>
		</ul>
		
	</div>
</body>

</html>
xptmxm xptmxmqw  
