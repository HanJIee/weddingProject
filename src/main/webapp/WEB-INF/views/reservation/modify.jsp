<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/modify.css" type="text/css">

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
	.menu>li:last-child{
		background-color:white;
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
	
	
</style>
<script>


$(function(){
    
 	$("#change").change(function(){
 		$.ajax({
 			url:"/reservation/calendar",
 			data:{hallname:$("#hallname").val()},
 			success:function(result){
 				var $result = $(result);
 				disabledDays = [];
 				$result.each(function(i, day){
 					disabledDays.push(day.dday);
 				});
 				
 				console.log(disabledDays);
 				$("#changeday").datepicker({
 			        changeMonth:true,
 			        changeYear:true,
 			        yearRange:"2022:2025",
 			        showOn:"both",
 			        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
 			        buttonImageOnly:true,
 			        dateFormat: 'yy-mm-dd',
 			        showOtherMonths: true,
 			        selectOtherMonths: true,
 			        showMonthAfterYear: true,
 			        dayNamesMin: ['일','월', '화', '수', '목', '금', '토'],
 			        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
 			        monthNames: ['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
 			        nextText: '다음 달',
 			        prevText: '이전 달',
 			        beforeShowDay: disableAllTheseDays 
 			    });
 			}
 		});
 	});
});    
 
// 특정날짜들 배열
var disabledDays = ["2022-8-25"]; //json형태로 문자배열로 controller에 가져와서 여기로 쓰기

// 특정일 선택막기
function disableAllTheseDays(date) {
    var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
    for (i = 0; i < disabledDays.length; i++) {
        if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
            return [false];
        }
    }
    return [true];
}

</script>


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
	<h1>Wedding Reservation</h1>
	<P>예약변경/취소를 하실 수 있습니다.</P>
</div>

<div id="info">
	<div id="infobox">
		<h2>변경/취소문의</h2>
	</div>
	<form method="post" action="/reservation/modifyOk" id="changeFrm">
		<div id="changeinfo">
			<ul >
				<li id="text">"예약 변경 및 취소를 선택해주세요"</li>
				<li>
					<select name="change" id="change">
					<option>예식취소</option>
					<option>예식일변경</option>
					</select>
				</li>
				<li>홀</li>
				<li><input type="text" name="hallname" id="hallname" value="${vo.hallname}" readonly/></li>
				
				<li>예상인원</li>
				<li><input type="text" name="scale" id="scale" value="${vo.scale}" readonly/></li>	
				
				<li>변경할 예식일</li>
				<li><input type="text" name="changeday" id="changeday" value="${vo.dday}"></li>
				
				<li>신부메이크업</li>
				<li><input type="text" name="makeup" value="${vo.makeup}" readonly/></li>
				
				<li>드레스대여</li>
				<li><input type="text" name="dress" value="${vo.dress }" readonly/></li>
			</ul>
		</div>
		<div id="modify">
			<input type="submit" id="modifyOk" value="변경/취소하기"/>
		</div>
	</form>
</div>
