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
<title>로그인 화면</title>
</head>
<body>
	<!-- Header -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id="main_frame">
		<form action="#" method="post" class="login_main">
			<div id="blank"></div>
			<fieldset>
				<br><br>
				<div id="maincontent">아이디, 비밀번호를 작성하세요.</div><br><br>
				<input type="text" id="id" name="id" size=38 placeholder="아이디"><br><br>
				<input type="password" id="pw" name="pw" size=38 placeholder="비밀번호"><br><br><br><br>
				<input type="button" value="로그인" class="submit" id="login_btn">
			</fieldset>
			<br>
			<div id="subcontent">처음이신가요?
			<a id="text" href="join" class="alink">회원가입</a> · 
			<a id="text" href="pwreissue" class="alink">비밀번호를 잊으셨나요?</a></div>
			<br><br>
			<fieldset>
				<div id="content">소셜 로그인</div><br>
				<input type="image" class="social" src="resources/images/kakao_login.png">
				<a href="/app/naver_login"><img class="social" src="resources/images/naver_login.png"></a>
			</fieldset>
			<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		<!-- <script>
			$(function(){
				//아이디가 btn인 요소가 클릭할 때
				$("#login_btn").bind("click",function(){
					//사용자가 입력한 아이디 및 비밀번호를 가져온다.
					var id = $("#id").val();
					var pw = $("#pw").val();
					
					if(id.trim().length <= 0){
						alert("아이디를 입력하세요");
						$("#id").val(""); //청소
						$("#id").focus();
						return;
					}
					if(pw.trim().length <= 0){
						alert("비밀번호를 입력하세요");
						$("#pw").val(""); //청소
						$("#pw").focus();
						return;
					}
					//현재 문서에서 가장 첫번째 폼을 서버경로를 변경한다.
					//document.forms[0].action = "Ex3_Login";
					//document.forms[0].submit();//서버로 보낸다.
					var param = "id="+encodeURIComponent(id)+
							"&pw="+encodeURIComponent(pw);
					$.ajax({
						url: "Login", //서버 요청 URL
						data: param, //전달하고자 하는 파라미터들
						type: "post" //전송 방식
					}).done(function(data){
						if(data == 0)
							alert("아이디 또는 비밀번호가 다릅니다.");
						else
							location.href="Main";
					});
				});
			});
		</script> -->
		<div id="blank2"></div>
		</form>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script>
		$(function(){
			$("#naver").bind("click", function(){
				location.href="/naver_login";
			});
		});
	</script>
</body>
</html>