<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.woori.myhome.common.*" %>
<%@page import="com.woori.myhome.admin.member.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
	<%
// 	String key = StringUtil.nullToValue(request.getParameter("key"), "1");
// 	String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
// 	String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
// 	int totalCnt = (Integer)request.getAttribute("totalCnt");
	%>

	<%@include file="../include/nav.jsp"%>
	
	<button type="button">버튼 눌르기</button>

	<form name="myform" method="get">
<%-- 		<input type="hidden" name="key" id="key" value="<%=key%>" /> --%>
<%-- 		<input type="hidden" name="pg" id="pg" value="<%=pg%>" /> --%>
<!-- 		<input type="hidden" name="qna_id" id="qna_id" value="" /> -->

		<div class="container" style="margin-top: 30px">

			<div class="row">

	    		<div class="col-md-2"></div>
				<div class="col-md-10">

					<div>

						<table class="table table-hover ">
							<colgroup>
								<col width="5%">
								<col width="15%">
								<col width="10%">
								<col width="20%">
								<col width="20%">
								<col width="12%">
								<col width="8%">
								<col width="10%">
							</colgroup>
							<thead class="table-secondary">
								<tr>
									<th>번호</th>
									<th>아이디</th>
									<th>이름</th>
									<th>이메일</th>
									<th>가입일</th>
									<th>사용자/관리자</th>
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
					
									<td><%=tempDto.getUser_seq()%></td>
									<td><%=tempDto.getUser_id()%></td>
									<td><%=tempDto.getUser_name()%></td>
									<td><%=tempDto.getUser_mail()%></td>
									<td><%=tempDto.getUser_wdate()%></td>
									<td>
										<%if(tempDto.getUser_level().equals("1")){%>
											사용자
										<%} else if(tempDto.getUser_level().equals("2")){%>
											관리자
										<%} else {%>
											불법사용자
										<%}%>
									</td>
									<td id="userActive<%=tempDto.getUser_seq()%>">
										<%if(tempDto.getUser_active().equals("A")){%>
											정상
										<%} else if(tempDto.getUser_level().equals("B")){%>
											정지
										<%}%>
									</td>
									<%if(user_active.equals("A")) {%>
										<td>
											<button id="btn<%=tempDto.getUser_seq()%>" type="button" onClick="goActive('<%=tempDto.getUser_seq()%>')">사용중지</button>
										</td>
									<%}else if(user_active.equals("B")) {%>
										<td>
											<button id="btn<%=tempDto.getUser_seq()%>" type="button" onClick="goActive('<%=tempDto.getUser_seq()%>')">사용</button>
										</td>
									<%} %>
								</tr>
								<%} %>
							</tbody>
						</table>
						<input type="hidden" name="user_active" id="user_active" value="" />
						<input type="hidden" name="user_seq" id="user_seq" value="" />
					
					</div>

				</div>

			</div>

		</div>

	</form>

</body>
</html>

<script>

// window.onload=function(){
<%-- 	let key = '<%=key%>'; --%>
// 	var texts=["", "선택하세요", "제목", "내용", "제목+내용"];  //0을 비운거임
// 	document.getElementById("searchItem").innerHTML=texts[key];
	
// }


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
		
		//location.href="<%=request.getContextPath()%>/admin/member/list";
		
		if(map.result == 'B'){
			// 활동여부 컬럼 변경 'B'
			// 사용정지 -> 사용
			console.log("btn"+seq);
			//document.getElementById("userActive"+seq).innerHTML = 'B' ;
			document.getElementById("btn"+seq).innerHTML = '사용';
			
			$("#userActive"+seq).html('B');
		} else if(map.result=='A'){
			// 활동여부 컬럼 변경 'A'
			// 사용 -> 사용정지	
			document.getElementById("userActive"+seq).innerHTML = 'A' ;
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


