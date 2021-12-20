<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>       
<%@page import="com.ott.review.vo.ReviewVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS 공통화 -->
<link rel="stylesheet" type="text/css" href="resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/footer.css">
<!-- main CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/main/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/main/review.css">

<title>Review</title>

</head>
<body>

<!-- Header -->
<jsp:include page="common/header.jsp"></jsp:include>
<c:if test="${vo ne null }">
<div class="common_container">
	<!-- 여기다 작업하세요 -->
<div id="up">
<div class="review_empty"></div>	
<div id="left">
	<div id="poster">
			<img src=${vo.poster }>
	</div>
	<div id="starring">
			<div>
				<a class="starring1">staff</a><br/>
				<a class="starring2">${vo.director }</a>
				<br/>
			</div>
			<div>
				<a class="starring1">cast</a><br/>
				<a class="starring2">${vo.cast }</a>
			</div>
	</div>
	</div>
<div id="right">
	<div id="content">
		<a class="title">${vo.title }</a><br/>
		<br/><br/>
		<div class="story_div">
		<a class="story">${vo.summary }</a>
		</div>
	</div>
	<div id="rate_div">
			<div id="rate">
			<a>평점</a><br/>
			<c:if test="${r_cnt > 0 }">
				<a class="point">${rating }</a>
			</c:if>
			
			<c:if test="${r_cnt <= 0 }">
				<a class="point">-</a>
			</c:if>
			</div>
			<div id="rotten">
			<a>Rotten Tomato</a>
			<br/>
			<c:if test = "${vo.rotten_tomato ne null }">
			<a class="point">${vo.rotten_tomato }</a>			
			</c:if>
			<c:if test = "${vo.rotten_tomato eq null }">
			<a class="point">-</a>			
			</c:if>
			
			</div>
	</div>
	<div id="go">
		<c:if test="${vo.platform == 'WAVVE'}"> 
		<a><div class="review_platfrom"><img src="resources/images/wavve.png"></div></a>
		</c:if>
		<c:if test="${vo.platform == 'NETFLIX'}"> 
		<a><div class="review_platfrom"><img src="resources/images/netflix.png"></div></a>		
		</c:if>
		<c:if test="${vo.platform == 'WATCHA'}"> 		
		<a><div class="review_platfrom"><img src="resources/images/watcha.png"></div></a>		
		</c:if>
		
	</div>
</div>
</div>
<c:if test="${uvo ne null }">
<form action="/review_add" method="post" name="frm">
	<div id="write_div">
		<a class="write_nickname">${uvo.u_name }</a>
		<textarea name="content" id="write_area" 
			cols="100" rows="5"></textarea>
		<div class="write_star">
		<div class="star-rating space-x-4 mx-auto">
		<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
		<label for="5-stars" class="star pr-4">★</label>
		<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
		<label for="4-stars" class="star">★</label>
		<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
		<label for="3-stars" class="star">★</label>
		<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
		<label for="2-stars" class="star">★</label>
		<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
		<label for="1-star" class="star">★</label>
		</div>
		</div>
		<br/>
		<br/>
		<input type="hidden" name="u_idx" value="${uvo.u_idx}">
		<input type="hidden" name="ott_idx" value="${vo.ott_idx }">
		<input type="hidden" name="u_name" value="${uvo.u_name }"> 
		<input type="hidden" name="u_id" value="${uvo.u_id }"> 
		<input type="hidden" name="now_page" value="${vo.ott_idx }">
			<p class="write_btn">
				<input type="button" class="review_add" value="리뷰등록" onclick="review_add()"/>
			</p>
	</div>
