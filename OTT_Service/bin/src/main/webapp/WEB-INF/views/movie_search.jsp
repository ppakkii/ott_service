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
	<table>
		<thead>
			<tr>
				<th>제목</th>
				<th>배우</th>
				<th>링크</th>
				<th>이미지</th>
				<th>감독</th>
				<th>평점</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.title}</td>
				<td>${vo.actor }</td>
				<td> <a href="${vo.link}">${vo.link}</a></td>
				<td><img src="${vo.image}"></td>
				<td>${vo.director}</td>
				<td>${vo.userRating}</td>
			</tr>
		</c:forEach>
		</tbody>
		
	</table>
	
	
		
	
	

</body>
</html>