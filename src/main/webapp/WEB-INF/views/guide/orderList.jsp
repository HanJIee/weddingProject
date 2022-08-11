<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	.box{text-align:center;}
	ul,li{
		margin:0; padding:0; list-style-type:none;
	}
	#topImg>img{
	width: 1980px;
	position: relative;
	bottom: 600px;
	}
	#topimg{height:300px; overflow:hidden;}
	#headtitle{
		text-align: center;
		line-height: 20px;
	}
	#headtitle h1{
		margin-top: 150px;
		font-size: 50px;
		font-family: Bell MT;
		color: #FFA200;
		font-weight: bold;
	}
	#headtitle p{
		color: #FFA200;
		font-size: 20px;
		font-family: Bell MT;
		margin-bottom: 70px;
	}
	.menu>li{
		float:left;
		width:50%;
		height:50px;
		line-height:50px;
		text-align:center; 
		background-color: orange;
	}
	.menu>li:first-child{
		background-color:white;
	}
	#middle>img{width:70%; margin:25px auto;}
	
	input[type="button"]{
		background-Color:rgb(255,162,0); 
		border:none;
		font-size:20px;   
		font-weight:bold; 
		color:#fff;   
		width:275px; height:50px; 
		margin:40px 20px 80px;
	}
	
	@media print {
		/*header,footer 제거*/
  		@page { margin: 0; }
  		body { margin: 1.6cm;page-break-after: avoid; page-break-before: avoid}
  		
  		
  		#middle{ /*img를 .page안에 꽉차게 */
	    position:absolute;
	    top:0;
	    left:0;
	    right:0;
	    width:100%;
	    height:100%
	    }
	    #topimg{display:none;}
	}
	
</style>
<script>

	 $(function(){
		$('#print').on('click', function(){
			 window.print();  // 클릭액션 : 버튼클릭시 인쇄창팝업
		  });
	});
	
	
</script>
<div class="box">
	<div id="topimg">
		<img src="/img/h01.jpg"/>
	</div>
	<div>
		<ul class="menu">
			<li><a href="#">식순리스트</a></li>
			<li><a href="#">체크리스트</a></li>
		</ul>
	</div>
	<div id="headtitle">
		<h1>Wedding Program</h1>
		<P>결혼식 진행순서에 대해 안내해 드립니다.</P>
	</div>
	<!-- 컨텐츠 -->
	<div id="middle">
		<img src="/img/guide/order.png"/>
	</div>
	<a href="/file/order.png" download><input type="button" id="down" value="결혼식순서 다운로드"/></a>
	<input type="button" id="print" value="결혼식순서 인쇄하기" onclick="return printPage();"/>
	
</div>
