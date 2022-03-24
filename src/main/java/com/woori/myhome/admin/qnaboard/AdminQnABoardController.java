package com.woori.myhome.admin.qnaboard;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woori.myhome.comment.CommentDto;
import com.woori.myhome.qnaboard.QnABoardDto;

@Controller
public class AdminQnABoardController {

	@Resource(name="adminQnABoardServcie")
	AdminQnABoardService service;
	
	@RequestMapping(value="/admin/qnaboard/list", method=RequestMethod.GET)
	String qnaBoard_list(AdminQnABoardDto dto, Model model) {
		
		dto.setStart( dto.getPg()*dto.getPageSize() );
		
		model.addAttribute("qnaBoardList", service.getList(dto));
		model.addAttribute("totalCnt", service.getTotal(dto));
		return "admin/admin_qnaboard/admin_qnaboard_list";
	}
	
	@RequestMapping(value="/admin/qnaboard/view", method=RequestMethod.GET)
	String qnaBoard_view(AdminQnABoardDto dto, Model model) {
		
		AdminQnABoardDto resultDto = service.getView(dto);
		service.cntHit(resultDto);
		model.addAttribute("qnaboardDto", resultDto);
		
		return "/qnaboard/qnaboard_view";
	}
	
	@RequestMapping(value="/admin/qnaboard/write", method=RequestMethod.GET)
	String qnaBoard_write(Model model) {
		
		AdminQnABoardDto dto = new AdminQnABoardDto();
		model.addAttribute("qnaboardDto", dto);
		model.addAttribute("mode", "insert");
		
		return "/qnaboard/qnaboard_write";
	}
	
	@RequestMapping(value="/admin/qnaboard/save", method=RequestMethod.POST)
	@ResponseBody
	HashMap<String, String> qnaBoard_save(AdminQnABoardDto dto, String mode) {
		
		System.out.println(dto.getQna_group_id());
		System.out.println(mode);
		
//		if(dto.getQna_group_id()==0)
//			service.insert(dto);
//		else
//			service.insert_reply(dto);
		
		if(mode.equals("insert")) {
			service.insert(dto);
			System.out.println("*************************************************************");
			System.out.println("New board is written and inserted successfully");
		}
		else if(mode.equals("reply")) {
			service.insert_reply(dto);
			System.out.println("*************************************************************");
			System.out.println("Reply board is written and inserted successfully");
		}
		else if(mode.equals("modi")) {
			service.update(dto);
			System.out.println("*************************************************************");
			System.out.println("Board is modified successfully");
		}
		else {
			System.out.println("*************************************************************");
			System.out.println("Error is dedected at QnABoardController's save url. User can't write board now");
		}
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping(value="/admin/qnaboard/reply")
	String qnaBoard_reply(AdminQnABoardDto paramDto, Model model) {
		
		AdminQnABoardDto dto = service.getView(paramDto);
		
//		dto.setTitle("Re:" + dto.getTitle());
		dto.setQna_id("");
		dto.setQna_comment("");
		
		model.addAttribute("qnaboardDto", dto);
		model.addAttribute("mode", "reply");
		return "/qnaboard/qnaboard_write";
	}
	
	@RequestMapping(value="/admin/qnaboard/delete")
	String board_delete(AdminQnABoardDto dto)
	{

		System.out.println("qna_id : "+dto.getQna_id());
		service.delete(dto);
		
		return "redirect:/admin/qnaboard/list";  //글쓰고나면
	}
	
	@RequestMapping(value="/admin/qnaboard/modify")
	String board_modify(AdminQnABoardDto dto, Model model) {
		
		model.addAttribute("qnaboardDto", service.getView(dto) );
		model.addAttribute("mode", "modi");
		
		return "qnaboard/qnaboard_write"; //write.jsp로 이동한다
	}
	
	

}
