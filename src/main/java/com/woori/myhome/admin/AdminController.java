package com.woori.myhome.admin;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {

   @RequestMapping(value="/admin")
   String admin_login() {
      
      return "/admin/admin_login";
   }
   
   @RequestMapping(value="/admin/main")
   String admin_main() {
      
      return "/admin/admin_main";
   }
   
}