<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.woori.myhome.common.*" %>


<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
/* reset */
html,body{width:100%;height:100%;}
body,input,textarea,select,button,table{font-family:'Noto Sans KR','맑은고딕','Malgun Gothic','돋움',Dotum,Helvetica,sans-serif;}
body,p,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,table,th,td,form,fieldset,legend,input,textarea,button,select{margin:0;padding:0;font-weight:normal;}
body,input,textarea,select,button,table,h1,h2,h3,h4,h5{font-size:15px;}
body{position:relative;color:#000}
table{border-collapse:collapse}
img,fieldset{border:0}
img{vertical-align:top;}
ul,ol{list-style:none}
em,address{font-style:normal}
a{color:inherit;text-decoration:none}
a:hover{text-decoration:underline;}

/* layout */
#wrap{}
#header{position:relative;width:100%;height:55px;padding:0 10px;overflow:hidden;background:#09F;box-sizing:border-box;}
#container{position:absolute;top:55px;bottom:31px;width:100%;}
#aside{position:absolute;left:0;top:0;bottom:0;width:220px;padding:10px;overflow:auto;box-sizing:border-box;border-right:1px solid #ddd;background:#fff;}
#content{position:absolute;top:0;bottom:0;left:220px;right:0;padding:10px;overflow:auto;}
#footer{position:absolute;left:0;bottom:0;width:100%;height:30px;border-top:1px solid #ddd;}

/* common */
.skip-navi{position:absolute;top:0;left:0;z-index:100;}
.skip-navi a{position:absolute;top:-1000em;left:0;width:200px;padding:5px 0;text-align:center;font-weight:bold;background:black;color:white;}
.skip-navi a:hover, .skip-navi a:active, .skip-navi a:focus{display:inline-block;top:0;}

/* header */
.gnb-wrap{position:relative;width:100%;height:55px;line-height:55px;}
.gnb-tit{position:absolute;top:0;left:0;font-weight:bold;color:#FFF;}
.gnb-tit .home{display:inline-block;font-size:24px;margin:0 10px 0 0;font-weight:bold;}
.gnb-tit .local{display:inline-block;font-size:18px;font-weight:bold;}
.gnb-menu{overflow:hidden;position:absolute;top:0;right:0;}
.gnb-menu .mn{float:left;padding:0 10px;text-align:center;color:#FFF;}

/* content */
.content{}

/* footer */
.ft-copy{text-align:center;font-size:11px;font-family:tahoma;color:#666;line-height:30px;}

</style>

<%
request.setAttribute("commonURL", request.getContextPath());

String userid=StringUtil.nullToValue(session.getAttribute("userid"), "");
String username=StringUtil.nullToValue(session.getAttribute("username"), "");
String email=StringUtil.nullToValue(session.getAttribute("email"), "");
String phone=StringUtil.nullToValue(session.getAttribute("phone"), "");
%>
<meta charset="UTF-8">

<div id="wrap">
	<div id="header">
		<div class="gnb-wrap">
			<div class="gnb-tit">
				<h1 class="home"><a href="<%=request.getContextPath() %>/admin/main">관리자 페이지</a></h1>
				<h2 class="local"><a href="<%=request.getContextPath() %>">유저 페이지</a></h2>
			</div>
			<div class="gnb-menu">
				<ul>
					<li class="mn"><a href="<%=request.getContextPath() %>/admin/logout">로그아웃</a></li>				
				</ul>
			</div>
		</div><!-- //.gnb-wrap -->
	</div><!-- //#header -->

	<div id="container">
		<div id="aside">
			<div class="aside-menu">
				<ul>
					<li class="mn"><a href="<%=request.getContextPath() %>/admin/member/list">회원관리</a></li>
					<li class="mn"><a href="<%=request.getContextPath() %>/admin/gallery/list">자랑게시판</a></li>
					<li class="mn"><a href="<%=request.getContextPath() %>/admin/receipe/list">레시피게시판</a></li>
					<li class="mn"><a href="<%=request.getContextPath() %>/admin/qnaboard/list">QnA</a></li>
					<li class="mn"><a href="<%=request.getContextPath() %>/admin/noticeboard/list">공지사항</a></li>				
				</ul>
			</div>
			
		</div><!-- //#aside -->
		<div id="content" class="">
			
		
<!-- 	<div id="footer"> -->
<!-- 		<div class="ft-copy">copyright &copy; <a href="http://asrahi.me"><em>ASRAHI</em></a>. MIT license.</div> -->
<!-- 	</div>//#footer -->
