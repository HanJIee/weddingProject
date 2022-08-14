<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
     .container{display:none;}
     .bottom{display:none;}
	#container{background-color:#ddd;}
	#event-date{width:225px; margin-right:10px;}
	input[type=text], label{margin-bottom:13px; padding:5px; width:95%;}
</style>
<script>
	
</script>
<jsp:include page="admin.jsp"></jsp:include>
<div id="container">	
	<h1>예약 변경/취소 문의 관리</h1>
	<hr/>
		<div>
				<table id="box">
					<thead>
						<tr>
	               	 		<th>사용자</th>
	                		<th>예식변경일</th>
	                		<th>문의상태</th>
	            		</tr>
	            	</thead>
	            	<tbody>
	            		<c:forEach var="vo" items="${list}">	
	            		<tr>            		
	               	 		<th>${vo.userid}</th>
	                		<th>${vo.changeday}</th>
	                		<th>${vo.change}</th>
	            		</tr>
	            		</c:forEach>
	            	</tbody>
				</table>
		</div>
</div>