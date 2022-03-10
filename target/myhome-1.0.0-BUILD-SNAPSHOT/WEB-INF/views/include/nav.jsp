<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.woori.myhome.common.*" %>

<%
request.setAttribute("commonURL", request.getContextPath());

String userid= StringUtil.nullToValue(session.getAttribute("userid"), "");
String username= StringUtil.nullToValue(session.getAttribute("username"), "");
String email= StringUtil.nullToValue(session.getAttribute("email"), "");
String phone= StringUtil.nullToValue(session.getAttribute("phone"), "");

%>
<meta charset="UTF-8">
  <nav class="navbar navbar-expand-sm bg-light navbar-light fixed-top">
       <div class="container-fluid">
         <ul class="navbar-nav">
           <li class="nav-item">
             <a class="nav-link active" href="${commonURL}/board/list">게시판</a>
           </li>
          <li class="nav-item">
             <a class="nav-link" href="${commonURL}/gallery/list">갤러리</a>
           </li>
         
           <%if(userid.equals("")) {%>
           <li class="nav-item">
             <a class="nav-link" href="${commonURL}/member/join">회원가입</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" href="${commonURL}/member/login">로그인</a>
           </li>
           <%}else{%>
           <li class="nav-item">
             <a class="nav-link" href="${commonURL}/member/myinfo">내정보</a>
           </li>
            <li class="nav-item">
             <a class="nav-link" href="${commonURL}/member/logout">로그아웃</a>
           </li>
           <%} %>
         </ul>
         
         <div class="d-flex">
        	<a class="nav-link" href="${commonURL}/"><button class="btn btn-primary" type="button">Home</button></a>
      	</div>
       </div>
   </nav>