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

<title>비밀번호 변경 완료 화면</title>
</head>
<body>
	<!-- Header -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="common_container">
		<div class="center_box">
		<div class="user_find_box">
			<div class="common_area">
				<div class="blank2"></div>
				<h3>비밀번호 변경에 성공했습니다.</h3><br>
			</div>
			<div class="user_common_service">
			</div>
			<div class="blank">
			</div>
		</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
	alert('비밀번호 변경에 성공했습니다!');
	document.location.href = '/';
	/* POST방식은 연구중입니다. 일단 메인으로 가게 해놨습니다.
	function sendPost(action, params) {
		var form = document.createElement('form');
		form.setAttribute('method', 'post');
		form.setAttribute('action', action);
		document.charset = "utf-8";
		for ( var key in params) {
			var hiddenField = document.createElement('input');
			hiddenField.setAttribute('type', 'hidden');
			hiddenField.setAttribute('name', key);
			hiddenField.setAttribute('value', params[key]);
			form.appendChild(hiddenField);
		}
		document.body.appendChild(form);
		form.submit();
	}
		
		alert('비밀번호 변경에 성공했습니다!');
		sendPost('/user_info', ' ');
	*/
	</script>
</body>
</html>