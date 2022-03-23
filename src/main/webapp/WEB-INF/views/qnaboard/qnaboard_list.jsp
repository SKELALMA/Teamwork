<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.woori.myhome.common.*" %>
<%@page import="com.woori.myhome.qnaboard.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<%
	String key = StringUtil.nullToValue(request.getParameter("key"), "1");
	String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
	String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
	int totalCnt = (Integer)request.getAttribute("totalCnt");
%>

<%@include file="../include/nav.jsp" %>

<form name="myform" method="get">
	<input type="hidden" name="key" id="key" value="<%=key%>"/>
	<input type="hidden" name="pg" id="pg" value="<%=pg%>"/>
	<input type="hidden" name="qna_id" id="qna_id" value=""/>



    <div class="container" >
    	<div class="thumbnail">
	      <a href='#'></a><img src="<%=request.getContextPath()%>/resources/images/qna.png/" alt="Lights" style="width:100%; height:250px; object-fit: cover;"></a>                          
	    </div>
        <h2 style="margin-top:50px">QnA (${totalCnt}건)</h2>   <!-- 배열은 $ (== < %=request.getAttribute("totalCnt")%>) 표현식 못씀 -->

        <div class="input-group mb-3" style="margin-top:20px;">
            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" id="searchItem">
                선택하세요
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#" onclick="changeSearch('1')">선택하세요</a></li>
              <li><a class="dropdown-item" href="#" onclick="changeSearch('2')">제목</a></li>
              <li><a class="dropdown-item" href="#" onclick="changeSearch('3')">내용</a></li>
              <li><a class="dropdown-item" href="#" onclick="changeSearch('4')">제목+내용</a></li>
            </ul>
            <input type="text" class="form-control" placeholder="Search" name="keyword" id="keyword" value="<%=keyword%>"> <!-- id는 식별용 name은 서버로 보내는용 -->
            <button class="btn btn-secondary" type="button" onclick="goSearch()">Go</button>
          </div>

        <table class="table table-hover ">
        	<colgroup>
        		<col width="8%">
        		<col width="*">
        		<col width="12%">
        		<col width="12%">
        		<col width="10%">
        	</colgroup>
            <thead class="table-secondary">
              <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th style="text-align:center;">조회수</th>
              </tr>
            </thead>
            <tbody>
            <%
            
            List<QnABoardDto> list = (List<QnABoardDto>)request.getAttribute("qnaBoardList");
           	for(QnABoardDto tempDto : list){
           		String reply="";
           		for(int i=0; i<tempDto.getQna_depth(); i++)
           			reply += "&nbsp;&nbsp;&nbsp;";
           		if(tempDto.getQna_depth()>0)
           			reply += "Re:";
            %>
              <tr>
                <td><%=totalCnt - tempDto.getRnum()+1%></td>
                <td><%=reply %><a href="#none" onclick="goView('<%=tempDto.getQna_id() %>')"><%=tempDto.getQna_title()%></a></td>
                <td><%=tempDto.getQna_writer()%></td>
                <td><%=tempDto.getQna_wdate()%></td>
                <td style="text-align:center;"><%=tempDto.getQna_hit()%></td>
              </tr>
            <%}%>
            </tbody>
          </table>
          
 
          <div class="container mt-3" style="text-align:right;">
          	<%=Pager.makeTag(request, 10, totalCnt) %>
          </div>

          <div class="container mt-3" style="text-align:right;">
            <a href="<%=request.getContextPath()%>/qnaboard/write" 
               class="btn btn-secondary">글쓰기</a>
          </div>
          
    </div>
    
   </form>
    
</body>
</html>

<script>

window.onload=function(){
	let key = '<%=key%>';
	var texts=["", "선택하세요", "제목", "내용", "제목+내용"];  //0을 비운거임
	document.getElementById("searchItem").innerHTML=texts[key];
	
}


function changeSearch(id){
	
	var texts=["", "선택하세요", "제목", "내용", "제목+내용"];  //0을 비운거임
	document.getElementById("searchItem").innerHTML=texts[id]; //화면에 보이기 위해서
	document.getElementById("key").value=id; //컨트롤러로 넘기기 위해서
	document.getElementById("keyword").value="";
}

function goSearch(){
	
	let frm = document.myform;
	frm.pg.value=0;
	frm.action = "<%=request.getContextPath()%>/qnaboard/list";
	frm.method="get";
	frm.submit();
}

function goPage(pg){
	
	frm = document.myform;
	frm.pg.value=pg;
	frm.method="get";
	frm.action="${pageContext.request.contextPath}/qnaboard/list";
	frm.submit();
}

function goView(id){
	
	frm = document.myform;
	frm.qna_id.value=id;
	frm.method="get";
	frm.action="${pageContext.request.contextPath}/qnaboard/view";
	frm.submit();
}

</script>


