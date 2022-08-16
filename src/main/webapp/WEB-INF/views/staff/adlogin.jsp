<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

#loginForm{

    margin-top: 80px;
    margin-bottom: 80px;
   }
   
   #logtitle{
      text-align: center;
      margin-bottom: 30px;
   }
   
   #log {
      
      text-align:center;
      }
      
   #staffid {
      width: 300px;
      height: 30px;
      margin-bottom: 20px;
   }
   #staffpwd{
      width: 300px;
      height: 30px;}
   
   #stafflogin{
      margin-top: 30px;
      margin-bottom: 5px;
      width: 310px;
      height: 40px;
      color: white;
      background-color: #FFA200;
      border: none;
      border-radius: 2px;
   }
</style>
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
   <h1 id="logtitle">관리자 로그인</h1>
   <form method="post" action="/staff/loginOk" id="log">
      <ul>
         <li id="id">아이디</li>
         <li><input type="text" name="staffid" id="staffid"></li>
         <li id="pw">비밀번호</li>
         <li><input type="password" name="staffpwd" id="staffpwd"></li>
         <li><input type="submit" value="로그인" id="stafflogin"/></li>
      </ul>
   </form>
</div>