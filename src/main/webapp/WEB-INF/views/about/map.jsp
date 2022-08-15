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
	.menu>li:last-child{
		background-color:white;
	}
	.menu>li:first-child>a{
		color:white;
	}
	
	#headtitle{text-align: center; line-height: 20px;}
	#headtitle h1{margin-top: 150px; font-size: 50px; font-family: Bell MT; color: #FFA200; font-weight: bold;}
	#headtitle p{color: #FFA200; font-size: 20px; font-family: Bell MT; margin-bottom: 100px; }

	#detail{margin-top: 130px; text-align: center; font-size: 30px; line-height: 20px;}
	#detail img{float:left; width:31%; margin: 10px 15px; height: 300px;}
	
	#gMap{
		margin:0 auto; width: 1200px; height:700px; border:1px solid gray;
		margin-bottom: 120px;
	}
	#ad{
		font-size:1.5em; text-align:center; line-height:100px; font-weight:bold; 
		margin-bottom: 20px;
	}
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
	<h1>Location</h1>
	<P>Matrimonium 찾아오시는 길</P>
</div>

<!-- ///////////////////////////////////////////////////////////// -->
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4zycw-F-Gwi2FxxgWWXDN_blH878X5k8&callback=initMap"></script>
<div id="ad">
	<li>서울특별시 강남구 역삼동 테헤란로 212	SDS빌딩 10층</li>
</div>
<div id="gMap"></div>
<script>
	var latitude;
	var longitude;
	var map;
	var addr;
	var home;
	var img;
	var geoCode;
	// 정보를 세팅하는 함수
	function setMapData(){
		latitude =  37.50128294150611;
		longitude = 127.03959900761974;
		
		addr = ['Matrimonium'];
		home = ['localhost:8050'];
	}
	// 구글맵이 호출하는 함수
	function initMap(){
		setMapData();
		
		var myCenter = new google.maps.LatLng(latitude, longitude);
		var option = {
				center : myCenter,
				zoom : 17,
				mapTypeId:google.maps.MapTypeId.ROADMAP
		}
		map = new google.maps.Map(document.getElementById("gMap"), option);
		
		var myIcon = new google.maps.MarkerImage("/img/mapicon.png",null,null,null,new google.maps.Size(60,60));
		var marker = new google.maps.Marker({
			position:myCenter, // 마커를 표시할 위치
			map:map,
			title:"Monatrium",
			icon:myIcon
		});
	}
</script>

