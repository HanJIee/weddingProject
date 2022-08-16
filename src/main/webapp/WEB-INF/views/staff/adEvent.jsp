<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="//cdn.ckeditor.com/4.19.1/full/ckeditor.js"></script>

<script>
	$(function(){
		CKEDITOR.replace("content");
		
		$("#dataFrm").submit(function(){
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
	<h1>이벤트 글등록</h1>
	<form method="post" action="/staff/adEventOk" id="dataFrm" enctype="multipart/form-data">	
		<ul>
			<li>제목</li>
			<li><input type="text" name="subject" id="subject" style="width:80%"/></li>
			<li>글내용</li>
			<li><textarea name="content" id="content"></textarea></li>
			<li>첨부파일</li>
			<li>
				<input type="file" name="fname" id="filename"/> <!-- VO에 있는 필드명과 name이 같아서는 안된다. -->
			</li>
			<li><input type="submit" value="이벤트 글등록"/></li>
		</ul>
	</form>
</div>