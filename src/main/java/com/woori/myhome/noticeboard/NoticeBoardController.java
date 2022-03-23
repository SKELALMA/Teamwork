package com.woori.myhome.noticeboard;

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
public class NoticeBoardController {

   @Resource(name="noticeBoardService")
   NoticeBoardService service;
   
   @RequestMapping("noticeboard/list")
   String noticeBoard_getList(NoticeBoardDto dto, Model model) {
      
      dto.setStart( dto.getPg()*dto.getPageSize() );
      
      model.addAttribute("noticeBoardList", service.getList(dto));
      model.addAttribute("totalCnt", service.getTotal(dto));
      
      return "noticeboard/noticeboard_list";
   }
   
   
   //  /noticeboard/view?id=1
   @RequestMapping(value="/noticeboard/view", method=RequestMethod.GET)
   String noticeboard_view(NoticeBoardDto dto, Model model)
   {
      service.hit(dto);
      NoticeBoardDto resultdto = service.getView(dto);
      model.addAttribute("noticeBoardDto", resultdto);
      return "noticeboard/noticeboard_view";
   }
   
   
   @RequestMapping(value="/noticeboard/write")
   String noticeboard_write(Model model,NoticeBoardDto dto)
   {
      model.addAttribute("noticeBoardDto", dto);   //if문 안쓰고 코드 단순하게 만들려고
      
      return "noticeboard/noticeboard_write";
   }
   
   @RequestMapping(value="/noticeboard/save")
   String noticeboard_save(NoticeBoardDto dto)
   {
      System.out.println("tewtwetewwetwe"+dto.getNotice_id());
      if( dto.getNotice_id().equals(""))
         service.insert(dto);
      else
         service.update(dto);
      
//      service.insert(dto);
      
      return "redirect:/noticeboard/list";  //글쓰고나면
   }
   
   @RequestMapping(value="/noticeboard/delete")
   String board_delete(NoticeBoardDto dto)
   {
      service.delete(dto);
      
      return "redirect:/noticeboard/list";  //글쓰고나면
   }
   
   @RequestMapping(value="/noticeboard/modify")
   String board_modify(NoticeBoardDto dto, Model model) {
      
      model.addAttribute("noticeBoardDto", service.getView(dto) );
      
      return "noticeboard/noticeboard_write"; //write.jsp로 이동한다
   }
   
   
   // 댓글@@@@@@@@@@@@@@@@@@@@@@@@@@
   @RequestMapping(value="/noticeboard/comment/write")
   @ResponseBody
   HashMap<String, String> comment_write(CommentDto dto) {

      dto.setComment_board_loc("4");
      System.out.println("comment_id : " + dto.getComment_id());
//      if( dto.getComment_id().equals(""))
//         service.comment_insert(dto);
//      else
//         service.comment_update(dto);
      service.comment_insert(dto);
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("result", "success");
      
      return map;
   }
   
   @RequestMapping(value="/noticeboard/comment/list")
   @ResponseBody
   List<CommentDto> comment_list(CommentDto dto) {
      
      dto.setComment_board_loc("4");
      System.out.println("board_id : " + dto.getComment_board_id());
      List<CommentDto> list = service.getCommentList(dto);      
      return list;
   }
   
   @RequestMapping(value="/noticeboard/comment/getView")
   @ResponseBody
   CommentDto comment_getView(CommentDto dto) {
      
      System.out.println("id : " + dto.getComment_board_id());
      CommentDto resultDto = service.getCommentView(dto);      
      return resultDto;
   }
   
   @RequestMapping(value="/noticeboard/comment/update")
   @ResponseBody
   HashMap<String, String> comment_update(CommentDto dto) {
      
      service.comment_update(dto);
      
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("result", "success");
      
      return map;
   }
   
   @RequestMapping(value="/noticeboard/comment/delete")
   @ResponseBody
   HashMap<String, String> comment_delete(CommentDto dto) {
      
      service.comment_delete(dto);
      
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("result", "success");
      
      return map;
   }
   
   
   
}