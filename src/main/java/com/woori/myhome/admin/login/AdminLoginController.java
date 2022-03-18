package com.woori.myhome.admin.login;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminLoginController {

   @Resource(name="adminLoginService")
   AdminLoginService loginService;
   
   @RequestMapping(value="/admin/login_proc")
   @ResponseBody
   public HashMap<String, String> admin_login_proc(AdminLoginDto dto, HttpServletRequest request)
   {
      //각 페이지별로 정보 공유가 안된다. 
      //예외(쿠키 또는 세션- 세션을 사용한다.)
      //쿠키 - 본인컴퓨터에 session- 서버에(보안을 강화시키고자 할때(
      HttpSession session = request.getSession();
      
      AdminLoginDto resultDto = loginService.getInfo(dto);
      HashMap<String, String> map = new HashMap<String, String>();
      
      System.out.println(resultDto);
      
      if(resultDto==null)
      {
         map.put("flag", "2");   
      }
      else
      {
         if(resultDto.getUser_level().equals("1")) {
            map.put("flag", "7");
         }         
         else if(resultDto.getUser_password().equals(dto.getUser_password()))
         {
            map.put("flag", "1"); //로그온 성공시 세션에 정보를 저장한다 
            session.setAttribute("userid", resultDto.getUser_id());
            session.setAttribute("username", resultDto.getUser_name());
            session.setAttribute("email", resultDto.getUser_mail());
            session.setAttribute("phone", resultDto.getUser_phone());
            session.setAttribute("level", resultDto.getUser_level());
         }
         else
         {
            map.put("flag", "3");
         }
      }
      
      
      return map;
   }
   
   @RequestMapping(value="/admin/logout")
   public String member_logout(HttpServletRequest request)
   {
   
      HttpSession session = request.getSession();
      session.invalidate(); //세션의 데이터 삭제 
      
      return "redirect:/admin";
   }
}