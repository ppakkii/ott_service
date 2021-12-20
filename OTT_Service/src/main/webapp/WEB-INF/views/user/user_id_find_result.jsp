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

<title>아이디 찾기 결과 화면</title>
</head>
<body>
	<!-- Header -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="common_container">
		<div class="center_box">
		<div class="user_find_box">
			<div class="common_area">
				<h4><span class="name">${name}</span>님 안녕하세요?<br>
				<h4>아이디는 다음과 같습니다</h4><br>
				<h4><span class="result"><div class="border_box">${id}</div></span></h4>
			</div>
			<div class="user_common_service">
				<form action="/login">
					<button class="user_common login_link_btn">로그인</button>
				</form>
			</div>
			<div class="blank">
			</div>
		</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>