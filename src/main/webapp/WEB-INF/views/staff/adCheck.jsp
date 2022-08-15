<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
  	.container{display: none;}
     .bottom{display:none;}
	#event-date{width:225px; margin-right:10px;}
	input[type=text], label{margin-bottom:13px; padding:5px; width:95%;}
	
	#container h1:first-child {
		width: 90%;
		margin-left: 50px;
		margin-right: 50px;
		text-align: left;
		border-bottom: 2px solid #FFA200;
		}
		
		#box{
		float: left;
		line-height: 40px;
		border-bottom: 1px solid #FFA200;
		width: 90%;
		margin-left: 50px;
		margin-right: 50px;
		text-align: center;
		margin-bottom: 50px;
		}
		
	
	

</style>
<script>
	$(function(){
		if($("#status").val()=="예식일변경") $("#status").css({"color", "blue"});
		if($("#status").val()=="예약취소")	 $("#status").css({"color", "red"});
	});
</script>
<jsp:include page="admin.jsp"></jsp:include>
<div id="container">	
	<h1>예약 변경/취소 문의 관리</h1>
	
		<div>
			<table id="box">
				<thead id="line">
					<tr >
               	 		<th>사용자</th>
                		<th>예식변경일</th>
                		<th>문의상태</th>
            		</tr>
            	</thead>
            	
            	<tbody>
            		<c:forEach var="vo" items="${list}">	
            		<tr>            		
               	 		<th>${vo.userid}</th>
                		<th >${vo.changeday}</th>
                		<th id="status">${vo.change}</th>
            		</tr>
            		</c:forEach>
            	</tbody>
			</table>
		</div>
</div>
