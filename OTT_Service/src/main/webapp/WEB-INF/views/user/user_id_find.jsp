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

<title>아이디 찾기 화면</title>
</head>
<body>
	<!-- Header -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="common_container">
		<div class="user_login_box">
			<div class="common_area">
				<h4>회원가입 시 등록하신 정보로 회원님의 아이디를 찾을 수 있습니다.</h4>
				<form action="findAction" method="post">
					<input class="user_common" type="email" id="u_email" name="u_email" placeholder="이메일" required="required">
					<button class="user_common get_value">아이디 찾기</button>
				</form>
			</div>
			<div class="user_common_service">
				<h4><a class="user_common_link" href="/login">로그인</a></h4>
			</div>
		</div>	
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>