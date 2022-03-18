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
	
//	@RequestMapping(value="/board/delete")
//	String board_delete(BoardDto dto)
//	{
//		service.delete(dto.getId());
//		
//		return "redirect:/board/list";  //글쓰고나면
//	}
//	
//	@RequestMapping(value="/board/modify")
//	String board_modify(BoardDto dto, Model model) {
//		
//		model.addAttribute("boardDto", service.getView(dto.getId()) );
//		
//		return "board/board_write"; //write.jsp로 이동한다
//	}
//	
//	@RequestMapping(value="/comment/write")
//	@ResponseBody
//	HashMap<String, String> comment_write(CommentDto dto) {
//		
//		System.out.println("comment_id : " + dto.getComment_id());
//		if( dto.getComment_id().equals(""))
//			service.comment_insert(dto);
//		else
//			service.comment_update(dto);
//		
//		HashMap<String, String> map = new HashMap<String, String>();
//		map.put("result", "success");
//		
//		return map;
//	}
//	
//	@RequestMapping(value="/comment/list")
//	@ResponseBody
//	List<CommentDto> comment_list(CommentDto dto) {
//		
//		System.out.println("board_id : " + dto.getBoard_id());
//		List<CommentDto> list = service.getCommentList(dto);		
//		return list;
//	}
//	
//	@RequestMapping(value="/comment/getView")
//	@ResponseBody
//	CommentDto comment_getView(CommentDto dto) {
//		
//		System.out.println("id : " + dto.getId());
//		CommentDto resultDto = service.getCommentView(dto);		
//		return resultDto;
//	}
//	
//	@RequestMapping(value="/comment/update")
//	@ResponseBody
//	HashMap<String, String> comment_update(CommentDto dto) {
//		
//		service.comment_update(dto);
//		
//		HashMap<String, String> map = new HashMap<String, String>();
//		map.put("result", "success");
//		
//		return map;
//	}
//	
//	@RequestMapping(value="/comment/delete")
//	@ResponseBody
//	HashMap<String, String> comment_delete(CommentDto dto) {
//		
//		service.comment_delete(dto);
//		
//		HashMap<String, String> map = new HashMap<String, String>();
//		map.put("result", "success");
//		
//		return map;
//	}
	
	
	
}
