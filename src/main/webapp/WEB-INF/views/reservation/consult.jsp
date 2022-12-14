<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/css/consult.css" type="text/css">
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
		margin-top:5px;
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

<script>

$(function(){
    
 	$("#hallname").change(function(){
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
 				$("#datepicker").datepicker({
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
	<P>예약문의신청을 적어주시면 신속하게 답변드리겠습니다.</P>
</div>


<!-- 예식정보 -->
<div id="consultFrm">
	<div class="titlebox">
		<h2>예식정보 <span>*필수입력</span></h2>
	</div>	
	<form method="post" action="/reservation/consultOk" id="boardFrm">
	<ul class="optioninfo">
		<li>홀선택<span>*</span></li>
		<li >
			<select name="hallname" id="hallname">
			<option>가든홀1</option>
			<option>가든홀2</option>
			</select>
		</li>
		
		<li>예상인원<span>*</span></li>
		<li><input type="text" name="scale" name="scale"  id="scale"/></li>
		
		
		<li>예식일<span>*</span></li>
		<li id="daybox"><input type="text" name="dday" id="datepicker"></li>
			
		<li id="makeupbox">신부메이크업</li>
		<li>
			<select name="makeup" id="makeup">
			<option>YES</option>
			<option>NO</option>
			</select>
		</li>
		
		<li>드레스대여</li>
		<li>
			<select name="dress" id="dress">
			<option>YES</option>
			<option>NO</option>
			</select>
		</li>
	</ul>
	<ul class="titlebox">
		<h2>문의사항</h2>
	</ul>
	<ul class="optioninfo">
		<li>원하시는 상담일정<span>*</span></li>
		<li><input type="date" name="cday" id="cday"/></li>
		<li>제목</li>
		<li><input type="text" name="subject" id="subject"/></li>
		<li>내용</li>
		<li><textarea name="content" cols="69" rows="10"></textarea></li>
	</ul>
	
	<ul id="submitbtm">
		<li><input type="submit" value="접수하기"/></li>
		<li><input type="reset" value="취소"/></li>
	</ul>
	</form>
</div>

