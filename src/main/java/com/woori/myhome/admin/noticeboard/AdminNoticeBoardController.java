package com.woori.myhome.admin.noticeboard;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminNoticeBoardController {

	@Resource(name="adminNoticeBoardService")
	AdminNoticeBoardService service;
	
	@RequestMapping(value="/admin/noticeboard/list", method=RequestMethod.GET)
	String noticeBoard_getList(AdminNoticeBoardDto dto, Model model) {
		
		dto.setStart( dto.getPg()*dto.getPageSize() );
		
		model.addAttribute("noticeBoardList", service.getList(dto));
		model.addAttribute("totalCnt", service.getTotal(dto));
		
		return "admin/admin_noticeboard/admin_noticeboard_list";
	}
	
	
	//  /noticeboard/view?id=1
	@RequestMapping(value="/admin/noticeboard/view", method=RequestMethod.GET)
	String noticeboard_view(AdminNoticeBoardDto dto, Model model)
	{
		AdminNoticeBoardDto resultdto = service.getView(dto);
		model.addAttribute("noticeBoardDto", resultdto);
		return "/noticeboard/noticeboard_view";
	}
	
	
	@RequestMapping(value="/admin/noticeboard/write", method=RequestMethod.GET)
	String noticeboard_write(Model model)
	{
		model.addAttribute("noticeBoardDto", new AdminNoticeBoardDto());   //if문 안쓰고 코드 단순하게 만들려고
		
		return "/noticeboard/noticeboard_write";
	}
	
	@RequestMapping(value="/admin/noticeboard/save", method=RequestMethod.GET)
	String noticeboard_save(AdminNoticeBoardDto dto)
	{
//		if( dto.getId().equals(""))
//			service.insert(dto);
//		else
//			service.update(dto);
		
		service.insert(dto);
		
		return "redirect:admin/noticeboard/list";  //글쓰고나면
	}
	
	@RequestMapping(value="/admin/noticeboard/delete")
	String noticeboard_delete(AdminNoticeBoardDto dto)
	{
		System.out.println("아이디 : "+dto.getNotice_id());
		service.delete(dto);
		
		return "redirect:/admin/noticeboard/list";  //글쓰고나면
	}
	


	
	
}
