<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.woori.myhome.qnaboard.*" %>
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
	    QnABoardDto dto = (QnABoardDto)request.getAttribute("qnaboardDto");
	    String mode = (String)request.getAttribute("mode");
    %>

	<form name="myform">
	
		<!-- 글쓰기 전의 페이지 값 -->
		<input type="hidden" name="pg"      value="<%=pg%>" >
		<input type="hidden" name="key"     value="<%=key%>" >
		<input type="hidden" name="keyword" value="<%=keyword%>" >
	
		<input type="hidden" name="qna_id" id="seq" value="<%=dto.getQna_id()%>">
	    <input type="hidden" name="qna_group_id" id="group_id" value="<%=dto.getQna_group_id()%>" />
		<input type="hidden" name="qna_g_level"  id="g_level"  value="<%=dto.getQna_g_level()%>" />
		<input type="hidden" name="qna_depth"    id="depth"    value="<%=dto.getQna_depth()%>" />
		<input type="hidden" name="mode"     id="mode"     value="<%=mode %>" />
		
    <div class="container" style="margin-top:80px">
        <h2>QnA 쓰기</h2>

        <table class="table table-hover " style="margin-top: 30px;">
            <colgroup>
                <col width="25%">
                <col width="*">
            </colgroup>
        
            <tbody>
              <tr>
                <td>제목</td>
                <td>
                    <div class="mb-3" style="margin-top:13px;">
                        <input type="text" class="form-control" id="title" name="qna_title" 
                        placeholder="제목을 입력하세요" value="<%=dto.getQna_title()%>">
                    </div>
                </td>
              </tr>       
              <tr>
                <td>작성자</td>
                <td>
                    <div class="mb-3" style="margin-top:13px;">
                        <input type="hidden" id="userid" name="userid" value="manager">
                        <input type="text" class="form-control" id="username" name="qna_writer" placeholder="" value="<%=userid%>" readonly>
                    </div>
                </td>
              </tr>      
              <tr>
                <td>내용</td>
                <td>
                    <div class="mb-3" style="margin-top:13px;">   <!-- textarea는 태그 사이에 내용 넣어야 함 input은 value에 넣음 -->
                      <textarea class="form-control" rows="5" id="contents" name="qna_comment"><%=dto.getQna_comment()%></textarea>
                    </div>
                </td>
              </tr>          
            </tbody>
          </table>
       
          <div class="container mt-3" style="text-align:right;">
            <input type="button" class="btn btn-secondary" value="등록" onclick="goWrite()">
          </div>
          
    </div>
    
    </form>
</body>
</html>

<script>
function goWrite(){
	
	var frm = document.myform;
	if( frm.title.value.trim().length<5){
		
		alert("제목을 5글자 이상 작성하세요");
		frm.title.focus();
		return false;
	}
	
	if( frm.username.value.trim().length==0){
		
		alert("이름을 작성하세요");
		frm.username.focus();
		return false;
	}

	if( frm.contents.value.trim().length<10){
		
		alert("내용을 10글자 이상 작성하세요");
		frm.contents.focus();
		return false;
	}
	
	//var frmData = new FormData(frm);  -- 파일 전송시에 사용하자
	//enctype="multipart/~"
	
	var queryString = $("form[name=myform]").serialize();    //원래는 이 방법을 사용하는 것이 맞음
	//파일전송 없을때 데이터가 안정적으로 감                          앞으로도 이 방법 사용할것
	console.log(queryString);
	
	$.ajax({
		url:"${commonURL}/qnaboard/save",
		data:queryString,
		//contentType:false, //-- 파일 업로드시 사용된다.
		//processData:false, //-- 파일 업로드시 사용된다.
		type:"POST",
		queryString
		
	})
	.done( (result)=>{
		console.log( result );
		
		alert("등록되었습니다.")
// 		location.href="${commonURL}/qnaboard/list";  //list화면으로 이동하기
		var frm = document.myform;
		frm.action="${commonURL}/qnaboard/list";
		frm.method="GET";
		frm.submit();
		
	})
	.fail( (error)=>{
		console.log( error );
	})
	
}
</script>





