<%@ page language="java" contentType="text/html; charset=UTF-8" 
   pageEncoding="UTF-8"%>
<%@page import="com.woori.myhome.member.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<style>

.input-form{
max-width:680px;
margin-top:80px;
padding:32px;

background:#fff;
-webkit-border-radius:10px;
-moz-border-radius:10px;
border-radius:10px;
-webkit-box-showdow:0 8px 20px 0 rgba(0,0,0,0.15);
-moz-box-shodow:0 8px 20px 0 rgba(0,0,0,0.15);
box-shadow:0 8px 20px 0 rgba(0,0,0,0.15);

}

.form-control::placeholder {color: #C0C0C0; opacity: 1;}
.form-control:-ms-input-placeholder {color: #C0C0C0;}
.form-control::-ms-input-placeholder {color: #C0C0C0;}

</style>

<body>

<%@include file="../include/nav.jsp" %>

<%
MemberDto dto = (MemberDto)request.getAttribute("memberDto");
%>
<form name="myform" id="myform">
	
   
<div class="container" style="margin-top:80px">
	<div class="input-form col-md-12 mx-auto">
  	<h1>회원가입</h1>


		<% if(dto.getUser_id().equals("")) {%>
		<label for="userid">아이디</label>
 	 <div class="input-group mb-3">
    	 <input type="hidden" name="idcheck" id="idcheck" value="N"/>
    	 <input type="text" class="form-control" placeholder="아이디" name="user_id" id="user_id">
    	<div class="input-group-append">
   	   <button class="btn btn-success" type="button" id="btnDuplicate">중복체크</button>  
     	</div>
	 </div>
		 <%} else{%>

	  <div class="input-group mb-3">
	     <input type="hidden" name="idcheck" id="idcheck" value="Y"/>
	     <input type="text" class="form-control" placeholder="아이디" name="user_id" id="userid"
	         value="<%=dto.getUser_id()%>"  readonly>
   
	  </div>
		  <%} %>
  
      <label for="password">비밀번호</label>
  <div class="input-group mb-3">
    <input type="password" class="form-control" name="user_password" id="user_password" placeholder="패스워드" onchange="pwd_check()">&nbsp;&nbsp;
    <input type="password" class="form-control" name="user_password2" id="user_password2" placeholder="패스워드확인" onchange="pwd_check()">&nbsp;&nbsp;
  </div>
  <label id="check"></label>


  <div class="mb-3">
    <label for="name">이름</label>
    <input type="text" class="form-control" placeholder="홍길동" name="user_name" id="user_name" 
    value="<%=dto.getUser_name()%>">
  </div>

  <div class="mb-3">
    <label for="phone">전화번호</label>
    <input type="text" class="form-control" placeholder="010-0000-0000" name="user_phone" id="user_phone"
    value="<%=dto.getUser_phone()%>">
  </div>
  
  <div class="mb-3">
    <label for="email">이메일</label>
    <input type="text" class="form-control" placeholder="multicampus@naver.com" name="user_mail" id="user_mail"
    value="<%=dto.getUser_mail()%>">
  </div>
  

  <div class="mb-3">
    <label for="address1">도로주소</label>&nbsp;&nbsp;<button type="button" class="btn btn-success btn-sm" onclick="findAddr()">&nbsp;검색&nbsp;</button>
    <input type="text" class="form-control" placeholder="서울특별시 강남구 언주로 508" name="user_address1" id="user_address1"
    value="<%=dto.getUser_address1()%>" >
  </div>

  <div class="mb-3">  
    <label for="address2">상세주소<span style="color:#C0C0C0" > &nbsp;(필수 아닙니다.)</span></label>
    <input type="text" class="form-control" placeholder="서울상록회관" name="user_address2" id="user_address2"
    value="<%=dto.getUser_address2()%>">
  </div>    
  


  <!-- 다음 우편 api :주소체계 번지 -> 길  -->
  
     <div class="container" style="text-align:center">
    
   	  <div class="btn-group">
       
     	  <button type="button" class="btn btn-success" onclick="goWrite()">&nbsp;&nbsp;등 록&nbsp;&nbsp;</button>&nbsp;&nbsp;
      
     	  <button type="button" class="btn btn-danger" onclick="goCancel()">&nbsp;&nbsp;취 소&nbsp;&nbsp;</button>&nbsp;&nbsp;
  	   </div>
  	 </div>

	</div>
</div>

</form>   

</body>
</html>
<script>

//아이디 유효성 검사
$(()=>{
      $("#btnDuplicate").click(()=>{
         $.ajax({
            url:"${commonURL}/member/isDuplicate", //요청 url정보
            data:{user_id:$("#user_id").val()},   //서버로 전달할 데이터정보: JSON형태
            dataType:"json",  //결과를 jSON으로 받겠다. 결과가 text로 온다
            type:"POST"
         })
         .done((data)=>{
            //데이터가 정상적으로 수신되면 done메서드 호출되면서 매개변수는 전달받은 값
            //값은 dataType 속성을 안주면 text로 온다.
            console.log(data.result);
           if(data.result == "true") //중복
           {
              alert("이미 사용중인 아이디입니다.")
           }
          
           else
           {
              alert("사용가능합니다.")
              $("#idcheck").val("Y");
              $("#user_id").prop("readonly", true);   //수정못하게 막는 기능
              
           }
         })
         .fail((error)=>{
            //통신에러, 오류에 관한 것
               console.log(error)
         })
      })
   })

function goWrite()
{
   //var frmData = new FormData(document.myform);
   
   var queryString = $("form[name=myform]").serialize(); 
	 //파일전송없을때 안정적으로 감
   console.log(queryString);
	 
	 
   var User_id='<%=dto.getUser_id()%>';
   if (User_id =='')
   {
	   url="${commonURL}/member/insert";	 
	   msg="회원가입이 되었습니다.";
   }
   else
   {
	   url="${commonURL}/member/update";
	   msg="회원 정보가 수정되었습니다."
   }   
   $.ajax({
      url:url,
      data:queryString,
      type:"POST",
      dataType:"json"
   })
   .done( (result)=>{
      console.log(result);
      alert(msg);
      location.href="${commonURL}/"; //시작화면으로 이동하기
   })
   .fail( (error)=>{
      console.log(error);
   })
}

function goModify()
{
   var frm = document.form;
   frm.action="/board/modify_save";
   frm.submit();
}

function goCancel()
{
  var frm = document.form;
   frm.action="/board/list";
   frm.submit();
}

//주소찾기
function findAddr(){
	new daum.Postcode({
		oncomplete:function(data){
			$('[name=user_address1]').val(data.address);
			$('[name=user_address2]').val(data.buildingName);
		}
	
	}).open();
}

//비밀번호 일치여부
function pwd_check(){
	var pwd=document.getElementById('user_password').value;
	if(document.getElementById('user_password').value!="&&document.getElementById('user_password2').value!="){
		if(document.getElementById('user_password').value==document.getElementById('user_password2').value){
			document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
			document.getElementById('check').style.color='blue';
		}
		else{
			document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
			document.getElementById('check').style.color='red';
		}
	}
}



</script>