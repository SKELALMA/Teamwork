<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@page import="com.woori.myhome.common.*" %>
<% 
request.setAttribute("commonURL", request.getContextPath());

String userid= StringUtil.nullToValue(session.getAttribute("userid"), "");
String username= StringUtil.nullToValue(session.getAttribute("username"), "");
String email= StringUtil.nullToValue(session.getAttribute("email"), "");
String phone= StringUtil.nullToValue(session.getAttribute("phone"), "");

%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>냉장고를 부탁해</title>
    <link rel="stylesheet" href="./resources/css/reset.css">
    <link rel="stylesheet" href="./resources/css/common.css">
    <!-- common.css : header, footer 메인 페이지 -->
    <link rel="stylesheet" href="./resources/css/visual.css">
    <!-- visual.css : header 바로 밑 이미지 슬라이드 파트 -->
    <link rel="stylesheet" href="./resources/css/contents.css">
    <!-- header와 footer를 제외한 콘텐츠 메인 페이지 -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script defer src="./resources/js/common.js"></script>
    <script defer src="./resources/js/contents.js"></script>
    <script defer src="./resources/js/visual.js"></script>
    <link rel="shortcut icon" href="./img/favicon.png">
    <link rel="icon" href="./img/favicon.png">
    
</head>
<body>
<!-- 규칙:
    축약형(link, emph, gnb 등)을 먼저 사용)
    alt로 적절한 대체 텍스트 제공, 너무 긴 경우 공통클래스 blind로 제공-->
    <div id="wrap">
        <div id="top_event" class="login"> <!--login class 추가-->
            <div class="inner_top_event login">
                <a href="#" alt="나만의 레시피를 공유하기" class="top_event_bnr login">
                    나만의 레시피를 
                    <strong class="b">공유하기</strong>
                    <img src="https://res.kurly.com/pc/ico/1908/ico_arrow_333_84x84.png" class="bnr_arr">
                </a>
                <button class="top_event_close login" alt="배너 끄기"></button>
            </div>
        </div>
        
        <div id="header">
            <div class="user_menu">
                <ul class="sign_menu"> <!--login class 추가-->
		       <%if(userid.equals("")) {%>
                    <li class="link">
                        <a href="/myhome/member/join" class="item after join">회원가입</a>
                    </li>
                    <li class="link">
                        <a href="/myhome/member/login" class="item after login_none">로그인</a>
                    </li>
                 <%}else{%>  
                            <li class="link">
                                <a href="/myhome/member/myinfo" class="list_item">개인 정보 수정</a>
                            </li>
                            <li class="link">
                                <a href="/myhome/member/logout" class="list_item">로그아웃</a>
                            </li>
				<%}%>  
                    <li class="link">
                        <a href="#" class="item service">고객센터</a>
                        <!-- 고객센터 hover 시 sub_menu 등장 -->
                        <ul class="sub_menu">
                            <li class="list">
                                <a href="/myhome/noticeboard/list" class="list_item">공지사항</a>
                            </li>
                            <li class="list">
                                <a href="/myhome/qnaboard/list" class="list_item">QnA</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- .sign_menu -->
            </div>
            <div class="header_logo">
                <h1 class="logo">
                    <a href="/myhome" class="link_main">
                        <span class="gnb_logo_container"></span>
                        <img src="./img/logo.png" alt="냉장고를 부탁해" class="logo_img">
                    </a>
                </h1>
            </div>
            <div class="gnb">
            <!-- gnb = global nav bar = 최상위 메뉴  -->
                <h2 class="blind">메뉴</h2>
                    <ul class="gnb_menu">
                        <li class="list gnb_main">
                            <a href="#" class="link">
                                <span class="ico"></span>
                                <!-- ico는 css에서 bg url로 처리 -->
                                <span class="txt">레시피</span>
                            </a>
                            <div class="gnb_sub">
                                <ul class="menu">
                                    <li class="current">
                                        <!-- hover나 active시 current가 옮겨가도록 설정해야 함 -->
                                        <a href="#" class="main_item">
                                            <span class="ico">
                                                
                                                <!--카테고리 별 아이콘은 직관적이게 img src로 바로 삽입 
                                                클릭X(off): 기본, 클릭(on): 보라색 아이콘-->
                                            </span>
                                            <span class="tit"></br>
                                                <span class="txt">한식</span>
                                                <span class="ico_new" alt="new"></span>
                                                <!-- ico_nex: bg url로 처리 -->
                                            </span>
                                            <span class="tit"></br>
                                                <span class="txt">중식</span>
                                                <span class="ico_new" alt="new"></span>
                                                <!-- ico_nex: bg url로 처리 -->
                                            </span>
                                            <span class="tit"></br>
                                                <span class="txt">양식</span>
                                                <span class="ico_new" alt="new"></span>
                                                <!-- ico_nex: bg url로 처리 -->
                                            </span>
                                            <span class="tit"></br>
                                                <span class="txt">일식</span>
                                                <span class="ico_new" alt="new"></span>
                                                <!-- ico_nex: bg url로 처리 -->
                                            </span>
                                            
                                            <!-- tit: text + ico -->
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        
                        <li class="list">
                            <a href="#" class="link">
                                <span class="txt">나의 냉장고</span>
                            </a>
                        </li>
                        <li class="list">
                            <a href="/myhome/gallery/list" class="link">
                                <span class="txt">자랑게시판</span>
                            </a>
                        </li>

                        <div class="gnb_search">
                            <form action="">
                                <input type="text" id="keyword" value="검색어입력" title="검색어입력" class="inp_search">
                                <input type="image" src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png" class="btn_search">
                                <div class="init">
                                    <button type="button" id="search_init" class="btn_delete">검색어 삭제하기</button>
                                </div>
                            </form>
                        </div>
                            
                        <div class="location_login">
                            <!-- 버튼 뒤로 넘기기, 가상요소 선택자로 bg url 아이콘 처리-->
                            <button type="button" class="btn_location on">주소지 등록</button>
                            
                            <div class="location_notice">
                                <!-- 첫 홈페이지 화면에 몇 초간 notice 띄우고 자동으로 off -->
                                <span class="txt">근처 마트를 확인하세요!</span>
                                <div class="group_button">
                                <%if(userid.equals("")) {%>
                                    <a href="/myhome/member/login"><button type="button" class="btn login">로그인</button></a>
                                    <%}else{ %>
                                    <a href="/myhome/member/logout"><button type="button" class="btn login">로그아웃</button></a>
                                    <%} %>
                                    <button type="button" class="btn search_address">
                                        <span class="ico"></span>
                                        주소검색
                                    </button>
                                </div>
                            </div>
                        </div>
                    </ul>
            </div>
        </div>

        <!-- id="visual" -->
        <div id="main">
            <div class="qnb">
                <!-- qnb + quick nav bnr -->
                   
                    <div class="side_menu">
                        <a href="#" class="link_menu">레시피</a>
                        <a href="#" class="link_menu">나의 냉장고</a>
                        <a href="/myhome/gallery/list" class="link_menu">자랑게시판</a>
                    </div>
                </div>
            <div id="contents" class="page_aticle">
               
    
                <div class="top_btn">
                    <button id="go-top" alt="맨 위로가기"></button>
                </div>
    
                <!-- 우선은 bg color 있는 것과 없는 2가지 types만 추가  -->
                <!-- class = "main_type1은 bg 없음" -->
                <div class="main_type1">
                <!-- type1:  -->
                    <div class="product_list">
                    <!-- 상품 추천 -->
                        <div class="tit_goods">
                            <h3 class="tit">
                                <span class="name">
                                인기 레시피
                                </span>
                                <!-- 아이콘 없는 버전, h3에 링크 없음 -->
                            </h3>
                        </div>
                        <!-- list_goods는 마켓컬리와 똑같이 html 파일에서 스타일함 -->
                        <div class="list_goods">
                            <div class="bx_wrapper" style="max-width: 1054px; margin: 0 auto;">
                                <div class="vx-viewport" style="width: 100%; height: 506px; position: relative; overflow: hidden;">
                                    <!-- overflow: hidden 임시로 삭제 -->
                                    <ul data-title="인기 레시피" data-section="today_recommendation" class="list_goods_ul" 
                                    style="width: 2215%; position: relative; transition-duration: 0.5s; transform: translate3d(0, 0, 0);"> 
                                    <!--width: 2215%는 아직 뭔지 모르겠음  -->
                                    <!-- data-section과 data-name은 임시값 -->
    
                                    <!-- list data  -->
                                        <li data-index="1" data-name="today_recommendation" class="list_item"
                                        style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                        <a class="thumb_goods">
                                            <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_10.png" alt="SALE" class="ico">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/goods/1466488979157l0.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <span class="name">
                                                <a class="txt">
                                                    [버크셔세상] 버크셔K 흑돼지 앞다리살 500g(냉장)
                                                </a>
                                            </span>
                                            <span class="price">10,800원</span>
                                            <span class="cost">12,000원</span>
                                        </div>
                                        </li>
                                        <li data-index="2" data-name="today_recommendation" class="list_item"
                                        style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                        <a class="thumb_goods">
                                            <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_15.png" alt="SALE" class="ico">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/goods/1514257155111l0.jpg')">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <span class="name">
                                                <a class="txt">
                                                    이스라엘산 스위티 1개
                                                </a>
                                            </span>
                                            <span class="price">1,870원</span>
                                            <span class="cost">2,200원</span>
                                        </div>
                                        </li>
                                        <li data-index="3" data-name="today_recommendation" class="list_item"
                                        style="float: left; position: relative; width: 249x; margin-right: 18px;">
                                        <a class="thumb_goods">
                                            <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_15.png" alt="SALE" class="ico">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/goods/1510134053904l0.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <span class="name">
                                                <a class="txt">
                                                    [어부네] 생관자 2종(냉장)
                                                </a>
                                            </span>
                                            <span class="price">7,310원</span>
                                            <span class="cost">8,600원</span>
                                        </div>
                                        </li>
                                        <li data-index="4" data-name="today_recommendation" class="list_item"
                                        style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                        <a class="thumb_goods">
                                            <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_5.png" alt="SALE" class="ico">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/goods/160868697126l0.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <span class="name">
                                                <a class="txt">
                                                    [퀸즈프레시] 프리미엄 샐러드 3종
                                                </a>
                                            </span>
                                            <span class="price">6,555원</span>
                                            <span class="cost">6,900원</span>
                                        </div>
                                        </li>
                                        <li data-index="5" data-name="today_recommendation" class="list_item"
                                        style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                        <a class="thumb_goods">
                                            <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_5.png" alt="SALE" class="ico">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/goods/160868697126l0.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <span class="name">
                                                <a class="txt">
                                                    [퀸즈프레시] 프리미엄 샐러드 3종
                                                </a>
                                            </span>
                                            <span class="price">6,555원</span>
                                            <span class="cost">6,900원</span>
                                        </div>
                                        </li>
                                        <li data-index="6" data-name="today_recommendation" class="list_item"
                                        style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                        <a class="thumb_goods">
                                            <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_5.png" alt="SALE" class="ico">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/goods/160868697126l0.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <span class="name">
                                                <a class="txt">
                                                    [퀸즈프레시] 프리미엄 샐러드 3종
                                                </a>
                                            </span>
                                            <span class="price">6,555원</span>
                                            <span class="cost">6,900원</span>
                                        </div>
                                        </li>
                                        <li data-index="7" data-name="today_recommendation" class="list_item"
                                        style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                        <a class="thumb_goods">
                                            <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_5.png" alt="SALE" class="ico">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/goods/160868697126l0.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <span class="name">
                                                <a class="txt">
                                                    [퀸즈프레시] 프리미엄 샐러드 3종
                                                </a>
                                            </span>
                                            <span class="price">6,555원</span>
                                            <span class="cost">6,900원</span>
                                        </div>
                                        </li>
                                        <li data-index="8" data-name="today_recommendation" class="list_item"
                                        style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                        <a class="thumb_goods">
                                            <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_5.png" alt="SALE" class="ico">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/goods/160868697126l0.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <span class="name">
                                                <a class="txt">
                                                    [퀸즈프레시] 프리미엄 샐러드 3종
                                                </a>
                                            </span>
                                            <span class="price">6,555원</span>
                                            <span class="cost">6,900원</span>
                                        </div>
                                        </li>
                                    </ul>
    
                                </div>
                                <!-- bx-viewport 끝 -->
                                <div class="bx_controls_direction">
                                <!-- 버튼을 누르면 오른쪽으로 1068px 만큼 이동, 끝에 닿으면 버튼 사라짐 -->
                                    <a class="bx-prev"><span class="blind">이전으로</span></a>
                                    <a class="bx-next"><span class="blind">이후로</span></a>
                                </div>
                            </div>
                        </div>
                            
                    </div>
                </div>
                <!-- class="main_type1" 끝 -->
            
                <!-- class ="main_type2" -->
                <div class="main_type2 bg">
                    <div class="main_event">
                        <div class="tit_goods">
                            <h3 class="tit">
                            <!-- 아이콘 있는 버전, h3에 링크 있음 -->
                                <a href="#" class="name">
                                    <span class="ico">자랑게시판</span>
                                </a>
                            </h3>
                        </div>
                        <div class="list_goods">
                            <ul data-title="자랑게시판" data-section="event" class="list_goods_ul">
                                <li>
                                    <li data-index="1">
                                        <a class="thumb_goods">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAF4AAABeCAQAAAAA22vlAAAAAXNSR0IArs4c6QAAACdJREFUeAHtwQENAAAAwiD7p34PBwwAAAAAAAAAAAAAAAAAAAAA4FpFZgABkfKClwAAAABJRU5ErkJggg==" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/main/3/pc_img_1611247553.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <div class="inner_info">
                                                <span class="name">
                                                    <a class="txt">화장지 최대 40% 할인</a>
                                                </span>
                                                <span class="desc"> 
                                                    <a class="txt">미리미리 쟁여두세요!</a>
                                                </span>
                                            </div>
                                        </div>
                                    </li>
                                </li>
                                <li>
                                    <li data-index="2">
                                        <a class="thumb_goods">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAF4AAABeCAQAAAAA22vlAAAAAXNSR0IArs4c6QAAACdJREFUeAHtwQENAAAAwiD7p34PBwwAAAAAAAAAAAAAAAAAAAAA4FpFZgABkfKClwAAAABJRU5ErkJggg==" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/main/3/pc_img_1611317260.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <div class="inner_info">
                                                <span class="name">
                                                    <a class="txt">종근당건강 최대 27% 할인</a>
                                                </span>
                                                <span class="desc"> 
                                                    <a class="txt">국민 유산균, 락토핏</a>
                                                </span>
                                            </div>
                                        </div>
                                    </li>
                                </li>
                                <li>
                                    <li data-index="3">
                                        <a class="thumb_goods">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAF4AAABeCAQAAAAA22vlAAAAAXNSR0IArs4c6QAAACdJREFUeAHtwQENAAAAwiD7p34PBwwAAAAAAAAAAAAAAAAAAAAA4FpFZgABkfKClwAAAABJRU5ErkJggg==" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/main/3/pc_img_1611553491.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <div class="inner_info">
                                                <span class="name">
                                                    <a class="txt">바스용품 최대 35% 할인</a>
                                                </span>
                                                <span class="desc"> 
                                                    <a class="txt">나만의 힐링타임</a>
                                                </span>
                                            </div>
                                        </div>
                                    </li>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- class ="main_type2" 끝 -->
    
                <!-- .main_type1 반복 -->
                <div class="main_type1">
                    <!-- type1:  -->
                        <div class="product_list">
                        <!-- 상품 추천 -->
                            <div class="tit_goods">
                                <h3 class="tit">
                                    <span class="name">
                                    이 레시피 어때요?
                                    </span>
                                    <!-- 아이콘 없는 버전, h3에 링크 없음 -->
                                </h3>
                            </div>
                            <!-- list_goods는 마켓컬리와 똑같이 html 파일에서 스타일함 -->
                            <div class="list_goods">
                                <div class="bx_wrapper" style="max-width: 1054px; margin: 0 auto;">
                                    <div class="vx-viewport" style="width: 100%; height: 506px; position: relative; overflow: hidden;">
                                        <!-- overflow: hidden 임시로 삭제 -->
                                        <ul data-title="이 레시피 어때요?" data-section="today_recommendation" class="list_goods_ul" 
                                        style="width: 2215%; position: relative; transition-duration: 0.5s; transform: translate3d(0, 0, 0);"> 
                                        <!--width: 2215%는 아직 뭔지 모르겠음  -->
                                        <!-- data-section과 data-name은 임시값 -->
        
                                        <!-- list data  -->
                                            <li data-index="1" data-name="today_recommendation" class="list_item"
                                            style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                            <a class="thumb_goods">
                                                <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_10.png" alt="SALE" class="ico">
                                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                                style="background-image: url('https://img-cf.kurly.com/shop/data/goods/1466488979157l0.jpg');">
                                                <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                            </a>
                                            <div class="info_goods">
                                                <span class="name">
                                                    <a class="txt">
                                                        [버크셔세상] 버크셔K 흑돼지 앞다리살 500g(냉장)
                                                    </a>
                                                </span>
                                                <span class="price">10,800원</span>
                                                <span class="cost">12,000원</span>
                                            </div>
                                            </li>
                                            <li data-index="2" data-name="today_recommendation" class="list_item"
                                            style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                            <a class="thumb_goods">
                                                <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_15.png" alt="SALE" class="ico">
                                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                                style="background-image: url('https://img-cf.kurly.com/shop/data/goods/1514257155111l0.jpg')">
                                                <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                            </a>
                                            <div class="info_goods">
                                                <span class="name">
                                                    <a class="txt">
                                                        이스라엘산 스위티 1개
                                                    </a>
                                                </span>
                                                <span class="price">1,870원</span>
                                                <span class="cost">2,200원</span>
                                            </div>
                                            </li>
                                            <li data-index="3" data-name="today_recommendation" class="list_item"
                                            style="float: left; position: relative; width: 249x; margin-right: 18px;">
                                            <a class="thumb_goods">
                                                <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_15.png" alt="SALE" class="ico">
                                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                                style="background-image: url('https://img-cf.kurly.com/shop/data/goods/1510134053904l0.jpg');">
                                                <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                            </a>
                                            <div class="info_goods">
                                                <span class="name">
                                                    <a class="txt">
                                                        [어부네] 생관자 2종(냉장)
                                                    </a>
                                                </span>
                                                <span class="price">7,310원</span>
                                                <span class="cost">8,600원</span>
                                            </div>
                                            </li>
                                            <li data-index="4" data-name="today_recommendation" class="list_item"
                                            style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                            <a class="thumb_goods">
                                                <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_5.png" alt="SALE" class="ico">
                                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                                style="background-image: url('https://img-cf.kurly.com/shop/data/goods/160868697126l0.jpg');">
                                                <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                            </a>
                                            <div class="info_goods">
                                                <span class="name">
                                                    <a class="txt">
                                                        [퀸즈프레시] 프리미엄 샐러드 3종
                                                    </a>
                                                </span>
                                                <span class="price">6,555원</span>
                                                <span class="cost">6,900원</span>
                                            </div>
                                            </li>
                                            <li data-index="5" data-name="today_recommendation" class="list_item"
                                            style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                            <a class="thumb_goods">
                                                <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_5.png" alt="SALE" class="ico">
                                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                                style="background-image: url('https://img-cf.kurly.com/shop/data/goods/160868697126l0.jpg');">
                                                <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                            </a>
                                            <div class="info_goods">
                                                <span class="name">
                                                    <a class="txt">
                                                        [퀸즈프레시] 프리미엄 샐러드 3종
                                                    </a>
                                                </span>
                                                <span class="price">6,555원</span>
                                                <span class="cost">6,900원</span>
                                            </div>
                                            </li>
                                            <li data-index="6" data-name="today_recommendation" class="list_item"
                                            style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                            <a class="thumb_goods">
                                                <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_5.png" alt="SALE" class="ico">
                                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                                style="background-image: url('https://img-cf.kurly.com/shop/data/goods/160868697126l0.jpg');">
                                                <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                            </a>
                                            <div class="info_goods">
                                                <span class="name">
                                                    <a class="txt">
                                                        [퀸즈프레시] 프리미엄 샐러드 3종
                                                    </a>
                                                </span>
                                                <span class="price">6,555원</span>
                                                <span class="cost">6,900원</span>
                                            </div>
                                            </li>
                                            <li data-index="7" data-name="today_recommendation" class="list_item"
                                            style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                            <a class="thumb_goods">
                                                <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_5.png" alt="SALE" class="ico">
                                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                                style="background-image: url('https://img-cf.kurly.com/shop/data/goods/160868697126l0.jpg');">
                                                <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                            </a>
                                            <div class="info_goods">
                                                <span class="name">
                                                    <a class="txt">
                                                        [퀸즈프레시] 프리미엄 샐러드 3종
                                                    </a>
                                                </span>
                                                <span class="price">6,555원</span>
                                                <span class="cost">6,900원</span>
                                            </div>
                                            </li>
                                            <li data-index="8" data-name="today_recommendation" class="list_item"
                                            style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                            <a class="thumb_goods">
                                                <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_5.png" alt="SALE" class="ico">
                                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                                style="background-image: url('https://img-cf.kurly.com/shop/data/goods/160868697126l0.jpg');">
                                                <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                            </a>
                                            <div class="info_goods">
                                                <span class="name">
                                                    <a class="txt">
                                                        [퀸즈프레시] 프리미엄 샐러드 3종
                                                    </a>
                                                </span>
                                                <span class="price">6,555원</span>
                                                <span class="cost">6,900원</span>
                                            </div>
                                            </li>
                                        </ul>
        
                                    </div>
                                    <!-- bx-viewport 끝 -->
                                    <div class="bx_controls_direction">
                                    <!-- 버튼을 누르면 오른쪽으로 1068px 만큼 이동, 끝에 닿으면 버튼 사라짐 -->
                                        <a class="bx-prev"><span class="blind">이전으로</span></a>
                                        <a class="bx-next"><span class="blind">이후로</span></a>
                                    </div>
                                </div>
                            </div>
                                
                        </div>
                </div>
                <!-- .main_type1 반복 끝-->
    
                <!-- .main_type2 반복-->
                <div class="main_type2 bg">
                    <div class="main_event">
                        <div class="tit_goods">
                            <h3 class="tit">
                            <!-- 아이콘 있는 버전, h3에 링크 있음 -->
                                <a href="#" class="name">
                                    <span class="ico">근처 마트</span>
                                </a>
                            </h3>
                        </div>
                        <div class="list_goods">
                            <ul data-title="근처 마트" data-section="event" class="list_goods_ul">
                                <li>
                                    <li data-index="1">
                                        <a class="thumb_goods">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAF4AAABeCAQAAAAA22vlAAAAAXNSR0IArs4c6QAAACdJREFUeAHtwQENAAAAwiD7p34PBwwAAAAAAAAAAAAAAAAAAAAA4FpFZgABkfKClwAAAABJRU5ErkJggg==" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/main/3/pc_img_1611247553.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <div class="inner_info">
                                                <span class="name">
                                                    <a class="txt">화장지 최대 40% 할인</a>
                                                </span>
                                                <span class="desc"> 
                                                    <a class="txt">미리미리 쟁여두세요!</a>
                                                </span>
                                            </div>
                                        </div>
                                    </li>
                                </li>
                                <li>
                                    <li data-index="2">
                                        <a class="thumb_goods">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAF4AAABeCAQAAAAA22vlAAAAAXNSR0IArs4c6QAAACdJREFUeAHtwQENAAAAwiD7p34PBwwAAAAAAAAAAAAAAAAAAAAA4FpFZgABkfKClwAAAABJRU5ErkJggg==" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/main/3/pc_img_1611317260.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <div class="inner_info">
                                                <span class="name">
                                                    <a class="txt">종근당건강 최대 27% 할인</a>
                                                </span>
                                                <span class="desc"> 
                                                    <a class="txt">국민 유산균, 락토핏</a>
                                                </span>
                                            </div>
                                        </div>
                                    </li>
                                </li>
                                <li>
                                    <li data-index="3">
                                        <a class="thumb_goods">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAF4AAABeCAQAAAAA22vlAAAAAXNSR0IArs4c6QAAACdJREFUeAHtwQENAAAAwiD7p34PBwwAAAAAAAAAAAAAAAAAAAAA4FpFZgABkfKClwAAAABJRU5ErkJggg==" alt="상품이미지" class="thumb"
                                            style="background-image: url('https://img-cf.kurly.com/shop/data/main/3/pc_img_1611553491.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                            <div class="inner_info">
                                                <span class="name">
                                                    <a class="txt">바스용품 최대 35% 할인</a>
                                                </span>
                                                <span class="desc"> 
                                                    <a class="txt">나만의 힐링타임</a>
                                                </span>
                                            </div>
                                        </div>
                                    </li>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- .main_type2 반복 끝-->
                

        <div id="footer">
            <div class="inner_footer">
                <div class="cc_footer">
                <!-- cc = company calls --> 
                    <h2 class="cc_tit">고객행복센터</h2>
                    <div class="cc_view cc_call">
                        <h3>
                            <span class="tit">1666-6666</span>
                        </h3>
                        <dl class="list">
                            <dt>365고객센터</dt>
                            <dd>오전 9시 - 오후 6시</dd>
                        </dl>
                    </div>
                    <div class="cc_view cc_kakao">
                        <h3>
                            <a href="#" class="tit">카카오톡 문의</a>
                        </h3>
                        <dl class="list">
                            <dt>365고객센터</dt>
                            <dd>오전 9시 - 오후 6시</dd>
                        </dl>
                    </div>
                    <div class="cc_view cc_qna">
                        <h3>
                            <a href="/qnaboard/list" class="tit">1:1 문의</a>
                        </h3>
                        <dl class="list">
                            <dt>24시간 접수 가능</dt>
                            <dd>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</dd>
                        </dl>
                    </div>
                </div>

                <div class="company_info">
                    <ul class="list">
                        <li>
                            <a href="#" class="link">이용약관</a>
                        </li>
                        <li>
                            <a href="#" class="link">개인정보처리방침</a>
                        </li>
                        <li>
                            <a href="#" class="link">이용안내</a>
                        </li>
                    </ul>
                    <div class="spec_info">
                        법인명 (상호) : 6조 냉장고를 부탁해
                        <span class="bar">I</span>
                        사업자등록번호 : 000-00-0000 
                        <a href="#" class="link">사업자정보확인</a><br>
                        통신판매업 : 제 2018-서울강남-00000 호
                        <span class="bar">I</span>
                        개인정보보호책임자 : 000 <br>
                        주소 : 서울시 도산대로 16길 20, 이래빌딩 B1 ~ 4F
                        <span class="bar">I</span>
                        대표이사 : 000 <br>
                        제휴문의 : <a href="#" class="link">6group@naver.com</a><br>
                        채용문의 : <a href="#" class="link">6group@naver.com</a><br>
                        팩스 : 000 - 0000 - 0000
                        <span class="bar">I</span>
                        이메일 : <a href="#" class="link">6group@naver.com</a><br>
                        <br>
                        <strong class="copy">© 6group CORP. ALL RIGHTS RESERVED</strong>
                        <ul class="sns">
                            <li>
                                <a href="#" class="link_sns insta" target="_blank">
                                    <img src="https://res.kurly.com/pc/ico/1810/ico_instagram.png" alt="냉장고를 부탁해 인스타그램 바로가기">
                                </a>
                                <!-- bg url 넣기 -->
                            </li>
                            <li>
                                <a href="#" class="link_sns fb" target="_blank">
                                    <img src="https://res.kurly.com/pc/ico/1810/ico_fb.png" alt="냉장고를 부탁해 페이스북 바로가기">
                                </a>
                            </li>
                            <li>
                                <a href="#" class="link_sns naver_blog" target="_blank">
                                    <img src="https://res.kurly.com/pc/ico/1810/ico_blog.png" alt="냉장고를 부탁해 네이버블로그 바로가기">
                                </a>
                            </li>
                            <li>
                                <a href="#" class="link_sns naver_post" target="_blank">
                                    <img src="https://res.kurly.com/pc/ico/1810/ico_naverpost.png" alt="냉장고를 부탁해 포스트 바로가기">
                                </a>
                            </li>
                            <li>
                                <a href="#" class="link_sns yt" target="_blank">
                                    <img src="https://res.kurly.com/pc/ico/1810/ico_youtube.png" alt="냉장고를 부탁해 유튜브 바로가기">
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="link_footer">
                <div class="authentication">
                    <a href="#" class="mark" target="_blank">
                        <img src="https://res.kurly.com/pc/ico/2001/logo_isms.png" alt="isms 로고" class="logo">
                        <p class="txt">
                            [인증범위] 냉장고를 부탁해 서비스 개발 · 운영<br>
                            [유효기간] 2019.04.01 ~ 2022.03.31
                        </p>
                    </a>
                    <a href="#" class="mark" target="_blank">
                        <img src="https://res.kurly.com/pc/ico/2001/logo_eprivacyplus.png" alt="eprivacy plus 로고" class="logo">
                        <p class="txt">
                            개인정보보호 우수 웹사이트 ·<br>
                            개인정보처리시스템 인증 (ePRIVACY PLUS)
                        </p>
                    </a>
                    <a href="#" class="lguplus mark" target="_blank">
                        <img src="https://res.kurly.com/pc/service/main/2009/logo_payments.png" alt="payments 로고" class="logo">
                        <p class="txt">
                            고객님의 안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에서 가입한<br>
                            토스 페이먼츠 구매안전(에스크로) 서비스를 이용하실 수 있습니다.
                        </p>
                    </a>
                </div>
            </div>
        </div>
        <!-- id="footer" -->

        
    </div>
</body>
</html>
