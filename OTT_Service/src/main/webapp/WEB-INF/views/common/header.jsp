<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<div class="nav_menu">

   <nav class="clearfix">
      <ul class="nav_item nav_left">
         <li><span><a href="/">V<span class="small">enire&nbsp;</span>
            V<span class="small">ide&nbsp;</span>
            F<span class="small">rui&nbsp;</span></a></span></li>
         <li><span><a href="/bbs">전체</a></span></li>
      </ul>
      
      <div class="nav_middle">
         <form class="search_form" action="/search" method="POST">
            <input class="search_movie" type="text" id="s_movie" name="s_movie"
               placeholder="영화검색">
                
            <a> <i class="fas fa-search"></i>
            </a>
         </form>
      </div>

      <ul class="nav_item nav_right">
	         <c:if test="${empty uvo && empty ManVO}">
            <span><a href="/login">
               로그인 / 회원가입
            </a></span>
         </c:if>
         <c:if test="${!empty uvo }">
                  <!-- popup start -->
               <li class="user_menu_list_box">
               <span><a class="user_menu">${uvo.u_name} 님</a></span> 
               <div id="user_menu_list" class="user_menu_list">
                  <div class="user_profile_area">
                     <div class="user_profile_text">${fn:substring(uvo.u_name,1,3)}</div>
                  </div>
                  <div class="user_various">
                     <a class="user_items" onclick="goinfo()">마이페이지</a> <a
                        class="user_items" href="logout">로그아웃</a>
                  </div>
               </div> 
            </li>
            <!-- popup end -->
            <li><span><a href="/QNA.list">고객센터</a></span></li>
         </c:if>
         
             <c:if test="${!empty ManVO }">
			   	<li>
					<h3>${ManVO.manager_id }님</h3>
			    </li>
		        <li> 
		        	<a href="/manager_logout">로그아웃</a>
		        </li>
	         </c:if>
      </ul>
   </nav>

</div>
<form name="ff" method="post" action="/user_info" >
   <input type="hidden" name="u_idx" id="u_idx"/>
</form>
<!--  

-->
<script>
   $(function(){
       $(".user_menu").on('click',function(){
          
          if($("#user_menu_list").css('display') == 'none'){
             $("#user_menu_list").show();
             
          }else{
             $("#user_menu_list").hide();
          }
          
          
       })
    })

   function goinfo() {
      document.ff.u_idx.value=${uvo.u_idx};
      document.ff.submit();
   }
   
</script>