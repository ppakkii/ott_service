<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="nav_menu">

	<nav class="clearfix">
		<ul class="nav_item nav_left">
			<li><span><a href="/">Logo</a></span></li>
			<li><span><a href="/bbs">전체</a></span></li>
		</ul>
		
		<div class="nav_middle">
			<form class="search_form" action="/search" method="POST">
				<input class="search_movie" type="text" id="s_movie" name="s_movie"
					placeholder="영화검색(테스트용)">
					 
				<a> <i class="fas fa-search"></i>
				</a>
			</form>
		</div>

		<ul class="nav_item nav_right">
			<c:if test="${empty uvo }">
				<span><a href="/login">
					로그인 / 회원가입
				</a></span>
			</c:if>
			<c:if test="${!empty uvo }">
				<span><a href="/logout">
					로그아웃
				</a></span>
			</c:if>
		</ul>
	</nav>

</div>

<!--  

-->