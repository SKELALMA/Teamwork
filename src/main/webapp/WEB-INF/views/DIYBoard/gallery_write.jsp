<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.woori.myhome.DIYBoard.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

   	<script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>
	
	<link rel="stylesheet" href="../resources/ckeditor5/sample/stlye.css"> 
	<script src="../resources/ckeditor5/build/ckeditor.js"></script>

<style>
	.ck-editor__editable{
	height: 300px;
	}
</style>

</head>
<body>
    <%@include file="../include/nav.jsp" %>
	<%
		DIYBoardDto dto = (DIYBoardDto)request.getAttribute("galleryDto");
	%>

	<form  name="myform" method="post" enctype="multipart/form-data">	
		<input type="text" name="id" value="<%=dto.getId()%>" />
		
    <div class="container" style="margin-top:80px">
        <h2>갤러리 쓰기</h2>

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
                        <input type="text" class="form-control" id="title" name="title" 
                        placeholder="제목을 입력하세요" value="<%=dto.getTitle()%>">
                    </div>
                </td>
              </tr>       
              <tr>
                <td>작성자</td>
                <td>
                    <div class="mb-3" style="margin-top:13px;">
                        <input type="text" class="form-control" id="writer" name="writer" 
                        placeholder="이름을 입력하세요" value="<%=dto.getWriter()%>">
                    </div>
                </td>
              </tr>      
              <tr>
                <td>내용</td>
                <td>
                    <div >
       					<textarea class="form-control" rows="5" id="editor" name="comment"><%=dto.getComment()%></textarea> 
    				</div>
                </td>
              </tr> 
              
             <!-- 
             <tr>
                <td>내용</td>
                <td>
                    <div class="mb-3" style="margin-top:13px;">
                      <textarea class="form-control" rows="5" id="comment" name="comment"><%=dto.getComment()%></textarea>
                    </div>
                </td>
              </tr>   
              -->
             
               
             <tr>
                <td></td>
                <td>
                    <div class="mb-3" style="margin-top:13px;">
                        <input type="hidden" class="form-control" id="upload" name="upload" 
                        placeholder="이미지를 업로드하세요" value="" >
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

let editor;

ClassicEditor
.create( document.querySelector( '#editor' ), 
		 {
		ckfinder: {
	        uploadUrl: '/myhome/ck/fileupload2' // 내가 지정한 업로드 url (post로 요청감)
		},
		alignment: {
	        options: [ 'left', 'center', 'right' ]
	    },

	toolbar: {
		items: [
			'heading', 
			'|',
			'fontFamily',
			'fontSize',
			'fontColor',
			'bold',
			'underline',
			'italic',
			'blockQuote',
			'specialCharacters',
			'|',
			'bulletedList',
			'numberedList',
			'indent',
			'outdent',
			'|',
			'insertTable',
			'mediaEmbed',
			'link',
			'imageUpload',
			'undo',
			'redo'
		]
	}, 
	language: 'ko',
	image: {
		toolbar: [
			'imageTextAlternative',
			'imageStyle:full',
			'imageStyle:side'
		]
	},
	table: {
		contentToolbar: [
			'tableColumn',
			'tableRow',	
			'mergeTableCells',
			'tableCellProperties',
			'tableProperties'
		]
	},
	fontFamily: {
        options: [
            'default',
            'Ubuntu, Arial, sans-serif',
            'Ubuntu Mono, Courier New, Courier, monospace'
        ]
    },
	licenseKey: '',
} )
.then( newEditor => {
//	window.editor = editor;
	editor = newEditor;
	
} )
.catch( error => {
	console.error( 'Oops, something went wrong!' );
	console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
	
	console.error( error );
} );



function goWrite()
{
	var frm = document.myform;
	if( frm.title.value.trim().length<5)
	{
		alert("제목을 10글자 이상 작성하세요");
		frm.title.focus();
		return false;
	}
	
	if( frm.writer.value.trim().length==0)
	{
		alert("이름을 작성하세요");
		frm.writer.focus();
		return false;
	}
	
	const editorData = editor.getData(); // <div><img>

	var htmlObject = document.createElement('div');
	htmlObject.innerHTML = editorData;
	
	console.log("htmlObject"+htmlObject);
	
	
	var list = htmlObject.querySelectorAll('img');
	if(list.length!=0){
	//	console.log(list);
	//	console.log(list[0].getAttribute("src"));
		
		var nameList = list[0].getAttribute("src").split("/");
		console.log("nameList"+nameList);
		
		var filename = nameList[nameList.length-1];
		console.log("filename"+filename);
		
		frm.upload.value = filename; // upload hidden tag
		
		console.log(filename);
		
	//	alert(editorData);
	//	editor.setData('');
		// editorDate -> 문자열 split, 정규식
	
	}
	

	frm.action="<%=request.getContextPath()%>/gallery/save";
	frm.method="post";
	frm.submit(); //서버로 전송하기 
	
}
</script>







