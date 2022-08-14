<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="//cdn.ckeditor.com/4.19.1/full/ckeditor.js"></script>
<script>
	$(function(){
		CKEDITOR.replace("content");
		$("#boardFrm").submit(function(){
			if($("#subject").val()==""){
				alert("제목을 입력하세요.");
				return false;
			}
			if(CKEDITOR.instances.content.getData()==""){
				alert("글 내용을 입력하세요.");
				return false;
			}
			return true;
		});
	});
</script>
<div>
	<h1>공지사항 글쓰기</h1>
	<form method="post" action="/staff/adBoardOk" id="boardFrm">
		<ul>
			<li>제목</li>
			<li><input type="text" name="subject" id="subject"/></li>
			<li>글내용</li>
			<li><textarea name="content" id="content"></textarea></li>
			<li><input type="submit" value="글등록"/></li>
		</ul>
	</form>
</div>