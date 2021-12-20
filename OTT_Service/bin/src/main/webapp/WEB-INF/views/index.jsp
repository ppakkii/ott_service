<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 메인 이미지 슬라이더 JS -->
<script type="text/javascript" defer="defer" src="resources/js/main_js/slider.js"></script>
<!-- 특정한 리스트에 이미지를 보여주고 화살표 클릭시 다음 이미지 불러오는 JS  -->
<script type="text/javascript" defer="defer" src="resources/js/main_js/netflix_order.js"></script>
<script type="text/javascript" defer="defer" src="resources/js/main_js/watcha_order.js"></script>
<script type="text/javascript" defer="defer" src="resources/js/main_js/wavve_order.js"></script>
<!-- CSS 공통화 -->
<link rel="stylesheet" type="text/css" href="resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/footer.css">
<!-- main CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/main/main.css">
<!-- 이미지 슬라이더 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/main/slider.css">
<!-- font awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"rel="stylesheet">

<title>Main</title>
</head>
<body>
	<!-- Header -->
	<jsp:include page="common/header.jsp"></jsp:include>

	<!-- Slider -->
	<jsp:include page="common/slider.jsp"></jsp:include>

	<!-- common -->
	<div class="common_container">
		<div class="comment_area">
			<h1>Netflix Top10</h1>
		</div>
		
		<div class="item_box">
			<div class="movie_box_button btn_arrow">
				<a class="netflix_btn_left" onclick="netflix_list('pre','netflix_box',5,5)"><i class="fas fa-chevron-left"></i></a>
			</div> 
			<c:forEach var="vo" items="${netflix}">
			<div class="netflix_box">
				<div class="ott_subject">
					<h4>${vo.title} </h4>
					<div class="m_content">
						<a href="#"><img src="${vo.poster }"></a> 
						<h2>Rank ${vo.rank}</h2>
					</div>
				</div>
			</div>
			</c:forEach>
			<div class="movie_box_button btn_arrow">
				<a class="netflix_btn_right" onclick="netflix_list('next','netflix_box',5,5)"><i class="fas fa-chevron-right"></i></a>
				<!-- <a class="netflix_btn_right"><i class="fas fa-chevron-right"></i></a> -->
			</div>
		</div>
		<!-- 넷플릭스 끝 -->
		

		<!-- 왓차  -->
		<div class="comment_area">
			<h1>Watcha Top10</h1>
		</div>
		
		<div class="item_box">
			<div class="movie_box_button btn_arrow">
				<a class="Watcha_btn_left" onclick="watcha_list('pre','watcha_box',5,5)"><i class="fas fa-chevron-left"></i></a>
			</div>

			<c:forEach var="vo" items="${watcha}">
			<div class="watcha_box">
				<div class="ott_subject">
					<h4>${vo.title} </h4>
					<div class="m_content">
						<a href="#"><img src="${vo.poster }"></a> 
						<h2>Rank ${vo.rank}</h2>
					</div>
				</div>
			</div>
			</c:forEach>
			<div class="movie_box_button btn_arrow">
				<a class="Watcha_btn_right" onclick="watcha_list('next','watcha_box',5,5)"><i class="fas fa-chevron-right"></i></a>
			</div>
		</div>
		<!-- 왓챠  끝 -->



		<!-- Wavve  -->
		<div class="comment_area">
			<h1>Wavve Top10</h1>
		</div>
		
		<div class="item_box">
			<div class="movie_box_button btn_arrow">
				<a class="Wavve_btn_left" onclick="wavve_list('pre','wavve_box',5,5)"><i class="fas fa-chevron-left"></i></a>
			</div>
			
			<c:forEach var="vo" items="${wavve}">
			<div class="wavve_box">
				<div class="ott_subject">
					<h4>${vo.title} </h4>
					<div class="m_content">
						<a href="#"><img src="${vo.poster }"></a> 
						<h2>Rank ${vo.rank}</h2>
					</div>
				</div>
			</div>
			</c:forEach>
			<div class="movie_box_button btn_arrow">
				<a class="Wavve_btn_right" onclick="wavve_list('next','wavve_box',5,5)" ><i class="fas fa-chevron-right"></i></a>
			</div>
		</div>
		<!-- Wavve 끝 -->

	</div>
	<!-- end of main -->
	
	<!-- footer -->
	<jsp:include page="common/footer.jsp"></jsp:include>

</body>
</html>