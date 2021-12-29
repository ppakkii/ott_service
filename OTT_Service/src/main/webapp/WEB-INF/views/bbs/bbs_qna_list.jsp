<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
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
<link rel="stylesheet" type="text/css" href="resources/css/BBS/qna_list.css">
<title>Insert title here</title>

<style type="text/css">

</style>
</head>
<body>

	<!-- Header -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<div class="common_container">
		<h2>QNA 게시판</h2>
		<div id="bbs_qna">
			<table summary="게시판 목록">
				<caption>게시판 목록</caption>
				<thead>
					<tr class="title">
						<th class="no">번호</th>
						<th class="subject"></i>제목</th>	<!-- 제목 옆에 열쇠 아이콘을 넣어서 공개범위표시 -->
						<th class="u_idx">글쓴이</th>
						<th class="write_date">날짜</th>
						<th class="hit">조회수</th>
					</tr>
				</thead>

				<tfoot>
					<tr>
						<td colspan="4">${pageCode }</td>
						<td>
							<input id="writeQna" type="button" value="글쓰기" />
						</td>
						<td style="display: none;" id=session_id >${uvo.u_id}</td>
					</tr>
				</tfoot>
				<tbody>
					<c:forEach var="vo" items="${ar }" varStatus="st">
						<tr>
							<td>
								<%--순차적인 번호를 만들어서 표현하자! --%>
								${rowTotal-((nowPage-1)*blockList+st.index) }
							</td>
							<td style="text-align: left">
								<c:if test="${vo.secret eq 'private'}"><i class="fas fa-lock"/></c:if>
								
								
								
								<a class="viewQna" style="cursor:pointer;" onclick="check_session('${vo.u_id}','${vo.rb_idx}','${vo.secret}')" >${vo.subject }</a>

								<c:if test="${fn:length(vo.c_list) > 0}">
									(${fn:length(vo.c_list)})
								</c:if> 
				
							</td>
							<td>${vo.u_name}</td>
							<td>${vo.write_date }</td>
							<td>${vo.hit }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>

	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
	var nowPage = ${nowPage};
	var ss_u_id = '${uvo.u_id}';			//	세션에 저장된 유저 아이디
	var ss_m_id = '${ManVO.manager_id}';	//	세션에 저장된 관리자 아이디
	
	/*
		u_id    : 게시글의 아이디 
	    rb_idx  : 게시판의 index
	    uvo.u_id : 세션 아이디
	*/
	function check_session(u_id, rb_idx, secret){
		
	    // 로그인 체크
	    if((ss_u_id == "undefinded" || ss_u_id == "" || ss_u_id == null) &&(
	    		ss_m_id == "undefinded" || ss_m_id == "" || ss_m_id == null)){
	    	alert('로그인 해주세요.');
	    	location.href="/login";
	    	return;
	    }
	    	
	    	
	    
		if(secret == "public"){
			location.href="QNA.view?rb_idx="+rb_idx+"&cPage="+nowPage;
		}else if(secret == "private"){
			if(!ss_u_id){
				if(ss_m_id){
					location.href="QNA.view?rb_idx="+rb_idx+"&cPage="+nowPage;	
				}else if(!ss_m_id){
					alert("비밀글입니다.");
					return false;
				}
			}else if(ss_u_id){
				if(ss_u_id == u_id){
					location.href="QNA.view?rb_idx="+rb_idx+"&cPage="+nowPage; 
				}else if(ss_u_id != u_id){
					alert("비밀글입니다.");
					return false;
				}
			}
			
		}
	}
	
	//jQUERY START
	$(function(){
		// 로그인 안하고 글을 쓰면 로그인 화면으로 이동
		$("#writeQna").click(function(){
			writeQna($(this));
		});
		function writeQna(obj){
			var u_id = $(obj).parent().next().text();
			// alert(u_id);
			if(u_id == null || u_id ==''){
				alert("로그인 후 이용해주세요.")
				$(location).attr('href','/login');
			}else{
				$(location).attr('href','/QNA.write');
			}
		}
	});

//jQUERY END
</script>

</body>
</html>