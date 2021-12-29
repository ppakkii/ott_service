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
<link rel="stylesheet" type="text/css" href="resources/css/BBS/qna_view.css">
<title>Insert title here</title>

<style type="text/css">


</style>
</head>
<body>

	<!-- Header -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<div class="common_container">
		<h2>QNA 게시판</h2>


		<c:if test="${q_vo ne null }">
			<div id="bbs_qna">

					<table summary="게시판 보기">
						<caption>게시판 글 보기</caption>
						<tbody>
							<tr>
								<th>제목:</th>
								<td>
									<c:if test="${q_vo.secret eq 'private'}"><i class="fas fa-lock"></c:if> 
									${q_vo.subject }
								</td>
							</tr>
							<tr>
								<th>날짜</th>
								<td>${q_vo.write_date }</td>
							</tr>
							<tr>
								<th>이름:</th>
								<td>${u_vo.u_name }</td>
							</tr>
							<tr>
								<th>내용:</th>
								<td><textarea class="content_ta" readonly="readonly">${q_vo.content }</textarea></td>
							</tr>

							<tr>
								<td colspan="2">
								<input type="button" value="수정" onclick="edit('${u_vo.u_id}')"/>
								<input type="button" value="삭제" onclick="del('${u_vo.u_id}')"/>
								<input type="button" value="목록" onclick="goList()"/>
								
								</td>
							</tr>
						</tbody>
					</table>
			
				<form id="qna_answer"  method="post" action="/QNA.answer">
					<table>
						<tbody>
							<tr>
								<th>관리자:</th>
<!--========================================= om_idx value에 세션에 접속중인 값 자동으로 들어가야 됨=========================== -->
								<td>
									<input type="hidden" name="om_idx" value="${ManVO.om_idx }"/> 
						  			<input type="text" name="manager_id" value="${ManVO.manager_id}" readonly="readonly"/> 
						  		</td>
