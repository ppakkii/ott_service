<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${now }" pattern="yyyyMMdd" var="today" />
<c:set var="nextmonth"
	value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 28L)%>" />
<fmt:formatDate value="${nextmonth }" pattern="yyyyMMdd" var="nextmonth" />
<!-- 전체를 감싸줄 영역 - container -->
<div class="container">
	<!-- 아이템 영역 -->
	<div class="slider_items">
		<!-- Test 영역  -->

		<!-- 아이템 -->
		<div class="slide_item" style="overflow: hidden;">
			<c:forEach var="vo" items="${mvo }" varStatus="num">
				<c:if test="${vo.openDt >= today && vo.openDt < nextmonth }">
					<div class="movie_items">
						
						<div class="img_box">
							<img src="${vo.img_url}" width="40px" height="60px">
						</div>
						<div class="sub_text">
							<div class="sub_text_left">${vo.repGenreNm}</div>
	
							<fmt:parseDate value="${vo.openDt }" var="opendate"
								pattern="yyyyMMdd" />
							<fmt:formatDate value="${opendate }" pattern="yyyyMMdd" var="open" />
							<c:if test="${(open - today) > 0 }">
								<div class="sub_text_right">D-${open - today }</div>
							</c:if>
							<c:if test="${(open - today) <= 0 }">
								<div class="sub_text_right">개봉</div>
							</c:if>
						</div>
						<div> <a href="/search?s_movie=${vo.movieNm}&geb=${vo.repGenreNm}" id="mname">
									${vo.movieNm}
								</a>
						</div>
					</div>
				</c:if>
				
			</c:forEach>
		</div>
		
		<div class="slide_item">
			<div class="ott_rposter" id="rposter_l">
				<span class="today_ott">Netflix 추천작</span>
				<img class="rposter_img" src="${rvo.poster }">
			</div>
			<div class="ott_rposter" id="rposter_c">
				<span class="today_ott">Watcha 추천작</span>
				<img class="rposter_img" src="${wvo.poster }">
			</div>
			<div class="ott_rposter" id="rposter_r">
				<span class="today_ott">Wavve 추천작</span>
				<img class="rposter_img" src="${vvo.poster }">
			</div>
		</div>
		<!--  
		<div class="slide_item"></div>
		<div class="slide_item"></div>
		<div class="slide_item"></div>
		<div class="slide_item"></div>
		-->
	</div>
	<!-- end of slider_items -->

	<!-- 다음 버튼 -->
	<!-- <button type="button" class="nextButton">▶</button>-->
	<!-- 이전 버튼 -->
	<!-- <button type="button" class="prevButton">◀</button>-->



</div>
<!-- end of container -->