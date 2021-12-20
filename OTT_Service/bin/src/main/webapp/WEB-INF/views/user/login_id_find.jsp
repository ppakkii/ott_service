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
<title>아이디 찾기 화면</title>
</head>
<body>
	<!-- Header -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id="main_frame">
		<form action="#" method="post" class="id_find">
			<div id="blank"></div>
			<fieldset>
				<br><br>
				<div id="content">이름, 이메일을 작성하세요.</div><br><br>
				<input type="text" id="name" name="name" size=38 placeholder="이름"><br><br>
				<input type="text" id="email" name="email" size=38 placeholder="이메일(kim@example.com)"><br><br><br><br>
				<input type="button" value="아이디 찾기" class="submit">
			</fieldset>
			<br>
			<div>처음이신가요? <a href="join" class="alink">회원가입</a>
			 · <a href="pwreissue" class="alink">비밀번호를 잊으셨나요?</a></div>
		<div id="blank4"></div>
		</form>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>