<!--============================================================================================================================ -->
							</tr>
							<tr>
								<th>내용: </th>
								<td>
									<textarea id="a_content_ta" rows="4" cols="55" name="a_content"></textarea>
						  		</td>
							</tr>
							<tr>
								<td colspan="2">
								<input id="c_save_btn"type="button" value="저장"/>
								</td>
							</tr>
						</tbody>
					</table>
					
					<br /> 

					<%-- 원글을 의미하는 원글의 기본키 --%>
					<input type="hidden" name="rb_idx" value="${q_vo.rb_idx }"> 
					<input type="hidden" name="cPage" value="${param.cPage }">

		
				</form>
				<p />
				<hr id="horizon"/>
				<span id="ans">Answer</span>
				
				
				<!-- 댓글 리스트 뿌려주기 -->
				<c:forEach var="qc_vo" items="${q_vo.c_list }">
				
						<div>
							<table id="qna_comment">
								<tbody>
									<tr>
										<th>관리자</th>
										<td >${qc_vo.manager_id}</td>
								
										
	
										<th>날짜</th>
										<td>${qc_vo.answer_date }</td>

									</tr>
									<tr>
										<th>내용</th>
										<td colspan="3">
											<textarea class="comment_ta" name= "a_content" readonly="readonly" >${qc_vo.a_content }</textarea>
										</td>
									</tr>
									<tr class="lastTr">
										<td colspan="4">
											<div class="editDiv" style="display: block; float: left; padding-right:5px;">
												<input type="button" class="c_edit_btn" value="수정"/>
											</div>
											<div class="okDiv" style="display: none; float: left; padding-right:5px;">
												<input type="button" class="c_editok_btn" value="확인"/>
												<input type="hidden"  name="om_idx" class="d_om_idx" value = " ${qc_vo.om_idx}" />
												<input type="hidden"  name="c_idx"  class="d_c_idx"  value =" ${qc_vo.c_idx }" />
												
											</div>
											<div style="float: left;">
												<input class="delCommbtn" type="button" value="삭제" />
												<input type="hidden" name="rb_idx" value="${q_vo.rb_idx }"> 
												<input type="hidden" name="cPage" value="${param.cPage }">
											</div>
										</td>
									</tr>
									
								</tbody>
							</table>
						</div>
					</form>
				</c:forEach>
			</div>

			<form name="frm" method="post">
				<input type="hidden" name="cPage"  value="${param.cPage }"> 
				<input type="hidden" name="rb_idx" value="${q_vo.rb_idx }">
				<input type="hidden" name="bname"  value="${q_vo.bname }" />
			</form>
			
			<!-- 수정하기 FORM -->
			<form id="editComment" name="editComment" method="post" action="/QNA.editComm">
				<input type="hidden"  name="cPage"  		id="e_cPage"    value="${param.cPage }"> 
				<input type="hidden"  name="rb_idx" 		id="e_rb_idx"   value="${q_vo.rb_idx }">
				<input type="hidden"  name="c_idx"  		id="e_c_idx" value="" />
				<input type="hidden"  name="a_content"  	id="e_a_content" value=""/>
				<input type="hidden"  name="om_idx"  		id="e_om_idx" value="" />
			</form>

			
			
			<!-- 삭제하기 FORM -->
			<form id="delComment" name="delComment" method="post" action="/QNA.delComm">
				<input type="hidden"  name="cPage"  		id="d_cPage"    value="${param.cPage }"> 
				<input type="hidden"  name="rb_idx" 		id="d_rb_idx"   value="${q_vo.rb_idx }">
				<input type="hidden"  name="om_idx"  		id="d_om_idx" value="" />
				<input type="hidden"  name="c_idx"  		id="d_c_idx" value="" />
			</form>

			
			<!-- footer -->
			<jsp:include page="../common/footer.jsp"></jsp:include>
			
			<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
			<script>
			//	세션의 ID
			var ss_u_id = '${uvo.u_id}';
			var ss_m_id = '${ManVO.manager_id}'
			//==============	원글 수정	==================
				function edit(u_id) {
					// 세션의 ID와, 글의 ID값을 비교하여 수행
					if(ss_u_id == u_id){
						document.frm.action = "/QNA.edit";
						document.frm.submit();
					}else if(ss_u_id != u_id){
						alert("권한이 없습니다.")
						return;
					}
				}

			//==============	QNA 게시판 목록	==================
			 	function goList() {
					
					document.frm.action = "/QNA.list";
					document.frm.submit();
				} 

			//==============	원글 삭제	==================

				function del(u_id) {
					// 세션의 ID와, 글의 ID값을 비교하여 수행
					if(ss_m_id){
						if (confirm("삭제하시겠습니까?")) {
							document.frm.action = "/QNA.delete";
							document.frm.submit();
						}else
							return;
					}else if(ss_u_id){
						if(u_id != ss_u_id){
							alert("권한이 없습니다.")
						return;
						}else if (u_id == ss_u_id){
							if (confirm("삭제하시겠습니까?")) {
								document.frm.action = "/QNA.delete";
								document.frm.submit();
							}else{
								return;
							}
						}else if(u_id != ss_u_id){
							alert("권한이 없습니다.");
						}
					}
				}				
			//=============jquery===============
		$(function (){
			//******(댓글) 저장 버튼 클릭 시 *******
			$("#c_save_btn").click(function(){
				if(	ss_m_id == "undefinded" || ss_m_id == "" || ss_m_id == null){
					alert("권한이 없습니다.");
					return;
				}else
				saveComment();
				
			});
			function saveComment() {
				var content = $("#a_content_ta").val()
				// alert(content);
				if(content == null || content==""){
					alert("내용을 입력해주세요!");
					return;
				}else{
					var result = confirm("저장하시겠습니까?")
						if(result){
							$("#qna_answer").submit();
						}else
							return;
			}
		 
		}
			
			
			$(".c_edit_btn").click(function(){ 
				
				
				//****** 수정 버튼 클릭 시******
				edit_confirm($(this));
				
			});
			

			//****** 확인 버튼 클릭 시 ******
			$(".c_editok_btn").click(function(){
				edit_ok($(this));
			});	
			
			function edit_confirm(obj){
				alert("수정하시겠습니까?")
				$(obj).parent('.editDiv').css("display","none");
				$(obj).parent().next('.okDiv').css("display","block");
				// $(obj).parent().next('.comment_ta').attr("readonly","false");
				$(obj).parent().parent().parent().prev().find('.comment_ta').attr("readonly",false);		
			}
			
			function edit_ok(obj){
				var result = confirm("글을 저장하시겠습니까?");
				if(result){
					$(obj).parent('.okDiv').css("display","none");
					$(obj).parent().prev('.editDiv').css("display","block");
					$(obj).parent().parent().parent().prev().find('.comment_ta').attr("readonly",true);
					var c_idx = $(obj).next().next().val();
					var om_idx = $(obj).next().val();
					var a_content = $(obj).parent().parent().parent().prev().find('.comment_ta').val();
					//alert(a_content);
					//alert(om_idx);
					//alert(c_idx);
					$('#e_c_idx').val(c_idx);
					$('#e_a_content').val(a_content);
					$('#e_om_idx').val(om_idx);
					
					//데이터 보내기
					$("#editComment").submit();
				} else{
					return;	
				}
				
			}
			
			//	삭제버튼 클릭시
			$(".delCommbtn").click(function(){
				if(	ss_m_id == "undefinded" || ss_m_id == "" || ss_m_id == null){
					alert("권한이 없습니다.");
					return;
				}else
				edit_del($(this));
			});	
			function edit_del(obj){
				var result = confirm("글을 삭제하시겠습니까?");
				if(result){
					// $("#editComment").attr("action","/QNA.delComment").submit();
					// $("#editComment").submit();
					var om_idx = $(obj).parent().prev().find('.d_om_idx').val();
					var c_idx = $(obj).parent().prev().find('.d_c_idx').val();
					// alert(om_idx);
					// alert(c_idx);
					$('#d_om_idx').val(om_idx);
					$('#d_c_idx').val(c_idx);
					
					$("#delComment").submit();
				}
			}
		});
			//=============jquery===============
					
		</script>
		</c:if>
		<c:if test="${q_vo eq null }">
			<script>
				location.href = "/QNA.list";
			</script>
		</c:if>
</body>
</html>