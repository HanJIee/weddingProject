<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="//cdn.ckeditor.com/4.19.1/full/ckeditor.js"></script>

<script>
	$(function(){
		CKEDITOR.replace("content");
		//첨부파일 수정
		$(".del").click(function(){
			//기본 파일명 숨기기
			$(this).parent().css("display","none");
			//새로 첨부가능하도록 file 컴퍼넌트 만들기
			$(this).parent().next().attr("type","file");
			//삭제된 파일명을 서버로 보내기 위해서 name속성을 설정한다.
			$(this).parent().next().next().attr("name","delFile");
			//남은 파일의 수를 감소시킨다.
			$("input[name=fileCount]").val($("input[name=fileCount]").val()-1);
		});
		
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
	<form method="post" action="/staff/adEventEditOk" id="dataFrm" enctype="multipart/form-data">	
		<input type="hidden" name="no" value="${vo.no}"/>
		<ul>
			<li>제목</li>
			<li><input type="text" name="subject" id="subject" style="width:80%" value="${vo.subject}"/></li>
			<li>글내용</li>
			<li><textarea name="content" id="content">${vo.content}</textarea></li>
			<li>첨부파일</li>
			<li>
				<!-- 첨부파일이 있을 때 -->
				<c:if test="${vo.filename!=null && vo.filename!=''}">
					<div>${vo.filename}&nbsp;<b class="del">X</b></div>
					<!-- 파일명을 삭제시 새로운 파일을 첨부할 수 있도록 -->
					<input type="hidden" name="fname" id="filename"/>
					<input type="hidden" name="" value="${vo.filename}"/>
				</c:if>
				<!-- 첨부파일이 없을 때 -->
				<c:if test="${vo.filename==null || vo.filename==''}">
					<input type="file" name="fname" id="filename"/>
				</c:if>
			</li>
			<li><input type="submit" value="이벤트 글 수정하기"/></li>
		</ul>
	</form>
</div>
