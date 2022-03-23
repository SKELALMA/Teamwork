<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.woori.myhome.noticeboard.*" %>
<%@page import="com.woori.myhome.common.*" %>

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
    <%@include file="../include/nav.jsp" %>
	<%
		String key = StringUtil.nullToValue(request.getParameter("key"), "1");
		String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
		String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
	%>
	<%
	NoticeBoardDto dto = (NoticeBoardDto)request.getAttribute("noticeBoardDto");
	%>
	
	<form name="myform">
		<input type="hidden" name="notice_id" id="notice_id" value="<%=dto.getNotice_id()%>" >
		<input type="hidden" name="pg"      value="<%=pg%>" >
		<input type="hidden" name="key"     value="<%=key%>" >
		<input type="hidden" name="keyword" value="<%=keyword%>" >
	
    <div class="container" style="margin-top:80px">
        <h2>공지사항 상세보기</h2>
        <table class="table table-hover " style="margin-top:30px;">
            <tbody>
              <tr class="table-secondary">
                <th>제목</th>
                <td colspan="6"><%=dto.getNotice_title() %></td>
              </tr>
              <tr>
                <th>작성자</th>
                <td>관리자</td>
                <th >작성일</th>
                <td><%=dto.getNotice_wdate()%></td>
                <th>조회수</th>
                <td><%=dto.getNotice_hit()+1%></td>

              </tr>
              <tr>
                <th colspan="6">내용</td>
              </tr>
              <tr>
                <td colspan="6">             
					<%=dto.getNotice_comment().replaceAll("\n", "<br/>") %>
                </td>
              </tr>
            </tbody>
          </table>
       
          <div class="container mt-3" style="text-align:right;">
            <a href="#none" onclick="goList()" class="btn btn-secondary">목록</a>
	<%if(userid!=null && level.equals("2")){%>
            <a href="#none" onclick="goModify()" class="btn btn-secondary">수정</a>
            <a href="#none" onclick="goDelete()" class="btn btn-secondary">삭제</a>
             <%} %>   
          </div>
          
          <table class="table" style="margin-top:20px" id="tbl_comment">
          	<colgroup>
          		<col width="10%">
          		<col width="*">
          		<col width="20%">
          	</colgroup>
		    <thead>
		      <tr>
		        <th colspan="3">댓글</th>
		      </tr>
		    </thead>
		    <tbody>
		      
		    </tbody>
		  </table>
          
        <input type="hidden" name="comment_userid" id="userid" value="<%=userid%>" />
		<input type="hidden" name="comment_board_id" id="board_id" value="<%=dto.getNotice_id()%>" /> 
        <input type="hidden" name="comment_id" id="comment_id" value="" />
          
          <div class="mb-3" style="margin-top:13px;">   <!-- textarea는 태그 사이에 내용 넣어야 함 input은 value에 넣음 -->
          	<textarea class="form-control" rows="3" id="comment" name="comment"></textarea>                      
          </div>
          
          <div class="container mt-3" style="text-align:right;" id="btnRegister">
          	<a href="#none" onclick="goCommentWrite()" class="btn btn-primary">
          		<span id="btnCommentSave">댓글등록</span>
          	</a>
          </div>
          
    </div>
    
    </form>
</body>
</html>

<script>

$(function(){
	goInit();
});

function goList(){
	
	var frm = document.myform;
	frm.action="<%=request.getContextPath()%>/noticeboard/list";
	frm.submit();
}

function goModify(){
	
	var frm = document.myform;
	frm.action="<%=request.getContextPath()%>/noticeboard/modify";
	frm.submit();
}

function goDelete(){
	
	if( confirm("삭제하시겠습니까?") ){
		
		var frm = document.myform;
		frm.action="<%=request.getContextPath()%>/noticeboard/delete";
		frm.submit();
	}
}

function goInit(){
	
	var frmData = new FormData(document.myform);
	console.log( $("#board_id").val() );
	
	$.ajax({
		url:"${commonURL}/noticeboard/comment/list?comment_board_id="+$("#board_id").val(),
		type:"GET",
		dataType:"JSON"
	})
	.done( (result)=>{
//		console.log( result );
		//데이터가 배열형태로 전달받음
		//forEach( (item)=>{}) 배열이 요소 하나하나마다 함수를 호출해준다
		//각 요소를 매개변수로 전달
		
		//$("#tbl_comment > tbody:last").remove();
		for(i=$("#tbl_comment tr").length-2; i>=0; i--){
			$("#tbl_comment tr:last").remove();  //이전에 있던것 전부 삭제
			console.log("*");
		}
		
		console.log(result);
		var userid='<%=userid%>';
		
		var i=1;
		result.forEach( (item)=>{
			var data = "<tr>";
				data += "<td>"+ i +"</td>";
				data += "<td>"+item.comment+"</td>";
				data += "<td>"+item.comment_userid+"</td>";
				data += "<td>"+item.comment_wdate+"</td>";
// 				if(userid==item.userid)
					data += "<td>"+item.username
						 +"&nbsp<button type='button' onclick=goCommentModify('"+item.comment_id+"')>수정</button>"
						 +"&nbsp<button type='button' onclick=goCommentDelete('"+item.comment_id+"')>삭제</button>"
						 +"</td>";
// 				else
// 					data += "<td>"+item.username+"</td>";
				data += "</tr>";
				i++;
			console.log(data);
			$("#tbl_comment > tbody:last").append(data);
			
		})
	})
	.fail( (error)=>{
		console.log( error );
	})
}

function goCommentWrite(){
	
 	var userid='<%=userid%>'; 
 	if(userid==""){
		
 		alert("로그인하세요");
 		location.href="${commonURL}/member/login";
 	}
	var queryString = $("form[name=myform]").serialize();

	$.ajax({				
		url:"${commonURL}/noticeboard/comment/write",
		data:queryString,
		type:"POST"
	})
	.done( (result)=>{
		$("#comment").val("");
		$("#btnCommentSave").html("댓글등록");
		$("#comment_id").val("");
		goInit();
	})
	.fail( (error)=>{
		console.log( error );
	})
}

function goCommentModify(comment_id){
	
<%-- 	var userid='<%=userid%>'; --%>
	$("#comment_id").val(comment_id);
// 	if(userid==""){
		
// 		alert("로그인하세요");
// 		location.href="${commonURL}/member/login";
// 	}

	$.ajax({
		url:"${commonURL}/noticeboard/comment/getView?comment_id="+comment_id,
		type:"GET",
		dataType:"json"
	})
	.done( (result)=>{
		$("#comment").val(result.comment);
		$("#btnCommentSave").html("저장");
	})
	.fail( (error)=>{
		console.log( error );
	})
}

function goCommentDelete(comment_id){
	
	var userid='<%=userid%>';
	$("#comment_id").val(comment_id);
	if(userid==""){
		
		alert("로그인하세요");
		location.href="${commonURL}/member/login";
	}
	
	if( !confirm("삭제하시겠습니까?"))
		return false;
	
	var frmData = new FormData(document.myform);
	console.log(frmData);
	var queryString = $("form[name=myform]").serialize();

	$.ajax({
		url:"${commonURL}/noticeboard/comment/delete",
		data:queryString,
		contentType:false,
		processData:false,
		type:"POST"
	})
	.done( (result)=>{
		$("#comment").val("");
		$("#comment_id").val("");
		goInit();
	})
	.fail( (error)=>{
		console.log( error );
	})
}

</script>















