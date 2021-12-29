<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 메인 이미지 슬라이더 JS -->
<script type="text/javascript" defer="defer" src="resources/js/main_js/slider.js"></script>
<!-- 특정한 리스트에 이미지를 보여주고 화살표 클릭시 다음 이미지 불러오는 JS  -->
<script type="text/javascript" defer="defer" src="resources/js/main_js/movie_order.js"></script>
<!-- CSS 공통화 -->
<link rel="stylesheet" type="text/css" href="resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/footer.css">
<!-- main CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/main/main.css">
<!-- 이미지 슬라이더 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/main/slider.css">
<!-- font awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"rel="stylesheet">
<!-- 관리자 페이지 css -->
<link rel="stylesheet" type="text/css" href="resources/css/admin/admin_login.css">


<title>관리자 로그인</title>

<style>


</style>
</head>
<body>
	<!-- Header -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<!-- common -->
	<div class="common_container">
		<div class="admin_board">
			<h3>관리자 로그인</h3>
			<div class="common_area">

				<form action="/admin" method="post">
					<p><input class="manager_common" type="text" id="manager_id" 
						name="manager_id" placeholder="아이디" required="required"> 
					</p>			
					<br/>
					<p><input class="manager_common" type="password" id="manager_pw" 
					    name="manager_pw" placeholder="비밀번호" required="required">
					</p>
					<br/>
					<button class="manager_common login_btn">로그인</button>
				</form>
			</div>
			<div class="manager_common_service">
				<h4>
					<a class="manager_join" href="/manager_join">관리자 신청</a>
				</h4>
			</div>


		</div>
		
	</div>
	<!-- end of main -->
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			//아이디가 btn인 요소가 클릭할 때
			$(".login_btn").bind("click",function(){
				//사용자가 입력한 아이디 및 비밀번호를 가져온다.
				var id = $("#manager_id").val();
				var pw = $("#manager_pw").val();
					
				if(id.trim().length <= 0){
					alert("아이디를 입력하세요");
					$("#manager_id").val(""); //청소
					$("#manager_id").focus();
					return;
				}
				if(pw.trim().length <= 0){
					alert("비밀번호를 입력하세요");
					$("#manager_pw").val(""); //청소
					$("#manager_pw").focus();
					return;
				}
			});
		});
	</script>

</body>
</html>