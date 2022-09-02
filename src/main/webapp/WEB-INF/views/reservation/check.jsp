<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/check.css" type="text/css">
<style>
	ul, li{
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
	
	#headtitle{
		text-align: center;
		line-height: 20px;
	}
	#headtitle h1{
		text-align: center;
		margin-top: 150px;
		margin-bottom: 5px;
		font-size: 50px;
		font-family: Bell MT;
		color: #FFA200;
		font-weight: bold;
	}
	#headtitle p{
		margin-top:10px;
		text-align: center;
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
		background-color: white;
		font-weight:bold;
	}
	.menu>li:first-child{
		background-color:orange;
	}
	.menu>li:first-child>a{
		color:white;
	
	
	

	
</style>

<div id="topImg">
	<img src="/img/001.jpg">
</div>
<div>
	<ul class="menu">
		<li><a href="consult">예약상담</a></li>
		<li><a href="check">예약확인</a></li>
	</ul>
</div>

<div id="headtitle">
	<h1>WEDDING RESERVATION</h1>
	<P>예약확인을 하실 수 있습니다.</P>
</div>

<div id="info">
	<div id="infobox">
		<h2>예식확인</h2>
	</div>
	<form method="post" action="/reservation/checkPrint" id="checkFrm">
		<div id="optioninfo">
			<ul>
				<li>홀선택</li>
				<li><input type="text" name="hallname" id="hallname" value="${vo.hallname}" readonly/></li>
				
				<li>예상인원</li>
				<li><input type="text" name="scale" id="scale" value="${vo.scale}" readonly/></li>	
				
				<li>예식일</li>
				<li><input type="text" id="dday" value="${vo.dday}"></li>
				
				<li>신부메이크업</li>
				<li><input type="text" name="makeup" value="${vo.makeup}"/></li>
				
				<li>드레스대여</li>
				<li><input type="text" name="dress" value="${vo.dress }"/></li>
			</ul>
		</div>
	</form>
</div>
<div id="modifyFrm">
	<input type="button" id="modify" value="예약변경/취소" onclick="location.href='modify'"/>
</div>