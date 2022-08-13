<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
	#info{text-align:center;}
	#info input[type="text"], #info input[type="date"]{height:30px;}
	.optioninfo input{background-color:#ddd; border:none; width:60%;}
	
	.modify{text-align:center;}
	
</style>
<script>

</script>
<div id="topImg">
	<img src="/img/001.jpg">
</div>
<div>
	<ul class="menu">
		<li><a href="">예약상담</a></li>
		<li><a href="">예약확인</a></li>
	</ul>
</div>

<div id="headtitle">
	<h1>WEDDING RESERVATION</h1>
	<P>예약변경/취소를 하실 수 있습니다.</P>
</div>

<div id="info">
	<h2>변경/취소문의</h2>
	
	<ul class="optioninfo">
		<li>홀선택</li>
		<li><input type="text" name="hallname" id="hallname" value="${vo.hallname}" readonly/></li>
		<li>예상인원</li>
		<li><input type="text" name="scale" id="scale" value="${vo.scale}" readonly/></li>	
		<li>변경할 예식일</li>
		<li><input type="text" id="datepicker" value="${vo.dday}"></li>
		<li>신부메이크업</li>
		<li><input type="text" name="makeup" value="${vo.makeup}"/></li>
		<li>드레스대여</li>
		<li><input type="text" name="dress" value="${vo.dress }"/></li>
		<li>변경/취소</li>
		<li>
			<select name="optionselect" id="optionselect">
			<option>예식일변경</option>
			<option>예식취소</option>
			</select>
		</li>
	</ul>
</div>
<div class="modify">
	<input type="button" id="modifyOk" value="변경/취소하기"/>
</div>