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
	$(function(){
		//선택된 갯수를 구하여 여러개를 삭제하도록 한다.
		$(".multiDel").click(function(){
			//체크 개수 확인
			var countChk = 0;
			$("#box input[name=noList]").each(function(idx, obj){
				if(obj.checked){//input 태그가 체크상태이면 true, 아니면 false;
					countChk++;
				}
			});
			console.log(countChk);
			if(countChk<=0){
				alert("예약취소할 레코드를 선택하여주세요..");
				return false;
			}
			if($(this).val()=="예약취소") $("#listFrm").attr("action","/staff/multiCancel");
			if($(this).val()=="예약확정") $("#listFrm").attr("action","/staff/multiComplete");
		
			$("#listFrm").submit();
		});
		
		//일정등록 클릭시
		$("#dialogOpen").click(function(){
			var cnt = 0;
			$("#box input[name=noList]").each(function(idx,obj){
				if(obj.checked){//선택이 된경우
					cnt++;
				}
			});
			console.log(cnt);
			if(cnt<=0){//선택X
				alert("변경할 회원을 선택해주세요");
				return false;
			}
			
			$("#dialog").dialog('open');//일정등록을 클릭하면 다이얼로그 창 보이게 하기			
			
			
			//변경을 누르면 데이터 전송()
			
			
		});
		
		//다이얼로그
		$("#dialog").dialog({
			autoOpen:false //실행시 자동열림설정(true:기본, false)
			,buttons:{
				submit : function(){
					$("#listFrm").attr("action","/staff/multiChange");	
					$("#dday").val($("#event-date").val());
					$("#listFrm").submit();
				},
				reset : function(){
					$("#event-date").val('');
				},
				close : function(){
					$("#event-date").val('');
					$("#dialog").dialog('close');
				}
			}
			,modal:true
			
		});
		
		//날짜입력박스 : datepicker 셋팅
		$("#event-date").datepicker({
			/* dateFormat : 'yy년 mm월 dd일' //y:년도2자리 yy:년도4자리
			,numberOfMonths : 1 */
			changeMonth:true,
	        changeYear:true,
	        yearRange:"2022:2025",
	        showOn:"both",
	        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
	        buttonImageOnly:true,
	        dateFormat: 'yy-mm-dd',
	        showOtherMonths: true,
	        selectOtherMonths: true,
	        showMonthAfterYear: true,
	        dayNamesMin: ['일','월', '화', '수', '목', '금', '토'],
	        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        monthNames: ['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
	        nextText: '다음 달',
	        prevText: '이전 달',
	        beforeShowDay: disableAllTheseDays
		});
	});
	
	// 특정날짜들 배열
	var disabledDays = ["2022-8-25"]; //json형태로 문자배열로 controller에 가져와서 여기로 쓰기

	// 특정일 선택막기
	function disableAllTheseDays(date) {
	    var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
	    for (i = 0; i < disabledDays.length; i++) {
	        if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
	            return [false];
	        }
	    }
	    return [true];
	}
	
	
	
</script>
<jsp:include page="admin.jsp"></jsp:include>
<div id="container">	
	<h1>예약 관리 페이지</h1>
	<hr/>
	
		<input type="button" value="예약취소" class="multiDel"/>
		<input type="button" value="예약확정" class="multiDel"/>
		
		<input type="button" id="dialogOpen" value="예약변경"/>
		
		
		<div>
			<form method="post" id="listFrm">
			<input type="hidden" name="dday" id="dday"/>
				<table id="box">
					<thead>
						<tr>
							<th>선택</th>
							<th>예약번호</th>
	               	 		<th>사용자</th>
	                		<th>홀</th>
	                		<th>예식일</th>
	                		<th>인원</th>
	                		<th>상담날짜</th>
	                		<th>드레스</th>
	                		<th>메이크업</th>
	                		<th>예약상태</th>
	            		</tr>
	            	</thead>
	            	<tbody>
	            		<c:forEach var="vo" items="${list}">	
	            		<tr>            		
							<th><input type="checkbox" name="noList" value="${vo.no}"/></th>
							<th>${vo.no}</th>
	               	 		<th>${vo.userid}</th>
	                		<th>${vo.hallname}</th>
	                		<th>${vo.dday}</th>
	                		<th>${vo.scale}</th>
	                		<th>${vo.cday}</th>
	                		<th>${vo.dress}</th>
	                		<th>${vo.makeup}</th>
	                		<th>${vo.stabdby}</th>
	            		</tr>
	            		</c:forEach>
	            	</tbody>
				</table>
			</form>
		</div>
		<!-- 예약변경창 -->
		<div id="dialog" title="예약변경">
			<label for="event-date">날짜선택</label>
			<input type="text" id="event-date"/>
		</div>
</div>