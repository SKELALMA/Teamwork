<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@page import="java.util.*" %>
<%@page import="com.woori.myhome.common.*" %>
<%@page import="com.woori.myhome.DIYBoard.*"%>
<%@page import="com.woori.myhome.noticeboard.*" %>
<%@page import="com.woori.myhome.ReceipeBoard.*"%>

<%
   DIYBoardDto dto = (DIYBoardDto) request.getAttribute("galleryDto");
   List<DIYBoardDto> list = (List<DIYBoardDto>)request.getAttribute("galleryList");
   List<ReceipeBoardDto> relist = (List<ReceipeBoardDto>)request.getAttribute("receipeList");
   List<NoticeBoardDto> nlist = (List<NoticeBoardDto>)request.getAttribute("noticeboard_list");
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>냉장고를 부탁해</title>

   <!-- 주변마트찾기 -->
    <link rel="stylesheet" href="./resources/css/map.css">
    <script defer src="./resources/js/map.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2f32e646717ff8293f5afb8e4b1e42e3&libraries=services,clusterer,drawing"></script>
    
    <!-- quickmenu -->
    <link rel="stylesheet" href="./resources/css/quickmenu.css">
    <script defer src="./resources/js/quickmenu.js"></script>

    <link rel="canonical" href="./carousel-rtl/">

    <!-- Jquery 링크 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- 부트스트랩 링크 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
   <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
   <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
   <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

   <!-- css링크 -->
   <link rel="stylesheet" href="./resources/css/main.css">

</head>
<body>

<!-- 상단메뉴 import -->
<%@include file="./include/nav.jsp" %>

<!-- --------------------------- 레시피 ------------------------------------- -->
<div class="container marketing">
    <div class="page-header">
        <h3>레시피</h3>
        <p>자기만의 독창적인 레시피를 공유하세요</p>
    </div>
    <form name="myform" method="get">
<div class="container">
<div class="col-xs-12">

<input type="hidden" name="id"  id="id" value=""/>
<input type="hidden" name="notice_id"  id="notice_id" value=""/>
    <div class="carousel slide" id="myRecipe">
        <div class="carousel-inner">
            <div class="item active">
                    <ul class="thumbnails">
                      <%if(relist.size()>=4) {%> 
                    <% for( int i=0;i<4;i++){ %>
                        <li class="col-sm-3">
                      <div class="casing">
                        <div class="thumbnail">
                           <a href='#' onclick="goReCeipeView('<%=relist.get(i).getId()%>')"><img src="<%=request.getContextPath() %>/upload/<%=relist.get(i).getImage()%>" alt="Lights" style="width:100%; height:150px; object-fit: cover;"></a>
                        </div>
                        <div class="caption">
                           <a href="#none"><p><%=relist.get(i).getTitle()%></p></a>
                           <a class="btn btn-mini" href="#none" onclick="goReCeipeView('<%=relist.get(i).getId()%>')">» Read More</a>
                        </div>
                            </div>
                        </li>
                        <%} %>    
                          <%} %>                      
                    </ul>
              </div><!-- /Slide1 --> 
               <div class="item">
                    <ul class="thumbnails">
                    <%if(relist.size()>=8) {%>  
                     <% for( int i=4;i<8;i++){ %>
                        <li class="col-sm-3">
                      <div class="casing">
                        <div class="thumbnail">
                           <a href="#none" onclick="goReCeipeView('<%=relist.get(i).getId()%>')"><img src="<%=request.getContextPath() %>/upload/<%=relist.get(i).getImage()%>" alt="Lights" style="width:100%; height:150px; object-fit: cover;"></a>
                            <%-- <a href="<%=request.getContextPath() %>/upload/<%=dto.getImage()%>" target="_blank"> --%>
                        </div>
                        <div class="caption">
                            <a href="#none"><p><%=relist.get(i).getTitle()%></p></a>
                          <a class="btn btn-mini" href="#none" onclick="goReCeipeView('<%=relist.get(i).getId()%>')">» Read More</a>
                        </div>
                            </div>
                        </li>
                            <%} %>
                           <%} %>
                    </ul>
              </div> <!-- /Slide2 --> 

        </div>
               
      <nav>
         <ul class="control-box pager">
            <li class="left"><a data-slide="prev" href="#myRecipe" class="arrowStil"><i class="glyphicon glyphicon-chevron-left"></i></a></li>
            <li class="right"><a data-slide="next" href="#myRecipe" class="arrowStil"><i class="glyphicon glyphicon-chevron-right"></i></li>
         </ul>
      </nav>
      <!-- /.control-box -->   
                              
    </div><!-- /#myRecipe -->
        
</div><!-- /.col-xs-12 -->          

</div><!-- /.container -->
</div>
</a>
<!------------------------------------ 자랑하기  ---------------------------------------->
<div class="container marketing">
    <div class="page-header">
        <h3>자랑게시판</h3>
        <p>내가 만든 요리를 자랑하세요!</p>
    </div>
