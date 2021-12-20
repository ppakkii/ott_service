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
<link rel="stylesheet" type="text/css" href="resources/css/BBS/qna_edit.css">

<title>Insert title here</title>

	

</head>
<body>

<!-- Header -->
<jsp:include page="../common/header.jsp"></jsp:include>

<div class="common_container">
	<h2>QNA 게시판</h2>
	<div id="bbs_qna">
	<form id="editForm" action="/QNA.edit1" method="post">
	
		<input type="hidden" name="rb_idx" value="${q_vo.rb_idx }"/>
		<input type="hidden" name="cPage" value="${param.cPage }"/>
		
		<table summary="게시판 수정">
			<caption>게시판 수정</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td><input class="subject" type="text" id="subject" name="subject" size="45" 
						value="${q_vo.subject }"/></td>
				</tr>
				<tr>
					<th>이름:</th>
					<td><input type="text" name="u_name" size="12" 
						value="${u_vo.u_name }" readonly="readonly" class="disabled"/></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td><textarea class="content_ta" name="content" cols="50" 
							rows="8">${q_vo.content }</textarea></td>
				</tr>
				<tr>
					<th>공개범위:</th>
						<td>
							<input type="radio" value="public" name="secret" <c:if test="${q_vo.secret eq 'public' }"> checked="checked"</c:if>>공개글</input>
							<input type="radio" value="private" name="secret" <c:if test="${q_vo.secret eq 'private' }"> checked="checked"</c:if>>비밀글</input>
						</td>
					<tr>
				<tr>
					<td colspan="2">
						<input id="edit_btn" type="button" value="확인"
						onclick="location.href='/QNA.view'"/>
						<input type="button" value="목록" onclick="goList()"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>

</div>
<form name="frm" method="post">
				<input type="hidden" name="cPage" value="${param.cPage }"> <input
		type="hidden" name="rb_idx" value="${q_vo.rb_idx }"> <input
		type="hidden" name="bname" value="${q_vo.bname }" />
</form>
<!-- footer -->
<jsp:include page="../common/footer.jsp"></jsp:include>


<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
 	function goList() {
		
		document.frm.action = "/QNA.list";
		document.frm.submit();
	} 

		
		$(document).ready(function() {
			$("#edit_btn").click(function() {
				onClickEdit();
			});
			
			function onClickEdit(){
				var subject = $("#subject").val().trim().length;
				var content = $(".content_ta").val().trim().length;
					if(subject <=0){
					alert("제목을 입력하세요");
					}else if(content <=0){
						alert("내용을 입력하세요");
					}else{
						confirm("글을 수정하시겠습니까?");
						if(confirm){
							$("#editForm").submit();
						}else{
							return false;
						} 
					
					}
						
			}
		
		})
	</script>
</body>
</html>
