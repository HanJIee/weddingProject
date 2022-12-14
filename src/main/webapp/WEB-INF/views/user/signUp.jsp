<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/signup.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>

body, ul ,li{
	margin: 0;
	padding: 0;
}
#topImg>img{
	width: 1980px;
	position: relative;
	bottom: 600px;
}
	
	#topImg{
	height: 300px;
	overflow: hidden;
}

	/* 사용가능 */
	.idchk{
		color : green;
		display : none;
	}
	/* 사용불가 */
	.idchk2{
		color : red;
		display:none;
	}
</style>

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
  


	//유효성 검사
	$("#sign").submit(function(){
		//아이디
		if($("#userid").val()==""){
			alert("아이디를 입력하세요..");
			return false;
		}
		if($("#userpwd").val()==""){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if($("#userpwd2").val()==""){
			alert("비밀번호 재확인란을 입력해주세요.");
			return false;
		}
		if($("#userpwd").val()!=$("#userpwd2").val()){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			return false;
		}
		//연락처
		if($("#tel1").val()=="" || $("#tel2").val()=="" || $("#tel3").val()==""){
			alert("연락처를 입력하세요...");
			return false;
		}
		return true;
	});
	
	$('#userid').on("propertychange change keyup paste input", function() {
		console.log("fdsfd");

		var userid =  $('#userid').val();
		var data = {userid : userid}
		
		$.ajax({
			type : "post",
			url : "/user/idChk",
			data : data,
			success : function(result){
				if(result !='fail'){
					$('.idchk').css("display","inline-block");
					$('.idchk2').css("display",'none');
				}else{
					$('.idchk2').css("display","inline-block");
					$('.idchk').css("display","none");
				}
			}
		});
	
	});
		
});
	
</script>





<div id="topImg">
	<img src="/img/001.jpg">
</div>
<div id="signFrm">
	<h1>회원가입</h1>
	<div id="infobox">
		<h2>작성자정보<span>*필수입력</span></h2>
	</div>
	<form method="post" action="/user/signUpOk" id="sign">
		<div id="box">
			<ul>
				<li>아이디<span>*</span></li>
					<li><input type="text" name="userid" id="userid" /></li>
					<li><span class="idchk">사용 가능한 아이디 입니다.</span></li>
					<li><span class="idchk2">해당 아이디가 이미 존재합니다</span></li>
				<li>비밀번호<span>*</span></li>
					<li><input type="password" name="userpwd" id="userpwd" /></li>
				<li>비밀번호 재확인<span>*</span></li>
					<li><input type="password" name="userpwd2" id="userpwd2" /></li>
				<li id="bday">생년월일<span>*</span></li>
				<li id="daybox">
					<select name="yy" id="year"></select>	
					<select name="mm"id="month"></select>
					<select name="dd" id="day"></select>
				</li>
				<li id="gen">성별</li>
				<li >
					<select id="genbox">
						<option id="M">남</option>
						<option id="W">여</option>
					</select>
				</li>
				<li id="teltitle">연락처<span>*</span></li>
				<div id="telbox">
					<input type="text" name="tel1" id="tel1" size="4" />&nbsp-&nbsp
					<input type="text" name="tel2" id="tel2" size="4" />&nbsp-&nbsp 
					<input type="text" name="tel3" id="tel3" size="4" />
				</div>
				
				<li><input type="submit" value="가입하기"/></li>
			</ul>
			
		</div>
	</form>
</div>