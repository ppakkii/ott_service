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
<!-- 관리자 가입페이지 -->
<link rel="stylesheet" type="text/css" href="resources/css/admin/admin_join.css">
<!-- font awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"rel="stylesheet">
<!-- 관리자 페이지 css -->

<link rel="stylesheet" type="text/css" href="resources/css/user/admin_join.css" />
<title>관리자 신청</title>
<style>

</style>

</head>
<body>
	<!-- Header -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<!-- common -->
	<div class="common_container">
		<div class="admin_board">
			<h3>관리자 신청</h3>
				<div class="m_join_box">
					<div class="common_area">
						<form action="/manager_join" method="post">				
							<input class="user_common" type="text" id="manager_id" name="manager_id" placeholder="아이디" required="required" oninput="checkId()">
							<span class="id_ok">사용 가능한 아이디 입니다.</span>
							<span class="id_length">아이디는 최소 8자이상 16자 이하입니다.</span>
							<span class="id_blank">아이디는 공백 없이 입력해주세요.</span>
							<span class="id_not">사용 불가능한 아이디 입니다.</span>
							<input class="user_common" type="password" id="manager_pw" name="manager_pw" placeholder="비밀번호" required="required" oninput="checkPw()">
							<span class="pw_ok">사용 가능한 비밀번호 입니다.</span>
							<span class="pw_length">비밀번호는 최소 8자이상 16자 이하입니다.</span>
							<span class="pw_check">비밀번호는 숫자/영문자/특수문자를 모두 포함해야 합니다.</span>
							<span class="pw_blank">비밀번호는 공백 없이 입력해주세요.</span>
							<input class="user_common" type="password" id="manager_pw2" name="manager_pw2" placeholder="비밀번호확인" required="required" oninput="confirmPw()">					
							<span class="pw_confirm">비밀번호와 같아야 합니다.</span>
							<button id="join_btn" class="user_common join_btn" type="submit" disabled="dlsabled">관리자 신청</button>
						</form>
					</div>
					<div class="user_common_service">
						<h4><a class="user_common_link" href="/manager_login">계정이 있으신가요? 로그인</a></h4>
					</div>
				</div>	
		</div>

		</div>
		
		<!-- footer -->
		
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- end of main -->
	
	
 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			//아이디가 btn인 요소가 클릭할 때
			$("#join_btn").bind("click",function(){
				//사용자가 입력한 아이디 및 비밀번호를 가져온다.
				var id = $("#manager_id").val();
				var pw = $("#manager_pw").val();
				var pw2 = $("#manager_pw2").val();
				
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
				if(pw2.trim().length <= 0){
					alert("확인 비밀번호를 입력하세요");
					$("#manager_pw2").val(""); //청소
					$("#manager_pw2").focus();
					return;
					}
				if(pw.trim() != pw2.trim()){
					alert("비밀번호와 확인 비밀번호가 다릅니다");
					$("#manager_pw2").val(""); //청소
					$("#manager_pw2").focus();
					return;
				}
				
			});
		});
		
		function checkId(){
			var manager_id = $("#manager_id").val();
			if(manager_id.trim().length >= 8 && manager_id.trim().length <= 16 && manager_id.search(/\s/) == -1){
				$.ajax({
					url:"/m_idCheck",
					type:"post",
					data:{manager_id:manager_id}
				}).done(function(cnt){
					console.log(cnt)
					if(cnt != 1){
						$(".id_ok").css("display","block");
						$(".id_not").css("display","none");
						$(".id_length").css("display","none");
						$(".id_blank").css("display","none");
						$("#join_btn").attr("disabled", false);
					}else{
						$(".id_ok").css("display","none");
						$(".id_not").css("display","block");
						$(".id_length").css("display","none");
						$(".id_blank").css("display","none");
						$("#join_btn").attr("disabled", true);
					}
				}).fail(function(err){
					alert("에러났음");
				});
			}else if(manager_id.trim().length < 1){
				$(".id_ok").css("display","none");
				$(".id_not").css("display","none");
				$(".id_length").css("display","none");
				$(".id_blank").css("display","none");
				$("#join_btn").attr("disabled", true);
			}else if(manager_id.search(/\s/) != -1) {
				$(".id_ok").css("display","none");
				$(".id_not").css("display","none");
				$(".id_length").css("display","none");
				$(".id_blank").css("display","block");
				$("#join_btn").attr("disabled", true);
			}else {
				$(".id_ok").css("display","none");
				$(".id_not").css("display","block");
				$(".id_length").css("display","block");
				$(".id_blank").css("display","none");
				$("#join_btn").attr("disabled", true);
			}
		};
		
		
		
		function checkPw() {
			var manager_pw = $("#manager_pw").val();
			var reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;
			if(reg.test(manager_pw) === true && manager_pw.search(/\s/) == -1) {
				$(".pw_ok").css("display", "block");
				$(".pw_length").css("display", "none");
				$(".pw_check").css("display", "none");
				$(".pw_blank").css("display", "none");
				$("#join_btn").attr("disabled", false);
			} else if(manager_pw.search(/\s/) != -1) {
				$(".pw_ok").css("display", "none");
				$(".pw_length").css("display", "none");
				$(".pw_check").css("display", "none");
				$(".pw_blank").css("display", "block");
				$("#join_btn").attr("disabled", true);
			} else {
				$(".pw_ok").css("display", "none");
				$(".pw_length").css("display", "block");
				$(".pw_check").css("display", "block");
				$(".pw_blank").css("display", "none");
				$("#join_btn").attr("disabled", true);
			}
		};
		
		function confirmPw() {
			var manager_pw = $("#manager_pw").val();
			var manager_pw2 = $("#manager_pw2").val();
			if(manager_pw == manager_pw2) {
				$(".pw_confirm").css("display", "none");
				$("#join_btn").attr("disabled", false);
			} else {
				$(".pw_confirm").css("display", "block");
				$("#join_btn").attr("disabled", true);
			}
		};
	</script>
</body>
</html>