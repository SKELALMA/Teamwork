<%@ page language="java" contentType="text/html; charset=UTF-8" 
   pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관리자 페이지</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

<% String status = (String)request.getParameter("status"); 
   System.out.println(status);
%>

<!-- 관리자페이지 로고 -->
<nav class="navbar navbar-expand-lg navbar-light bg-white rounded" aria-label="Twelfth navbar example">
    <div class="container-fluid">
      <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample10">        
        <a class="navbar-brand" href="./main.html">
          <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/admin">
          	<img src="<%=request.getContextPath()%>/resources/images/MainPage_logo.png/" alt="Logo" style="height: 140px; width: 290px; margin-left: auto; margin-right: auto; display: block;"/>
          </a>
        </a>
      </div>
    </div>
  </nav>

<%-- <%@include file="./include/nav.jsp" %> --%>
<form name="myform" id="myform">
   <input type="hidden" name="idcheck" id="idcheck" value="N"/>
   
<div class="container" style="margin-top:80px; width:60%">
  <h1>로그인</h1>

  <div class="input-group mb-3">
    <input type="text" class="form-control" placeholder="아이디" name="user_id" id="user_id">
  </div>

  <div class="input-group mb-3">
    <input type="password" class="form-control" name="user_password" id="user_password" placeholder="패스워드">
  </div>

  
     <div class="container" style="text-align:right">
    
     <div class="btn-group">
       
       <button type="button" class="btn btn-primary" onclick="goWrite()">로그인</button>&nbsp;&nbsp;
<!--        <button type="button" class="btn btn-primary" onclick="goFindid()">아이디찾기</button>&nbsp;&nbsp; -->
<!--        <button type="button" class="btn btn-primary" onclick="goFindpassword()">패스워드찾기</button>&nbsp;&nbsp; -->
       <button type="button" class="btn btn-primary" onclick="goCancel()">취소</button>&nbsp;&nbsp;
     </div>
   </div>

</div>

</form>   

</body>
</html>

<script>
window.onload = function(){
	var status = '<%=status%>';
	
	if(status == "login")
		alert("로그인을 해주세요.");
	
	if(status == "forbid"){
		alert("권한이 없습니다.");
	}
	
}

function goWrite()
{
   var frmData = new FormData(document.myform);
   console.log( frmData );
      
   $.ajax({
      url:"<%=request.getContextPath()%>/admin/login_proc",
      data:frmData,
      contentType:false,
      processData:false,
      type:"POST",
   })
   .done( (result)=>{
      	if(result.flag=="1")
		{
      		alert("로그온 성공");
      		location.href="<%=request.getContextPath()%>/admin/main";
		}
      	else if(result.flag=="2")
      	{
      		alert("아이디를 찾을 수 없습니다.");
      	}
      	else if(result.flag=="7")
      	{
      		alert("로그인 권한이 없습니다.");
      		location.href="<%=request.getContextPath()%>/";
      	}
      	else  //패스워드 실패시 3을 보낸다  
      	{
      		alert("패스워드가 일치하지 않습니다.");	
      	}
   })
   .fail( (error)=>{
      console.log(error);
   })
}


// function goFindid()
// {
<%-- 	location.href="<%=request.getContextPath()%>/member/findid"; //페이지 이동  --%>
// }

// function  goFindpassword()
// {
<%-- 	location.href="<%=request.getContextPath()%>/member/findpassword"; //페이지 이동  --%>
// }

function goCancel()
{
	location.href="<%=request.getContextPath()%>/";
}
</script>