</form>
</c:if>

			<c:if test="${r_cnt > 0 }">
				<a class="review_num">리뷰 개수 : ${r_cnt }</a>			
			</c:if>
			
			<c:if test="${r_cnt <= 0 }">
				<a class="review_num">작성된 리뷰가 하나도 없네요!</a>			
			</c:if>
		<table class="review_table">	
			<!-- 반복문 -->
			<tbody>
				<c:forEach var="rvo" items="${rvo }">
				<form method="post" name="frm2">
			<div>
					<tr>
						<td class="list_nickname"> 
							<a class="list_nickname">${rvo.u_name }</a>
							<c:choose>
								<c:when test="${ rvo.u_level > 0 && rvo.u_level <= 5  }">
								<a class="list_level">Lv ${rvo.u_level} <i style="color: darkgray;" class="fas fa-medal"></i></a>
									<br />
								</c:when>
								
								<c:when test="${ rvo.u_level > 5 && rvo.u_level <= 10  }">
								<a class="list_level">Lv ${rvo.u_level} <i style="color: white;" class="fas fa-medal"></i></a>
									<br />
								</c:when>
								
								<c:when test="${ rvo.u_level > 10 && rvo.u_level <= 15  }">
								<a class="list_level">Lv ${rvo.u_level} <i style="color: yellow;" class="fas fa-medal"></i></a>
									<br />
								</c:when>
								
								<c:when test="${ rvo.u_level > 15 && rvo.u_level <= 20  }">
								<a class="list_level">Lv ${rvo.u_level} <i style="color: gold;" class="fas fa-medal"></i></a>
									<br />
								</c:when>
								
								<c:when test="${ rvo.u_level > 20 && rvo.u_level <= 25  }">
								<a class="list_level">Lv ${rvo.u_level} <i style="color: pink;" class="fas fa-medal"></i></a>
									<br />
								</c:when>
								
								<c:when test="${ rvo.u_level > 25 && rvo.u_level <= 30  }">
								<a class="list_level">Lv ${rvo.u_level} <i style="color: red;" class="fas fa-medal"></i></a>
									<br />
								</c:when>
							</c:choose>																				
							<a class="list_date">
							${f:substring(rvo.r_date,0,16)}
							</a>
						</td>
						<td class="list_content">
							<c:if test="${rvo.rating eq 1}">	
							<a class="star_color">★☆☆☆☆</a><br/><br/>
							</c:if>					
							<c:if test="${rvo.rating eq 2}">	
							<a class="star_color">★★☆☆☆</a><br/><br/>
							</c:if>					
							<c:if test="${rvo.rating eq 3}">	
							<a class="star_color">★★★☆☆</a><br/><br/>
							</c:if>					
							<c:if test="${rvo.rating eq 4}">	
							<a class="star_color">★★★★☆</a><br/><br/>
							</c:if>					
							<c:if test="${rvo.rating eq 5}">	
							<a class="star_color">★★★★★</a><br/><br/>
							</c:if>					
							<a class="review_content_text">${rvo.content }</a>
						</td>
						<td class="list_recommend">
						
							<span class="like_text_area">
							
							<c:choose>
								<c:when test="${uvo.u_idx  == rvo.u_idx}">
									<a><i class="far fa-thumbs-up"></i></a>
								</c:when>
								
								<c:when test="${uvo.u_idx  != rvo.u_idx}">
									<a href="/showReview?ott_idx=${vo.ott_idx }" onclick="thumbUp(${rvo.u_idx}, ${vo.ott_idx })"><i class="far fa-thumbs-up"></i></a>
								</c:when>
							
							</c:choose>	
									<span>${rvo.is_good }</span><br/><br/>
							</span>
							
							<span class="like_text_area">
							<c:choose>
								<c:when test="${uvo.u_idx  == rvo.u_idx}">
									<a><i class="far fa-thumbs-down"></i></a>
								</c:when>
								
								<c:when test="${uvo.u_idx  != rvo.u_idx}">
									<a href="/showReview?ott_idx=${vo.ott_idx }" onclick="thumbDown(${rvo.u_idx},${vo.ott_idx })"><i class="far fa-thumbs-down"></i></a>
								</c:when>
							
							</c:choose>	
									<span>${rvo.is_not }</span>
							</span>
						</td>
						<td class="review_edit_btn">
						<c:if test="${uvo.u_idx eq rvo.u_idx}">
							<p>
								<input type="button" class="review_edit" value="수정" onclick="review_edit(${rvo.rv_idx}, ${rvo.ott_idx })"/>
								<br/><br/>
								<input type="button" class="review_edit" value="삭제" onclick="review_del(${rvo.rv_idx}, ${rvo.ott_idx })"/>
							</p>
						</c:if>
						
						<c:choose>
							<c:when test="${empty uvo }">
								<input type="button" class="review_edit" value="신고하기" onclick="empty_session()"/>
							</c:when>
							<c:when test="${uvo.u_idx ne rvo.u_idx}">
								<input type="button" class="review_edit" value="신고하기" onclick="warning(${rvo.rv_idx}, ${rvo.ott_idx }, ${rvo.u_idx })"/>
							</c:when>
							
						</c:choose>
						
						<c:if test="${uvo.u_idx ne rvo.u_idx }">
						
						</c:if>
						</td>
					</tr>
						<input type="hidden" id="del_rv_idx" name="del_rv_idx" value="${rvo.rv_idx }">
						<input type="hidden" id="del_ott_idx" name="del_ott_idx" value="${rvo.ott_idx }">
				</div>
			</form>
			</c:forEach>
		</tbody>
			<tfoot>
			<td colspan="4" >
            	${pageCode }
            </td>
		</tfoot>
		</table>
	</div>	

<footer>
<!-- footer -->
<jsp:include page="common/footer.jsp"></jsp:include>
</footer>
</c:if>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script>
function thumbUp(idx, ott_idx){
	$.ajax({
		url:"/thumup",
		type:"post",
		data:{idx:idx, ott_idx:ott_idx}
	}).done({
		
	}).fail({
		
	});
}

function thumbDown(idx, ott_idx){
	
	$.ajax({
		url:"/thumdown",
		type:"post",
		data:{idx:idx, ott_idx:ott_idx}
	}).done({
		
	}).fail({
		
	});
}

function refresh(){
	location.reload();
}

function review_add(){	
	if(document.frm.content.value.trim().length < 1){
		alert("내용을 입력하세요");
		return;
	}		
	if(document.frm.rating.value < 1){
		alert("평점을 입력하세요");
		return;
	}
	document.frm.submit();	
}

function review_del(rv_idx, ott_idx){
	if(!confirm("삭제하시겠습니까?")){
		return;
	}
	$.ajax({
		url:"/review_del",
		type:"post",
		data:{rv_idx:rv_idx, ott_idx:ott_idx}
	}).done(function(){
		refresh();
	});
}
function review_edit(rv_idx, ott_idx){
	$.ajax({
		url:"/review_edit",
		type:"post",
		data:{rv_idx:rv_idx, ott_idx:ott_idx},
		success: function review_edit_popup(data){
			var w = window.open("/edit_review?rv_idx="+data.idx+"&ott_idx="+data.ott_idx,"edit","width=850,height=200");
		}
	});
}

function warning(rv_idx, ott_idx, u_idx){
	$.ajax({
		url:"/addwarning",
		type:"post",
		data:{rv_idx:rv_idx, ott_idx:ott_idx, u_idx:u_idx}
	}).done(function(data){
		alert("신고 완료되었습니다.");
		location.href="/showReview?ott_idx="+data.ott_idx;
	}).fail({
		
	});
}

function empty_session(){
	alert('로그인 후 이용하세요.');
}

</script>
</body>
</html>