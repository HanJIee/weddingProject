<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div id="loginForm">
	<h1 id="logtitle">로그인</h1>
	<form method="post" action="/user/loginOk" id="log">
		<ul>
			<li id="id">아이디</li>
			<li><input type="text" name="userid" id="userid"></li>
			<li id="pw">비밀번호</li>
			<li><input type="password" name="userpwd" id="userpwd"></li>
			<li><input type="checkbox" name="logCheck"/>로그인상태 유지</li>
			<li><input type="submit" value="로그인"/></li>
			</ul>
			<a href="/user/signUp"/>회원가입</a>
	</form>
</div>