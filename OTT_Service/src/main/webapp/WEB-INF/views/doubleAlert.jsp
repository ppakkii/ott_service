<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	var page = ${page};
	alert("이미 리뷰를 등록한 작품입니다.");
	location.href = "/showReview?ott_idx="+page;
</script>
</body>
</html>