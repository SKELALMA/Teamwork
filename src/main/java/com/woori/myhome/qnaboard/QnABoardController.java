package com.woori.myhome.qnaboard;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woori.myhome.comment.CommentDto;

@Controller
public class QnABoardController {

	@Resource(name="qnaBoardService")
	QnABoardService service;
	
	@RequestMapping(value="/qnaboard/list", method=RequestMethod.GET)
	String qnaBoard_list(QnABoardDto dto, Model model) {
		
		dto.setStart( dto.getPg()*dto.getPageSize() );
		
		model.addAttribute("qnaBoardList", service.getList(dto));
		model.addAttribute("totalCnt", service.getTotal(dto));
		return "qnaboard/qnaboard_list";
	}
	
	@RequestMapping(value="/qnaboard/view", method=RequestMethod.GET)
	String qnaBoard_view(QnABoardDto dto, Model model) {
		
		QnABoardDto resultDto = service.getView(dto);
		service.cntHit(resultDto);
		model.addAttribute("qnaboardDto", resultDto);
		
		return "/qnaboard/qnaboard_view";
	}
	
	@RequestMapping(value="/qnaboard/write", method=RequestMethod.GET)
	String qnaBoard_write(Model model) {
		
		QnABoardDto dto = new QnABoardDto();
		model.addAttribute("qnaboardDto", dto);
		model.addAttribute("mode", "insert");
		
		return "/qnaboard/qnaboard_write";
	}
	
	@RequestMapping(value="/qnaboard/save", method=RequestMethod.POST)
	@ResponseBody
	HashMap<String, String> qnaBoard_save(QnABoardDto dto, String mode) {
		
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
	
	@RequestMapping(value="/qnaboard/reply")
	String qnaBoard_reply(QnABoardDto paramDto, Model model) {
		
		QnABoardDto dto = service.getView(paramDto);
		
//		dto.setTitle("Re:" + dto.getTitle());
		dto.setQna_id("");
		dto.setQna_comment("");
		
		model.addAttribute("qnaboardDto", dto);
		model.addAttribute("mode", "reply");
		return "/qnaboard/qnaboard_write";
	}
	
	@RequestMapping(value="/qnaboard/delete")
	String board_delete(QnABoardDto dto)
	{
		service.delete(dto);
		
		return "redirect:/qnaboard/list";  //湲��벐怨좊굹硫�
	}
	
	@RequestMapping(value="/qnaboard/modify")
	String board_modify(QnABoardDto dto, Model model) {
		
		model.addAttribute("qnaboardDto", service.getView(dto) );
		model.addAttribute("mode", "modi");
		
		return "qnaboard/qnaboard_write"; //write.jsp濡� �씠�룞�븳�떎
	}
	
	
//	@RequestMapping(value="/comment/write")
//	@ResponseBody
//	HashMap<String, String> comment_write(CommentDto dto) {
//		
//		System.out.println("comment_id : " + dto.getComment_id());
////		if( dto.getComment_id().equals(""))
////			service.comment_insert(dto);
////		else
////			service.comment_update(dto);
//		
//		service.comment_insert(dto);
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
//		System.out.println("board_id : " + dto.getComment_board_id());
//		List<CommentDto> list = service.getCommentList(dto);		
//		return list;
//	}
//	
//	@RequestMapping(value="/comment/getView")
//	@ResponseBody
//	CommentDto comment_getView(CommentDto dto) {
//		
//		System.out.println("id : " + dto.getComment_id());
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
