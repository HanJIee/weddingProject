<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(function(){
		$("#log").submit(function(){
			if($("#staffid").val()==""){
				alert("아이디를 입력하세요");
				return false;
			}
			if($("#staffpwd").val()==""){
				alert("비밀번호를 입력하세요..");
				return false;
			}
			return true;
		});
	});
</script>
<div id="loginForm">
	<h1 id="logtitle">로그인</h1>
	<form method="post" action="/staff/loginOk" id="log">
		<ul>
			<li id="id">아이디</li>
			<li><input type="text" name="staffid" id="staffid"></li>
			<li id="pw">비밀번호</li>
			<li><input type="password" name="staffpwd" id="staffpwd"></li>
			<li><input type="submit" value="로그인"/></li>
		</ul>
	</form>
</div>