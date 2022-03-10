package com.woori.myhome.common;

import javax.servlet.http.HttpServletRequest;

//  <%=Pager.makeTag(request, 10, 32)%>


public class Pager {
		
	
	//<a href= .....
	public static String makeTag(HttpServletRequest request , int pageSize , int total) {
		
		//request 객체가 있어야 pg, key, keyword 등의 정보를 가져올 수 있다 
		//pageSize -  한 페이지당 출력할 데이터 개수 
		//total -  전체데이개수 
		//페이지숫자 - total/pageSize    12/10 -> 강제올림함수 ceil함수(1.2 -> 2
		
		String Tag = "" ; 
		String contextPath = request.getContextPath();
		
		// << < 1 2 3 4 5 6 7 8 9 10 > >> 
		
		int cpage; //현재페이지 정보 - board/list?pg=1  pg 값을   cpage로 처리한다
		// 12/10 -> ceiling(1.2) -> 2   
		int pageTotal; //전체 페이지 개수 
		int pageGroupSize = 5; //그룹의 개수 - 한 화면에 나타낼 페이지 최대 개수
		
		//1 ~ 5
		//6 ~ 10
		//11 ~ 15
		int pageGroupStart; //1,6,11,16,... 그룹의 시작값 
		int pageGroupEnd;   //5,10,15,....  그룹의 종료값

		String path="";
		//System.out.println(path);
		String beginLabel 	= "first";//image  태그
		String prevLabel 	= "previous"; 
		String nextLabel 	= "next";
		String endLabel 	= "last";	

		
		try {

			StringBuffer sb = new StringBuffer();
			
			//http://localhost:9000/MyHome/freeboard.do?pg=1
			
			String page = request.getParameter("pg"); // /board/list?pg=1
			page = ( page == null ) ? "0" : page;  //null값 처리  
			

			cpage = Integer.parseInt(page) ; 

			pageTotal = (int)Math.ceil((total - 1) / pageSize);
			//페지지 개수 : 전체 데이터 개수 123개 
			//한 페이지당 10개씩 : pageSize=10
			// 123/10 -> 12.3 =>  올림 => 13
            
			// 17 /5 - 3 *5  15    20 
			pageGroupStart = (int) (cpage / pageGroupSize) * pageGroupSize;
			pageGroupEnd = pageGroupStart + pageGroupSize;
			
		
			if (pageGroupEnd > pageTotal) {
				pageGroupEnd = pageTotal + 1;
			}
            //0~4, 5~9, 10~14, 15~19
				 
			boolean hasPreviousPage = cpage - pageGroupSize >= 0;
			//이전페이지로 갈게 있는가 여부  << < 1 2 3 4 5 > >>
			boolean hasNextPage = pageGroupStart + pageGroupSize < pageTotal;
			//다음페이지로 갈 수 있는가 여부 
			
			sb.append("<ul class='pagination justify-content-center'>\r\n") ;  
			
			//  <<  < 
			sb.append((cpage > 0) ? makeLink(0, beginLabel) : 
				"<li class=\"page-item\"><a class=\"page-link\"  href='#'>"+beginLabel+"</a></li>\r\n");
			sb.append(hasPreviousPage ? makeLink(pageGroupStart - 1, prevLabel) : 
				"<li class=\"page-item\"><a class=\"page-link\"  href='#'>"+prevLabel+"</a></li>\r\n");
			
			for (int i = pageGroupStart; i < pageGroupEnd; i++) {
				if (i == cpage) {//현재페이지
					sb.append(makeActiveLink(i, (i + 1) + ""));
				} else {
					sb.append(makeLink(i, (i + 1) + ""));
				}
			}
			

			sb.append(hasNextPage ? makeLink(pageGroupEnd, nextLabel) : 
				"<li class=\"page-item\"> <a class=\"page-link\" href='#'>"+nextLabel+"</a></li>\r\n");
			sb.append((cpage < pageTotal) ? makeLink(pageTotal, endLabel) : 
				"<li class=\"page-item\"><a class=\"page-link\"  href='#'>"+endLabel+"</a></li>\r\n");
		
			sb.append("</ul>\r\n") ;  		
			Tag = sb.toString() ; 	
		} catch ( Exception e ) {
			e.printStackTrace() ; 
		}
			
		return Tag ; 
	}

	public static String makeLink(int page, String label) 
	{
		StringBuffer tmp = new StringBuffer();
		tmp.append("<li class=\"page-item\"><a class=\"page-link\"  href=\"javascript:goPage('" + page + "')\">").append(label).append("</a></li>\r\n");
		return tmp.toString();
	}
	
	
	public static String makeActiveLink(int page, String label) 
	{
		StringBuffer tmp = new StringBuffer();
		tmp.append("<li class=\"page-item  active\"><a class=\"page-link\"  href=\"javascript:goPage('" + page + "')\">").append(label).append("</a></li>\r\n");
		return tmp.toString();
	}

	
}
