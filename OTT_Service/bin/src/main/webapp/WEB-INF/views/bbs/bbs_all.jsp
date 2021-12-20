<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS 공통화 -->
<link rel="stylesheet" type="text/css" href="resources/css/common/footer.css">
<!-- main CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/main/bbs_all.css">
<link rel="stylesheet" type="text/css" href="resources/css/main/main.css">


<title>Insert title here</title>
</head>
<body>

<!-- Header -->
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="common_container">
	<div>
		<ul id="ott_ul">
			<c:forEach var="vo" items="${ar }">
					<li class="ott_li">
						<a href="#">
						<div class="boxs">
								<div class="image_box">
									<img class="poster" src="${vo.poster }">
								</div>
								<div class="story_box">
									<div class="subject">
										${vo.title }
									</div>
									<div class="story_line">
										"${vo.summary }"
									</div>
								</div>
							</div>
						</a>
					</li>
			</c:forEach>
	</div>
	<p style="clear:both;"></p>
	</ul>
</div>

<div class="page_box">
	${pageCode }
</div>
<!-- footer -->
<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>