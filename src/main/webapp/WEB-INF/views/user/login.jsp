<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/login.css" type="text/css">    
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
	
	

</style>
<script>
	$(function(){
		$("#log").submit(function(){
			if($("#userid").val()==""){
				alert("아이디를 입력하세요");
				return false;
			}
			if($("#userpwd").val()==""){
				alert("비밀번호를 입력하세요..");
				return false;
			}
			return true;
		});
	});
</script>


	<div id="topImg">
		<img src="/img/001.jpg">
	</div>
	
	
<div id="loginForm">
	<h1 id="logtitle">로그인</h1>
	<form method="post" action="/user/loginOk" id="log">
		<ul>
				<li><input type="text" name="userid" id="userid" placeholder="아이디"></li>
				<li><input type="password" name="userpwd" id="userpwd" placeholder="비밀번호"></li>
				<li><input type="submit" value="로그인" id="login"/></li>
			
			<ul id="box">
				<li><input type="checkbox" name="logCheck" id="logCheck"/>로그인상태 유지</li>
				<li id="singup">계정이 없으신가요? <a href="/user/signUp"/>회원가입</a></li>
				<li id="gup"><a href="/staff/adlogin"/>관리자로그인</a></li>
			</ul>
			
			
		</ul>
			
	</form>
</div>