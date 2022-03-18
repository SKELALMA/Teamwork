package com.woori.myhome.admin.member;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class AdminMemberController {
	@Resource(name="AdminmemberService")
	AdminMemberService service;
	
	@RequestMapping("/admin/member/list")
	
	String adminmember_list(Model model, AdminMemberDto dto) {
	
		List<AdminMemberDto> list = service.getList(dto);

		
		System.out.println("list: " + list);

		model.addAttribute("memberlist", list);
		

		return "admin/admin_member/admin_member_list";
	}
	
	@RequestMapping(value="/admin/member/update")
	@ResponseBody
	HashMap<String, String> adminmember_updateActive(AdminMemberDto dto)
	{
		
		service.updateactive(dto);
	
		AdminMemberDto resDto = service.getView(dto);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", resDto.getUser_active());
		return map; 
	}	
	
}
