<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<style>
	table {
      width: 100%;
      border: 1px solid black;
      border-collapse: collapse;
   	}
   	
   	header, td {
   		text-align: center;
   	}
   	
   	#all {
   		display: none;
   	}
</style>
</head>
<body>
	<header>
		<h1>충전소 목록</h1>
	</header>
	<article>
		<table border="1">
			<colgroup>
				<col width="15%" />
				<col width="30%" />
				<col width="10%" />
				<col width="20%" />
				<col width="10%" />
				<col width="5%" />
			</colgroup>
			<thead>
				<th>영화 제목</th>
				<th>개봉 여부</th>
				<th>개봉 날짜</th>
				<th>장르</th>
				<th>대표 장르</th>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${mvo }">
					<tr>
						<td>${vo.movieNm }</td>
						<td>${vo.prdtStatNm }</td>
						<fmt:parseDate value="${vo.openDt }" var ="opendate" pattern="yyyyMMdd" />
						<td><fmt:formatDate value="${opendate }" pattern="yyyy/MM/dd" /></td>
						<td>${vo.genreAlt }</td>
						<td>${vo.repGenreNm }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</article>
	
	<div id="all">
		<label>충전소 명</label>
		<input id = "nm" type="text" readonly="readonly">
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	 
  	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	
	<script>
		function viewData(data){
			alert("DDDD");
			console.log(data);
			$("#nm").val(data);
			$("#all").dialog();
		}
	</script>
	
</body>
</html>