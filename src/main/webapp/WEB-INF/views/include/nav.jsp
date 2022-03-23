<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.woori.myhome.common.*" %>

   <!-- 폰트 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

   <style>
        *{
            font-family: 'Jua', sans-serif;
        }
    </style>

<% 
request.setAttribute("commonURL", request.getContextPath());

String userid= StringUtil.nullToValue(session.getAttribute("userid"), "");
String username= StringUtil.nullToValue(session.getAttribute("username"), "");
String email= StringUtil.nullToValue(session.getAttribute("email"), "");
String phone= StringUtil.nullToValue(session.getAttribute("phone"), "");
String level= StringUtil.nullToValue(session.getAttribute("level"),"");
System.out.println("level : " + level);
%>
<meta charset="UTF-8">

<!-- --------------------------- 상단 로그인 ------------------------------------- -->
   <div class="container mt-3">
        <ul class="nav justify-content-end">
        <%if(userid!=null && level.equals("2")){%>
        <li class="nav-item">
         <a class="nav-link" href="${commonURL}/admin/member/list">회원정보 관리</a>
        </li>
        <%}%>
        <%if(userid.equals("")) {%>
          <li class="nav-item">
            <a class="nav-link" href="/myhome/member/join">회원가입</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/myhome/member/login">로그인</a>
          </li>
          <%}else{%>
          <li class="nav-item">
            <a class="nav-link" href="/myhome/member/myinfo">개인정보</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/myhome/member/logout">로그아웃</a>
          </li>
          <%}%> 
        </ul>
      </div>


   <!-- --------------------------- 메인 로고 ------------------------------------- -->
     <nav class="navbar navbar-expand-lg navbar-light bg-white rounded" aria-label="Twelfth navbar example">
       <div class="container-fluid">
         <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample10">        
           <a class="navbar-brand" href="./main.html">
             <a class="nav-link active" aria-current="page" href="http://localhost:8080/myhome/">
                <img src="<%=request.getContextPath()%>/resources/images/MainPage_logo.png/" alt="Logo" 
                style="height: 140px; width: 290px; margin-left: auto; margin-right: auto; display: block;/">
             </a>
           </a>
         </div>
       </div>
     </nav>
     
     <div style="margin-bottom:60px;"></div>

<!-- --------------------------- NAV ------------------------------------- -->
    <nav class="navbar navbar-expand-md bg-success navbar-dark container rounded" id="menu">

       <!-- 메뉴판 로고-->
       <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
       </button>
       <div class="container">
         <a class="navbar-brand" href="./main.html">
           <a class="nav-link active" aria-current="page" href="http://localhost:8080/myhome/"><img src="<%=request.getContextPath()%>/resources/images/MainPage_logo.png/" alt="Logo" style="height: 60px; width: 100%;" >
            </a>
         </a>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   
   <!-- --------------------------- 목록 ------------------------------------- -->
          <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav me-auto mb-2 mb-md-0 " style="font-size:25px;">
      <!--         <div class="btn-group"> -->
      <!--           <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown">종류</button> -->
      <!--           <ul class="dropdown-menu"> -->
      <!--             <li><a class="dropdown-item" href="#">한식</a></li> -->
      <!--             <li><a class="dropdown-item" href="#">중식</a></li> -->
      <!--             <li><a class="dropdown-item" href="#">양식</a></li> -->
      <!--             <li><a class="dropdown-item" href="#">일식</a></li> -->
      <!--           </ul> -->
      <!--         </div> -->
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <li class="nav-item">
                <a class="nav-link" href="${commonURL}/receipe/list">레시피</a>
              </li>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <!--         <li class="nav-item"> -->
      <!--           <a class="nav-link" href="#">나의냉장고</a> -->
      <!--         </li> -->
      <!--         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
              <li class="nav-item">
                <a class="nav-link" href="${commonURL}/gallery/list">자랑게시판</a>
              </li>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <li class="nav-item">
                <a class="nav-link" href="${commonURL}/qnaboard/list">QnA</a>
              </li>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <li class="nav-item">
                <a class="nav-link" href="${commonURL}/noticeboard/list">공지사항</a>
              </li>
            </ul>
      <!--       <div class="col-xs-4" style="float:right;"> -->
      <!--       <form class="d-flex"> -->
      <!--         <input class="form-control me-2 " type="search" placeholder="Search" aria-label="Search"> -->
      <!--         <button class="btn btn-outline-light" type="submit">Search</button> -->
      <!--       </form> -->
      <!--       </div> -->
          </div>
        </div>
   </nav>