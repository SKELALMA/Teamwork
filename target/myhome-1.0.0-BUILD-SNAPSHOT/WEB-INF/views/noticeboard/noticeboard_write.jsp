<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.woori.myhome.noticeboard.*" %>
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
    <%@include file="../include/nav.jsp" %>
    <%
    NoticeBoardDto dto = (NoticeBoardDto)request.getAttribute("noticeBoardDto");
    %>

	<form  name="myform" action="<%=request.getContextPath()%>/board/save" method="post">
		<input type="hidden" name="id" value="<%=dto.getNotice_id()%>">
	
    <div class="container" style="margin-top:80px">
        <h2>게시판 쓰기</h2>

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
                        <input type="text" class="form-control" id="title" name="notice_title" 
                        placeholder="제목을 입력하세요" value="<%=dto.getNotice_title()%>">
                    </div>
                </td>
              </tr>       
              <tr>
                <td>작성자</td>
                <td>
                    <div class="mb-3" style="margin-top:13px;">
<%--                         <input type="hidden" id="writer" name="writer" value="<%=userid%>"> --%>
                        <input type="text" class="form-control" value="관리자">
                    </div>
                </td>
              </tr>      
              <tr>
                <td>내용</td>
                <td>
                    <div class="mb-3" style="margin-top:13px;">   <!-- textarea는 태그 사이에 내용 넣어야 함 input은 value에 넣음 -->
                      <textarea class="form-control" rows="5" id="contents" name="notice_comment"><%=dto.getNotice_comment()%></textarea>
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
	
// 	if( frm.writer.value.trim().length==0){
		
// 		alert("이름을 작성하세요");
// 		frm.writer.focus();
// 		return false;
// 	}
	
	if( frm.contents.value.trim().length<10){
		
		alert("내용을 10글자 이상 작성하세요");
		frm.contents.focus();
		return false;
	}
	
	frm.action="<%=request.getContextPath()%>/noticeboard/save";
	frm.method="post";
	frm.submit(); //서버로 전송하기
	
}
</script>





