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
<link rel="stylesheet" type="text/css" href="resources/css/user/user_common_find.css" />

<title>비밀번호 재발급 화면</title>
</head>
<body>
	<!-- Header -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="common_container">
		<div class="user_login_box">
			<div class="common_area">
				<h4>회원가입 시 작성하신 아이디와 이메일을 작성해주세요</h4>
				<form action="/reissueAction" method="post">				
					<input class="user_common" type="text" id="u_id" name="u_id" placeholder="아이디" required="required">
					<input class="user_common" type="email" id="u_email" name="u_email" placeholder="이메일" required="required">
					<button class="user_common get_value">비밀번호 재발급</button>
				</form>
			</div>
			
			<div class="user_common_service">
				<h4><a class="user_common_link" href="/idfind">아이디를 잊으셨나요?</a></h4>
			</div>
		</div>	
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>