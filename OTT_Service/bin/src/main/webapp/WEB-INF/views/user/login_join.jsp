<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS 공통화 -->
<link rel="stylesheet" type="text/css" href="resources/css/user/user_login.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/common/common.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/common/footer.css"/>
<!-- main CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/main/main.css"/>
<title>회원 가입 화면</title>
</head>
<body>
	<!-- Header -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id="main_frame">
		<form action="#" method="post" class="join">
			<div id="blank"></div>
			<fieldset>
				<br><br>
				<div id="content">아이디, 이메일, 비밀번호를 작성하세요.</div><br><br>
				<input type="text" id="id" name="id" size=46 placeholder="아이디"><br><br>
				<input type="text" id="name" name="name" size=46 placeholder="이름"><br><br>
				<input type="text" id="email" name="email" size=46 placeholder="이메일(kim@example.com)"><br><br>
				<input type="password" id="pw" name="pw" size=46 placeholder="비밀번호"><br><br>
				<input type="password" id="pw2" name="pw2" size=46 placeholder="비밀번호 확인"><br><br>
				<input type="button" value="회원가입" class="submit">
			</fieldset>
			<br>
			<div>회원가입을 했을 시 약관에 동의한 것으로 간주됩니다.
			</div>
			<br>
			<!-- 
			<fieldset>
				<div>계정 정보 만들기</div><br>
				<input type="image" class="social" src="resources/images/kakao_login.png">
				<input type="image" class="social" src="resources/images/naver_login.png">
			</fieldset>
			<br> -->
			<div>이미 계정이 있나요? <a href="login" class="alink">로그인</a>
			</div>
			<div id="blank3"></div>
		</form>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>