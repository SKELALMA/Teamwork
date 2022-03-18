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
<div class="container">
<div class="col-xs-12">
    <div class="carousel slide" id="myRecipe">
        <div class="carousel-inner">
            <div class="item active">
                    <ul class="thumbnails">
                        <li class="col-sm-3">
    						<div class="casing">
								<div class="thumbnail">
									<a href="#"><img src="./resources/images/diyramen.jpg" alt=""></a>
								</div>
								<div class="caption">
									<h4>한뚝배기 하실래요?</h4>
									<p>고수를 듬쁙넣어서 입안이 상쾌해지는 맛</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
						<li class="col-sm-3">
							<div class="casing">
								<div class="thumbnail">
									<a href="#"><img src="./resources/images/steak.jpg" alt=""></a>
								</div>
								<div class="caption">
									<h4>스테이크다!</h4>
									<p>고기다!고기!</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-3">
							<div class="casing">
								<div class="thumbnail">
									<a href="#"><img src="./resources/images/sandwich.png" alt=""></a>
								</div>
								<div class="caption">
									<h4>바삭 샌드위치!</h4>
									<p>집안에서 굴러다니는 재료로 만들어서 맛이 기가막힘! 직접들 해보셔봐요!</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-3">
							<div class="casing">
								<div class="thumbnail">
									<a href="#"><img src="./resources/images/hotdog.jpg" alt=""></a>
								</div>
								<div class="caption">
									<h4>찐! 핫도그</h4>
									<p>미국식 찐! 오리지널 핫도그! 맛도 본고장 그대로!</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                    </ul>
              </div><!-- /Slide1 --> 
            <div class="item">
                    <ul class="thumbnails">
                        <li class="col-sm-3">
							<div class="casing">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Item Title</h4>
									<p>Hello world, something nice to develop</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-3">
							<div class="casing">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Item Title</h4>
									<p>Hello world, something nice to develop</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-3">
							<div class="casing">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Item Title</h4>
									<p>Hello world, something nice to develop</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-3">
							<div class="casing">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Item Title</h4>
									<p>Hello world, something nice to develop</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                    </ul>
              </div><!-- /Slide2 --> 
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
<!-- ---------------------------자랑게시판------------------------------------- -->

<div class="container marketing">
    <div class="page-header">
        <h3>자랑게시판</h3>
        <p>내가 만든 요리를 자랑하세요!</p>
    </div>
<div class="container">
<div class="col-xs-12">
    <div class="carousel slide" id="myRecipe">
        <div class="carousel-inner">
            <div class="item active">
                    <ul class="thumbnails">
                        <li class="col-sm-3">
    						<div class="casing">
								<div class="thumbnail">
									<a href="#"><img src="./resources/images/diyramen.jpg" alt=""></a>
								</div>
								<div class="caption">
									<h4>한뚝배기 하실래요?</h4>
									<p>고수를 듬쁙넣어서 입안이 상쾌해지는 맛</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
						<li class="col-sm-3">
							<div class="casing">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Item Title</h4>
									<p>Hello world, something nice to develop</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-3">
							<div class="casing">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Item Title</h4>
									<p>Hello world, something nice to develop</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-3">
							<div class="casing">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Item Title</h4>
									<p>Hello world, something nice to develop</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                    </ul>
              </div><!-- /Slide1 --> 
            <div class="item">
                    <ul class="thumbnails">
                        <li class="col-sm-3">
							<div class="casing">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Item Title</h4>
									<p>Hello world, something nice to develop</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-3">
							<div class="casing">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Item Title</h4>
									<p>Hello world, something nice to develop</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-3">
							<div class="casing">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Item Title</h4>
									<p>Hello world, something nice to develop</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-3">
							<div class="casing">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Item Title</h4>
									<p>Hello world, something nice to develop</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                    </ul>
              </div><!-- /Slide2 --> 
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
    function navigo (){
          const header = document.getElementById("menu");
          const headerheight = header.clientHeight;
          document.addEventListener('scroll', onScroll, { passive: true });
          function onScroll () {
              const scrollposition = pageYOffset;
              const nav = document.getElementById("menu");
              if (headerheight<=scrollposition){
                  nav.classList.add('fix')
              }
              else {
                  nav.classList.remove('fix');
              }
          } 
      }
      navigo()
      
      
  $(document).ready(function() {
    $('.carousel').carousel({
      interval: 6000
    })
  });
</script>
