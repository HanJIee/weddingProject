<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
function noticeDel(){
	if(confirm("글을 삭제하시겠습니까?")){
		location.href="/news/noticeDel?no=${vo.no}";
	}
}
</script>

<div>
	<h1>글내용보기</h1>
	<ul>
		<li>제목</li>
		<li>${vo.subject }</li>
		<li>글내용</li>
		<li>${vo.content }</li>
	</ul>
</div>
<div>
	<a href="/news/notice">목록</a>
	<c:if test="${svo.staffid==adId}">
		<a href="/staff/adBoardEdit/${vo.no}">수정</a>
		<a href="javascript:noticeDel()">삭제</a>
	</c:if>
</div>