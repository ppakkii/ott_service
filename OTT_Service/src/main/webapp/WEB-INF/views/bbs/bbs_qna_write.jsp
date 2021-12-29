<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS 공통화 -->
<link rel="stylesheet" type="text/css" href="resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/footer.css">
<!-- main CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/main/main.css">
<!-- bbs_qna CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/BBS/qna_common.css">
<link rel="stylesheet" type="text/css" href="resources/css/BBS/qna_write.css">
<title>Insert title here</title>
</head>
<body>

	<!-- Header -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<div class="common_container">
		<h2>QNA 글 작성</h2>
		<div id="bbs_qna">
			<form id="sendForm" action="/QNA.write" method="post">
				<div id="qna_table">
					<table summary="게시판 글쓰기">
						<caption>게시판 글쓰기</caption>
						<tbody>
							<tr>
								<th>제목:</th>
								<td><input id="subject" type="text" name="subject" size="45" /></td>
							</tr>
							<tr>
								<th>이름:</th>
								<td>
									<input type="hidden" id="u_id" name="u_id" size="12"
									readonly="readonly" value="${uvo.u_id }"/>
								
									<input type="text" id="u_name" name="u_name" size="12"
									readonly="readonly" value="${u_name }"/>
								
								</td>
							</tr>
							<tr>
								<th>내용:</th>
								<td><textarea class="content_ta" name="content" ></textarea></td>
							</tr>
							<tr>
								<th>공개범위:</th>
								<td>
									<input type="radio" value="public" name="secret"  checked="checked">공개글</input>
									<input type="radio" value="private" name="secret">비밀글</input>
								</td>
							<tr>
							<tr>
								<td colspan="2">
									<input id="send_btn" type="button" value="보내기"/> 
									<input type="button" value="목록" onclick="location.href='/QNA.list'" />
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		</div>

	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>

	$(document).ready(function() {
		$("#send_btn").click(function() {
			onClickSend();
		});
		
		function onClickSend(){
			var subject = $("#subject").val().trim().length;
			var content = $(".content_ta").val().trim().length;
				if(subject <=0){
				alert("제목을 입력하세요");
				}else if(content <=0){
					alert("내용을 입력하세요");
				}else{
					
					if(confirm("글을 등록하시겠습니까?") == true){
						$("#sendForm").submit();
					}else
						return false;
					
				
				}
					
		}
	
	})
	</script>

</body>
</html>