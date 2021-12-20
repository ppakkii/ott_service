<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>review_edit</title>

</head>
<body>
<div>
<form method="post" name="frm" action="/review_edit_submit">
<div class="edit_back">
	<textarea name="content" id="write_area" 
	cols="100" rows="5">${rvo.content }</textarea>
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
	<br/>
	<input type="hidden" name="rv_idx" value="${rvo.rv_idx }"/>
	<input type="hidden" name="ott_idx" value="${rvo.ott_idx }"/>
	<input type="button" class="review_edit2" value="적용" onclick="review_edit()"/>
</div>
</form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
function review_edit(){	
	var ott_idx = ${rvo.ott_idx};
	
	document.frm.submit();	
	
	$.ajax({
		url:"/review_edit_refresh",
		type:"post"
	}).done(function(){
		opener.location.href = "/showReview?ott_idx="+ott_idx;
		window.close();
	});
	
}
</script>
</body>
</html>