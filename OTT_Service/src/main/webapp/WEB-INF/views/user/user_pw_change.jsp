<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS 공통화 -->

<link rel="stylesheet" type="text/css" href="resources/css/common/common.css" />
<link rel="stylesheet" type="text/css" href="resources/css/common/footer.css" />
<!-- main CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/main/main.css" />

<!-- user common (id/pw find) css -->
<link rel="stylesheet" type="text/css" href="resources/css/user/user_join.css" />

<title>비밀번호 변경 화면</title>
</head>
<body>
	<!-- Header -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="common_container">
		<div class="user_change_box">
			<div class="common_area2">
				<h4>회원가입 시 작성하신 비밀번호와 새로운 비밀번호를 작성해주세요</h4>
				<form action="/changeAction" method="post">			
					<input type="hidden" value="${uvo.u_id}" name="u_id">				
					<input type="hidden" value="${uvo.u_idx}" name="idx">				
					<input class="user_common" type="password" id="u_pwd1" name="u_pwd1" placeholder="기존 비밀번호" required="required">
					<input class="user_common" type="password" id="u_pwd2" name="new_pwd" placeholder="변경할 비밀번호" required="required" oninput="checkPw()">
					<span class="pw_ok">사용 가능한 비밀번호 입니다.</span>
					<span class="pw_length">비밀번호는 최소 8자이상 16자 이하입니다.</span>
					<span class="pw_check">비밀번호는 숫자/영문자/특수문자를 모두 포함해야 합니다.</span>
					<span class="pw_blank">비밀번호는 공백 없이 입력해주세요.</span>
					<input class="user_common" type="password" id="u_pwd3" name="u_pwd3" placeholder="변경할 비밀번호 확인" required="required" oninput="confirmPw()">
					<span class="pw_confirm">비밀번호와 같아야 합니다.</span>
					<button  type="submit" id="change_btn" class="user_common get_value" disabled="disabled">비밀번호 변경</button>
				</form>
			</div>
		</div>	
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
	
	/*
	function isEqualPw() {
		var u_pw = $("#u_pwd1").val();
	}
	*/
	function checkPw() {
		var u_pw = $("#u_pwd2").val();
		var reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;
		if(reg.test(u_pw) === true && u_pw.search(/\s/) == -1) {
			$(".pw_ok").css("display", "block");
			$(".pw_length").css("display", "none");
			$(".pw_check").css("display", "none");
			$(".pw_blank").css("display", "none");
			$("#change_btn").attr("disabled", false);
		} else if(u_pw.search(/\s/) != -1) {
			$(".pw_ok").css("display", "none");
			$(".pw_length").css("display", "none");
			$(".pw_check").css("display", "none");
			$(".pw_blank").css("display", "block");
			$("#change_btn").attr("disabled", true);
		} else {
			$(".pw_ok").css("display", "none");
			$(".pw_length").css("display", "block");
			$(".pw_check").css("display", "block");
			$(".pw_blank").css("display", "none");
			$("#change_btn").attr("disabled", true);
		}
	};
	
	function confirmPw() {
		var u_pw2 = $("#u_pwd2").val();
		var u_pw3 = $("#u_pwd3").val();
		if(u_pw2 == u_pw3) {
			$(".pw_confirm").css("display", "none");
			$("#change_btn").attr("disabled", false);
		} else {
			$(".pw_confirm").css("display", "block");
			$("#change_btn").attr("disabled", true);
		}
	};
	
	</script>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>