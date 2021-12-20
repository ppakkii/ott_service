<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS 공통화 -->
<link rel="stylesheet" type="text/css" href="resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/footer.css">
<!-- main CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/main/main.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<!-- user_info CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/user/user_info.css">


<title>Insert title here</title>
</head>
<body>

	<!-- Header -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="common_container">
		<!-- 여기다 작업하세요 -->
		<span class="user_mypage_text">${vo.u_name} 님의 마이페이지 입니다.</span>
		<div class="com">
			<div class="TBox img">
				<div class="img_area">
					<c:if test="${vo.fname ne null}">
						<img class="profileImg" src="${vo.fname }" alt="${id }"/>
					</c:if>
					<c:if test="${vo.fname eq null}">
						<div class="profileImg">${vo.idImg }</div>
					</c:if>
				</div>
			</div>
			<div class="MBox profile">
				<table id="Mtable" >
					
					<tbody class="profile">
						<tr>
							<td class="MTtd">닉네임 :&nbsp;</td>
							<td class="MTtd tdid1">${vo.u_name }</td>
							
						</tr>
						<tr>
							<td class="MTtd">이메일 :&nbsp;</td>
							<td class="MTtd">${vo.u_email }</td>
						</tr>
						<tr>
							<td class="MTtd">작성 리뷰 수 :&nbsp;</td>
							<td class="MTtd">${vo.reviewEA }</td>
						</tr>
						
						<tr>
							<td class="MTtd">Level :&nbsp;</td>
							<td class="MTtd">${vo.u_level }</td>
						</tr>
						<tr>
							<td colspan="2" class="MTtd2">About Me</td>
						</tr>
						<tr>
							<td colspan="2" class="MTtd2">${vo.about_me }</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		
		</div>
	</div>
	<div class="user_mypage_service">
		<div class="user_profile_area">
			<button class="user_profile_btn" type="button">프로필변경</button>	
			<button class="user_pwd_change" onclick="location.href='/pwChange';"  type="button">비밀번호변경</button>	
		</div>
	</div>
	<!--  
		<button class="BBox butter" type="button">프로필 변경</button>
		<button class="link_btn butter" type="button" onclick="location.href='/pwChange';">비밀번호 변경 페이지 이동</button>	
	-->	
	<div id="dialog" title="프로필변경">
		<form action="" method="post" enctype="multipart/form-data" name="">
		
			<table id="table" style="width: 100%; height: 100%">
				<colgroup>
					<col width="20%"/>
					<col width="*"/>
				</colgroup>
				<tbody>
					<tr>
						<td colspan="2" style="width: 100%; height: 250px;background:url('resources/user_img/default_image.png');background-size : contain; background-repeat: no-repeat;">
							<img id="preImage" src="${vo.fname }" style="width:100%; height: 100%;">
						</td>
					</tr>
					<tr>
						<td>닉네임 :</td>
						<td id="tdid1">${vo.u_name }</td>
					</tr>
					<tr>
						<td>변경할 이름:</td>
						<td><input type="text" id="u_name" name="u_name"/></td>
					</tr>
					<tr>
						<td>About_me:</td>
						<td><input type="text" id="about_me" name="about_me"/></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type='file' id="filename" name="filename"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button class="logBtn0" type="button">확인</button>
							<button class="logBtn" type="button">최소</button>
						</td>
					</tr>
				</tbody>
				
			</table>
 
	        <input type="hidden" id="u_user" name="u_idx" value="${vo.u_idx}"/>
    	</form>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		console.log('Ready');
		
		$('.user_profile_btn').on('click', function() {
			console.log('BBox Ready');
			$( "#dialog" ).dialog({
				resizable: false,
				width: 500,
				height: 500
			});
		});

		$('.logBtn').on('click', function () {
			$( "#dialog" ).dialog('close');
		});
		
        $("#filename").on('change', function(){
            readURL(this);
     
    	});
        $(".logBtn0").on("click", function () {
        	
        	var u_idx = $("#u_user").val();
        	console.log("U_idx===================>>"+u_idx);
        	var s_file = $("#filename")[0].files[0];
        	alert(typeof(s_file));
        	var u_name = $("#u_name").val();
        	console.log("u_name===================>>"+u_name);
        	var about_me = $("#about_me").val();
        	
        	//sendImage(u_idx, s_file);
        	
        		
        	if( s_file != null){
        		sendImage(u_idx, s_file, u_name, about_me);
        	}else{
        		sendImage(u_idx, s_file, u_name, about_me);
        	}
        	console.log(u_idx);
        	console.log(typeof(s_file));
        	
		})
			
	});
	function readURL(input) {
        if (input.files && input.files[0]) {
           var reader = new FileReader();
//            reader.onload = function (e) {
        	   
//               $('#preImage').css('background-image', e.target.result);
//            };
           reader.readAsDataURL(input.files[0]);
           
           
           reader.onloadend = function(e) {
        	 var file = document.getElementById('filename');
        	 $('#preImage').attr('src', e.target.result);
           };
        }
       
    }
	function sendImage(u_idx, s_file, u_name, about_me){
		
		console.log("SendImgae====================>>" + u_idx);
		
		var frm = new FormData();
		//파일을 보내야할때는 폼에 담아서 보내야한다.
		
		console.log(u_idx);
       	console.log(typeof(s_file));
		
		//보내고자 하는 자원을 위해서 만든 폼객체에 파라미터로 넣어준다.
		frm.append("u_idx", u_idx);
		
		if(u_name != null && u_name.trim().length > 0){
			console.log("u_name=====================================================>>>>"+u_name);
			frm.append("u_name", u_name);
		}
		if(s_file != null)
			frm.append("s_file", s_file);
		
		if(about_me != null && about_me.trim().length > 0)
			frm.append("about_me", about_me);
		
		//비동기식 통신
		$.ajax({
			url: "saveImage",
			data: frm,
			type: "post",
			contentType: false, //파일의형식 - enpType으로 가기 위해서 파일의 형식을 없애버렸다.
			processData: false,
			cache: false,
			dataType: "json", // 서버로부터 받을 데이터 형식
		}).done(function(data){
			$( "#dialog" ).dialog('close');
			var path = data.path; //이미지가 저장된 경로
			var fname = data.fname; // 파일명
			var u_rename = data.u_rename;
									
			if(path != null)
				$('.profileImg').attr('src', path);
			
			//console.log(path);
			//console.log(u_rename);
			//console.log(fname);
			location.reload(true);
		}).fail(function(err){
			//서버에서 오류가 발생 시
			console.log(err);
		});
	}

</script>
</body>
</html>