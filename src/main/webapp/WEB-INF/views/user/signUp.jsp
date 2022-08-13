<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/signup.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function(){            
    var now = new Date();
    var year = now.getFullYear();
    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
    //년도 selectbox만들기               
    for(var i = 1900 ; i <= year ; i++) {
        $('#year').append('<option value="' + i + '">' + i + '년</option>');    
    }
    // 월별 selectbox 만들기            
    for(var i=1; i <= 12; i++) {
        var mm = i > 9 ? i : "0"+i ;            
        $('#month').append('<option value="' + mm + '">' + mm + '월</option>');    
    }
    
    // 일별 selectbox 만들기
    for(var i=1; i <= 31; i++) {
        var dd = i > 9 ? i : "0"+i ;            
        $('#day').append('<option value="' + dd + '">' + dd+ '일</option>');    
    }
    $("#year  > option[value="+year+"]").attr("selected", "true");        
    $("#month  > option[value="+mon+"]").attr("selected", "true");    
    $("#day  > option[value="+day+"]").attr("selected", "true");       
  
})
</script>
<link rel="stylesheet" href="/css/signup.css" type="text/css">
<div id="signFrm">
	<h1>회원가입</h1>
	<h2>작성자정보</h2>
	<span>필수입력</span>
	<form method="post" action="/user/signUp" id="sign">
		<ul>
			<li>아이디*</li>
				<li><input type="text" name="userid" id="userid" /></li>
			<li>비밀번호*</li>
				<li><input type="password" name="userpwd" id="userpwd" /></li>
			<li>비밀번호 재확인*</li>
				<li><input type="password" name="userpwd2" id="userpwd2" /></li>
			<li>성명*</li>
				<li><input type="text" name="username" id="username" /></li>
			<li>생년월일*</li>
			<li>
				<select name="yy" id="year"></select>	
				<select name="mm"id="month"></select>
				<select name="dd" id="day"></select>
			</li>
			<li>성별*</li>
			<li>
				<select>
					<option>남</option>
					<option>여</option>
				</select>
			</li>
			<li>연락처*</li>
			<li>
				<input type="text" name="tel1" id="tel1" size="4" /> - 
				<input type="text" name="tel2" id="tel2" size="4" /> - 
				<input type="text" name="tel3" id="tel3" size="4" />
			</li>
			<li><input type="submit" value="가입하기"/></li>
		</ul>
	</form>
</div>