package com.woori.myhome.member;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller

public class MemberController {
	
	@Resource(name="memberService")
	MemberService memberService;
	
	@RequestMapping("/member/join")
	String member_register(Model model)
	{
		MemberDto dto = new MemberDto();
		model.addAttribute("memberDto", dto);
		return "member/member_register";
	}
	
	@RequestMapping("/member/myinfo")
	String member_myinfo(Model model, HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		
		String userid = (String)session.getAttribute("userid");
		if(userid==null)
			return "redirect:/member/login";
		
		MemberDto dto = new MemberDto();
		dto.setUser_id(userid);
		
		MemberDto resultDto = memberService.getInfo(dto);
		model.addAttribute("memberDto", resultDto);
		return "member/member_register";
	}
	
	
	@RequestMapping("/member/isDuplicate")
	@ResponseBody  //Ajax요청시 데이타가 출력되야 한다.jsp 이동을 막는다 
	               //자바객체를  json 형태로 전환시켜서 반환한다 
	public HashMap<String, String> member_isDuplicate(MemberDto dto)
	{
		System.out.println("userid : " + dto.getUser_id());
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("result", memberService.isDuplicate(dto)+"");
		
		return map;
	}
	
	
	@RequestMapping(value="/member/insert")
	@ResponseBody
	public HashMap<String, String> member_insert( MemberDto dto)
	{
		System.out.println("userid : " + dto.getUser_id());
		memberService.insert(dto);
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping(value="/member/login")
	public String member_login()
	{
		return "member/member_login";
	}
	

	@RequestMapping(value="/member/login_proc")
	@ResponseBody
	public HashMap<String, String> member_login_proc(MemberDto dto, HttpServletRequest request)
	{
		//각 페이지별로 정보 공유가 안된다. 
		//예외(쿠키 또는 세션- 세션을 사용한다.)
		//쿠키 - 본인컴퓨터에 session- 서버에(보안을 강화시키고자 할때(
		HttpSession session = request.getSession();
		
		MemberDto resultDto = memberService.getInfo(dto);
		HashMap<String, String> map = new HashMap<String, String>();
		
		System.out.println(resultDto);
		
		if(resultDto==null)
		{
			map.put("flag", "2");	
		}
		else
		{
			if(resultDto.getUser_password().equals(dto.getUser_password()))
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
	
	
	@RequestMapping(value="/member/logout")
	public String member_logout(HttpServletRequest request)
	{
	
		HttpSession session = request.getSession();
		session.invalidate(); //세션의 데이터 삭제 
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/member/findid")
	public String member_findid()
	{	
		return "member/member_findid";
	}
	
	@RequestMapping(value="/member/findpassword")
	public String member_findpassword()
	{	
		return "member/member_findpassword";
	}
	
	@RequestMapping(value="/member/findid_proc")
	@ResponseBody
	public HashMap<String, String> member_findid_proc(MemberDto dto)
	{	
		MemberDto findDto = memberService.findId(dto);
		HashMap map = new HashMap<String, String>();
		if (findDto==null)
			map.put("result", "fail");
		else
		{
			map.put("result", findDto.getUser_id());
			map.put("userid", findDto.getUser_id());
			map.put("username", findDto.getUser_name());
		}
		return map;
	}
	
	
	@RequestMapping(value="/member/findpass_proc")
	@ResponseBody
	public HashMap<String, String> member_findpass_proc(MemberDto dto)
	{	
		MemberDto findDto = memberService.findPassword(dto);
		HashMap map = new HashMap<String, String>();
		if (findDto==null)
			map.put("result", "fail");
		else
		{
			map.put("result", findDto.getUser_password());
			map.put("userid", findDto.getUser_id());
			map.put("username", findDto.getUser_name());
		}
		return map;
	}
	
	@RequestMapping(value="/member/update")
	@ResponseBody
	public HashMap<String, String> member_update(MemberDto dto)
	{	
		memberService.update(dto);
		HashMap map = new HashMap<String, String>();
		map.put("result", "success");	
		return map;
	}
	
}