<div class="container">
<div class="col-xs-12">
    <div class="carousel slide" id="myDIY">
        <div class="carousel-inner">
            <div class="item active">
                    <ul class="thumbnails">
                     <%if(list.size()>=4) {%>  
                     <% for( int i=0;i<4;i++){ %>
                        <li class="col-sm-3">
                      <div class="casing">
                        <div class="thumbnail">
                           <a href='#' onclick="goDIYView('<%=list.get(i).getId()%>')"><img src="<%=request.getContextPath() %>/upload/<%=list.get(i).getImage()%>" alt="Lights" style="width:100%; height:150px; object-fit: cover;"></a>
                            <%-- <a href="<%=request.getContextPath() %>/upload/<%=dto.getImage()%>" target="_blank"> --%>
                        </div>
                        <div class="caption">
                            <a href="#none"><p><%=list.get(i).getTitle()%></p></a>
                           <a class="btn btn-mini" href="#" onclick="goDIYView('<%=list.get(i).getId()%>')">» Read More</a>
                        </div>
                            </div>
                        </li>
                           <%} %>
                             <%} %>
                    </ul>
              </div><!-- /Slide1 --> 
             <div class="item">
                    <ul class="thumbnails">
                    <%if(list.size()>=8) {%>  
                     <% for( int i=4;i<8;i++){ %>
                        <li class="col-sm-3">
                      <div class="casing">
                        <div class="thumbnail">
                            <a href='#' onclick="goDIYView('<%=list.get(i).getId()%>')"><img src="<%=request.getContextPath() %>/upload/<%=list.get(i).getImage()%>" alt="Lights" style="width:100%; height:150px; object-fit: cover;"></a>                            
                            <%-- <a href="<%=request.getContextPath() %>/upload/<%=dto.getImage()%>" target="_blank"> --%>
                        </div>
                        <div class="caption">
                            <a href="#none"><p><%=list.get(i).getTitle()%></p></a>
                             <a class="btn btn-mini" href="#" onclick="goDIYView('<%=list.get(i).getId()%>')">» Read More</a>
                        </div>
                            </div>
                        </li>
                            <%} %>
                           <%} %>
                    </ul>
              </div> <!-- /Slide2 --> 
        </div>
        
       
      <nav>
         <ul class="control-box pager">
            <li class="left"><a data-slide="prev" href="#myDIY" class="arrowStil"><i class="glyphicon glyphicon-chevron-left"></i></a></li>
            <li class="right"><a data-slide="next" href="#myDIY" class="arrowStil"><i class="glyphicon glyphicon-chevron-right"></i></a></li>
         </ul>
      </nav>
      <!-- /.control-box -->   
                              
    </div><!-- /#myRecipe -->
        
</div><!-- /.col-xs-12 -->          

</div><!-- /.container -->
</div>
</a>

</br>
</br>
</br>
</br>
</br>
</br>



<!------------------------------------ 공지사항  ---------------------------------------->


<div class="container marketing">
    <div class="page-header">
        <h3>공지사항</h3>
        <p>냉장고가 말합니다!</p>
    </div>
         <table class="table table-hover ">
           <colgroup>
              <col width="8%">
              <col width="12%">
              <col width="12%">
           </colgroup>
            <thead class="table-success">
              <tr>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
              </tr>
            </thead>
       <tbody>
       
        
                   <%if(nlist.size()>=4) {%>
        <%  for( int i=0; i<4; i++){ %>         
			                          
                 <td><a href="#" onclick="goNoticeView('<%=nlist.get(i).getNotice_id() %>')">
                 	<%=nlist.get(i).getNotice_title()%></a></td> 
                 <td>관리자</td>
                <td ><%=nlist.get(i).getNotice_wdate()%></td>
               </tr> 
               
               <%} %>
             <%} %>
           
        </tbody>
            </table>

</div>
</form>
<!------------------------------------ 주변 마트 찾기 ---------------------------------------->
<div class="container marketing">
    <div class="page-header">
        <h3>주변 마트 찾기</h3>
        <p>주변 마트를 찾아보세요!</p>
    </div>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="주변 마트" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2f32e646717ff8293f5afb8e4b1e42e3"></script>
</div>

   <hr class="featurette-divider">
   
<!---------------------------- 사이드 퀵메뉴 --------------------------------->   
     <div class="qnb">      
              <div class="side_menu">
                  <a href="/myhome/noticeboard/list" class="link_menu">공지사항</a>
                  <a href="/myhome/qnaboard/list" class="link_menu">QnA</a>
                  <a href="#" class="link_menu" class="float-end">TOP</a>
              </div>
      </div>

</main>

<!--  -------------------- 하단 회사 소개문 ----------------------------- -->
  <footer class="container">
    <p class="float-end"><a href="#">Back to top</a></p>
    <p>&copy; 2017–2021 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
  </footer>
</body>
</html>

<!-- 메뉴바 상단 고정 변수-->
<script>
function goNoticeView(id){
    
    frm = document.myform;
    frm.notice_id.value=id;
    frm.method="get";
    frm.action="${pageContext.request.contextPath}/noticeboard/view";
    frm.submit();
 }
      
	 function goReCeipeView(id)
  {
  	frm = document.myform;
  	frm.id.value=id;///////////
  	frm.method="get";
  	frm.action="${pageContext.request.contextPath}/receipe/view";
  	frm.submit();
  }

  function goDIYView(id)
  {
  	frm = document.myform;
  	frm.id.value=id;///////////
  	frm.method="get";
  	frm.action="${pageContext.request.contextPath}/gallery/view";
  	frm.submit();
  }
      
      
    <!-- 슬라이드 변수 -->  
  $(document).ready(function() {
    $('.carousel').carousel({
      interval: 6000
    })
  });
</script>