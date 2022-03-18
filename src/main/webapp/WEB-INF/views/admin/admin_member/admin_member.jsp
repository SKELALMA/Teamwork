<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.woori.myhome.admin.member.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<%@include file="../include/nav.jsp"%>

<form name="myform">
<div id="content" class="">
		<table class="table table-hover ">
        	<colgroup>
        		<col width="5%">
        		<col width="15%">
        		<col width="10%">
        		<col width="20%">
        		<col width="20%">
        		<col width="10%">
        		<col width="10%">
        		<col width="10%">
        	</colgroup>
            <thead class="table-secondary">
              <tr>
                <th>번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th>이메일</th>
                <th>가입일</th>
                <th>유저/관리자</th>
                <th>활동여부</th>
                <th>사용정지</th>
              </tr>
            </thead>
            <tbody>
            <%

            List<AdminMemberDto> list = (List<AdminMemberDto>)request.getAttribute("memberlist");
           	for(AdminMemberDto tempDto : list){

			String user_active= tempDto.getUser_active();
			
            %>
              <tr>
              	
				<td><%=tempDto.getUser_seq()%> </td>
	            <td><%=tempDto.getUser_id()%> </td>
	            <td><%=tempDto.getUser_name()%></td>
	            <td><%=tempDto.getUser_mail()%></td>
	 			<td><%=tempDto.getUser_wdate()%></td>
	 			<%if(tempDto.getUser_level().equals("1")){%>
                	<td>   유저</td>
                <%} else if(tempDto.getUser_level().equals("2")){%>
                	<td>   관리자</td>
                <%} else {%>
                	<td>  불법사용자</td>
                <%}%>

   		 <%-- 		<%if(tempDto.getUser_active().equals("A")){%>
                	<td id="userActive<%=tempDto.getUser_seq()%>">   정상</td>
                <%} else if(tempDto.getUser_active().equals("B")){%>
                	<td id="userActive<%=tempDto.getUser_seq()%>">   정지</td>
                <%}%>    --%>
                
 	            <td id="userActive<%=tempDto.getUser_seq()%>"><%=tempDto.getUser_active()%></td>  
	           	<%if(user_active.equals("Y")) {%>
	            <td><button id="btn<%=tempDto.getUser_seq()%>" type="button" onClick="goActive('<%=tempDto.getUser_seq()%>')" >사용중지</button></td>   
	           	<%}else if(user_active.equals("N")) {%>
	            <td><button id="btn<%=tempDto.getUser_seq()%>" type="button" onClick="goActive('<%=tempDto.getUser_seq()%>')" >사용</button></td>   
	     		<%} %>
              </tr>
           <%} %>
            </tbody>
          </table>
       <input type="hidden" name="user_active" id="user_active" value=""/>
       <input type="hidden" name="user_seq" id="user_seq" value=""/>
       
    </form>





</body>
</html>




 

<script>

function goActive(seq){
	
	document.myform.user_active.value = document.getElementById("userActive"+seq).innerHTML;
	document.myform.user_seq.value = seq;

	var queryString = $("form[name=myform]").serialize();
	console.log(queryString); // user_active=B&user_seq=1
	
	$.ajax({
		url:"<%=request.getContextPath()%>/admin/member/update",
		data:queryString,
		type:"POST",
		dataType:"JSON"
	})
	.done( (map)=>{
	
		console.log(map.result);
		
		<%-- location.href="<%=request.getContextPath()%>/admin/member/list"; --%>
		
		if(map.result == 'N'){
			// 활동여부 컬럼 변경 'B'
			// 사용정지 -> 사용
			console.log("btn"+seq);
			//document.getElementById("userActive"+seq).innerHTML = 'B' ;
			document.getElementById("btn"+seq).innerHTML = '사용';
			
			$("#userActive"+seq).html('N');
		} else if(map.result=='Y'){
			// 활동여부 컬럼 변경 'A'
			// 사용 -> 사용정지	
			document.getElementById("userActive"+seq).innerHTML = 'Y' ;
			document.getElementById("btn"+seq).innerHTML = '사용중지';
		} else {
			alert("DB에 저장된 데이터가 올바르지 않습니다!");
		}
		
		
	})
	.fail( (error)=>{
		console.log( error );
	})
	
}
</script>