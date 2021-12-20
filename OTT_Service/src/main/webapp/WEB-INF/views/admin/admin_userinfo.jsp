<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS 공통화 -->
<link rel="stylesheet" type="text/css"
	href="resources/css/common/common.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/common/footer.css">
<!-- main CSS -->
<link rel="stylesheet" type="text/css"
	href="resources/css/main/main.css">
<!-- paging_admin CSS  -->
<link rel="stylesheet" type="text/css"
	href="resources/css/admin/paging_admin.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/admin/admin_userinfo.css">

<title>Insert title here</title>

</head>
<body>

	<!-- Header -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<div class="common_container">
		<div class="user_board">
			<h1>회원관리 게시판</h1>
			<h2>회원 검색</h2>
			<div>
				<span>회원 검색</span> 
				<select id="search_user" name="search_user">



					<option value=""  >:: 선택하세요 ::</option>
					<option value="0" <c:if test="${searchType eq '0'}"> selected</c:if>>u_idx</option>
					<option value="1" <c:if test="${searchType eq '1'}"> selected</c:if>>아이디</option>
					<option value="2" <c:if test="${searchType eq '2'}"> selected</c:if>>이름</option>
					<option value="3" <c:if test="${searchType eq '3'}"> selected</c:if>>이메일</option>
					<option value="4" <c:if test="${searchType eq '4'}"> selected</c:if>>정지</option>

				</select> 
				<input class="user_search_ta" type="text" name="user_search_ta" value="${searchValue}"/>
				<input class="user_search_btn" type="button" name="user_search_btn" id="user_search_btn" value="검색" />
				
			</div>
			<table summary="회원 목록">
				<caption>
					<span>총 회원수 : ${rowTotal }명</span>
					<div>
						<button id="ok_btn" class="ok_btn" type="submit">확인</button>
						<button id="edit_btn" class="edit_btn" type="button">수정</button>

					</div>
				</caption>
				<colgroup>
					<col width="80x">
					<col width="150px">
					<col width="150px">
					<col width="100px">
					<col width="100px">
					<col width="100px">
					<col width="100px">
					<col width="100px">



				</colgroup>
				<!-- 게시판 상단영역 -->
				<thead>
					<tr>
						<th>선택</th>
						<th>번호</th>
						<th>u_idx</th>
						<th>아이디</th>
						<th>이름</th>
						<th>이메일</th>
						<th>정지/탈퇴</th>

					</tr>
				</thead>

				<!-- 게시판 바디영역 -->
				<tbody></tbody>
				<c:forEach var="vo" items="${ar }" varStatus="st">
					<tr>
						<td><input type="checkbox" class="chk" name="chk"
							style="display: none;" /></td>
						<td>
							<%--순차적인 번호를 만들어서 표현하자! --%>
							${rowTotal-((nowPage-1)*blockList+st.index) }
						</td>
						<td>${vo.u_idx }</td>
						<td>${vo.u_id }</td>
						<td>${vo.u_name }</td>
						<td>${vo.u_email }</td>
						<td><select class="opt_Stop" name="opt_Stop"
							style="display: none;">
								<option value=""
									<c:if test="${vo.is_stop ne '0' || vo.is_stop ne '1'}"  > selected</c:if>>::선택하세요::</option>
								<option value="1"
									<c:if test="${vo.is_stop eq '1'}"> selected</c:if>>정지회원(1)</option>
								<option value="0"
									<c:if test="${vo.is_stop eq '0' }"  > selected</c:if>>일반회원(0)</option>
						</select>

							<div class="isStop" style="display: block;">

								<c:choose>
									<c:when test="${vo.is_stop eq  '1'}">
					         	정지회원(1)
					         </c:when>
									<c:when test="${vo.is_stop eq '0'}">
					         	일반회원(0)
					         </c:when>
									<c:otherwise>
					    		일반회원
					         </c:otherwise>
								</c:choose>
							</div></td>
						<td style="display: none">${vo.is_stop}</td>

					</tr>
				</c:forEach>
				<!-- 게시판 풋터영역 -->
				<tfoot>
					<tr>
						<td colspan="10">${pageCode }</td>
					</tr>
				</tfoot>
				</tbody>
			</table>
		</div>

	</div>

	<form id="is_stopForm" method="post" action="admin_update">
		<input type="hidden" id="dataList" name="dataList" value="">
	</form>
	<form id="searchFrom" method="post" action="admin_search">
		<input type="hidden" id="searchValue" name="searchValue" value="${searchValue}">
		<input type="hidden" id="searchType" name="searchType" value="${searchType}">
		
	</form>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>


</body>
</html>


<script>
	//jQUERY START
	$(document).ready(function() {
//******************회원 정지 수정 기능 START****************************
		// =========  수정 버튼 클릭 SATRT ===========
		$('#edit_btn').click(function() {
			onClickEdit();

		});

		function onClickEdit() {
			$(".chk").css("display", "block");
			$(".opt_Stop").css("display", "block");

			if ($(".opt_Stop").css("display", "block")) {
				$(".isStop").css("display", "none");
			} else {
				$(".isStop").css("display", "block");
			}
		}
		// =========  수정 버튼 클릭 END ===========

		// =========  확인 버튼 클릭 SATRT ===========
		$('#ok_btn').click(function() {
			saveUserInfo();
			//location.reload();
		});

		function saveUserInfo() {

			var checkbox = $("input[name=chk]:checked");

			var resultTxt = "";
			var errCode = "SUCC";
			checkbox.each(function(i) {

				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();

				var u_idx = td.eq(2).text();
				var is_stop = td.eq(7).text();
				if (is_stop == null || is_stop == "") {
					alert("u_idx" + u_idx + "의 값을 선택해 주세요");
					/* errCode = "FAIL";
					return false; */
				}

				if (resultTxt == "") {
					resultTxt = u_idx + "," + is_stop;
				} else {
					resultTxt += "|" + u_idx + "," + is_stop;
				}

			});

			// SETTER
			$("#dataList").val(resultTxt);
			
			$("#is_stopForm").submit();

		}
		// =========  확인 버튼 클릭 END ===========

		// 셀렉트박스에서 is_stop이 바뀔때마다 값을 세팅
		$(".opt_Stop").change(function() {
			$(this).parent().next().text($(this).val());
		});
//******************회원 정지 수정 기능 END****************************
		
//******************회원 검색 기능 START **************************
	//================ 검색 버튼 클릭 START===============
	$(".user_search_btn").click(function() {
		searchUser();
	});
	function searchUser() {
		  
		
		var searchType = $("#search_user option:selected").val();
		
			// alert("searchType : "+searchType);
		var searchValue = $(".user_search_ta").val();
			// alert("searchValue:"+searchValue);
		var searchWord = "";
		if(searchType == "" || searchType == null){
			alert("검색 값을 선택해 주세요.");
			return;
		}
		else if(searchValue == "" || searchValue == null){
			alert("검색 단어를 입력해주세요.");
			return;
		}else{
			searchWord = searchType +","+ searchValue;
			// alert("searchWord:"+searchWord);
			//	3,asd
			
			
			$("#searchType").val(searchType);
			$("#searchValue").val(searchValue);
			
			
			
			
			$("#searchFrom").submit();			
		}

	}
	//================ 검색 버튼 클릭 END===============

//****************** 회원 검색 기능 START   **************************

	})// jQUERY END
</script>








