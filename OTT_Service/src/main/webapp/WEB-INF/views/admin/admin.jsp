<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 메인 이미지 슬라이더 JS -->
<script type="text/javascript" defer="defer" src="resources/js/main_js/slider.js"></script>
<!-- 특정한 리스트에 이미지를 보여주고 화살표 클릭시 다음 이미지 불러오는 JS  -->
<script type="text/javascript" defer="defer" src="resources/js/main_js/movie_order.js"></script>
<!-- CSS 공통화 -->
<link rel="stylesheet" type="text/css" href="resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/footer.css">
<!-- main CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/main/main.css">
<!-- 이미지 슬라이더 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/main/slider.css">
<!-- font awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"rel="stylesheet">
<!-- 관리자 페이지 css -->
<link rel="stylesheet" type="text/css" href="resources/css/admin/admin.css">


<title>Main</title>

<style>

</style>
</head>
<body>
	<!-- Header -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<!-- common -->
	<div class="common_container">
		
		<div class="admin_board">
				<h1>관리자 게시판</h1>
				
				<div>
					<div>
						<h2>게시판 검색</h2>
						<!--  <span class="top_board">게시판 검색</span>-->
						<div>
							<select name="select_group">
													<option value="그룹선택" selected="selected">::그룹선택::</option>
								<option value="리뷰게시판">리뷰게시판</option>
								<option value="QNA게시판">QNA게시판</option>
								<option value="회원정보관리">회원정보관리</option>
								<option value="댓글관리">댓글관리</option>
								
								
								
							</select>
							<input class="admin_search_ta" type="text" name="admin_search_ta" />
							<input class="admin_search_btn" type="button" name="admin_search_btn" value="검색"/>
						</div>
					</div>
					<div>
						
					</div>
						<table>
							<caption>
							<span class="total_board">총 게시판수 : 4개</span> 
							</caption>
						
							<clogroup>
								<col style="width: 150px;"/>
								<col style="width: 100px;"/>
								<col style="width: 100px;"/>
								<col style="width: 100px;"/>
								<col style="width: 100px;"/>
								<col style="width: 100px;"/>
								<col style="width: *"/>
							</clogroup>
							<thead class="admin_thead">
								<tr>
									<td>게시판명</td>
									<td>목록보기</td>
									<td>내용보기</td>
									<td>글쓰기</td>
									<td>답글쓰기</td>
									<td>코멘트쓰기</td>
									<td>기능</td>
								</tr>
							</thead>
							<tbody>
									<td>리뷰게시판</td>
									<td>전체</td>
									<td>전체</td>
									<td>전체</td>
									<td>전체</td>
									<td>전체</td>
									<td>
										<button class="edit_btn" type="button">
										    수정
										</button>
										<button class="del_btn" type="button">
										    삭제
										</button>
									</td>
								</tr>

								<tr>
									<td>회원정보관리</td>
									<td>전체</td>
									<td>전체</td>
									<td>전체</td>
									<td>전체</td>
									<td>전체</td>
									<td>
										<button class="edit_btn" type="button" onclick="javascript:location.href='/admin_userinfo'">
										    수정
										</button>
										<button class="del_btn" type="button">
										    삭제
										</button>
									</td>
								</tr>
								<tr>
									<td>댓글 관리</td>
									<td>전체</td>
									<td>전체</td>
									<td>전체</td>
									<td>전체</td>
									<td>전체</td>
									<td>
										<button class="edit_btn" type="button" >
										    수정
										</button>
										<button class="del_btn" type="button">
										    삭제
										</button>
									</td>
								</tr>
								<tr>
									<td>QNA 게시판</td>
									<td>전체</td>
									<td>전체</td>
									<td>전체</td>
									<td>전체</td>
									<td>전체</td>
									<td>
										<button class="edit_btn" type="button" onclick="javascript:location.href='/QNA.list'">
										    수정
										</button>
										<button class="del_btn" type="button">
										    삭제
										</button>
									</td>
								</tr>


								
							</tbody>
						</table>
					</div>
		</div>






	</div>
	<!-- end of main -->
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>