package com.woori.myhome.admin.ReceipeBoard;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.woori.myhome.common.FileUploadUtil;
import com.woori.myhome.comment.CommentDto;

@Controller
public class AdminReceipeBoardController {
	@Resource(name = "adminReceipeboardService")
	AdminReceipeBoardService service;

	
	@RequestMapping("/admin/receipe/list")
	String receipe_list(Model model, AdminReceipeBoardDto dto) {
		System.out.println("[controller] receipe_list");
		dto.setPageSize(12);
		dto.setStart(dto.getPg() * dto.getPageSize());

		List<AdminReceipeBoardDto> list = service.getList(dto);

		System.out.println("list: " + list);

		int cnt = service.getTotal(dto);

		model.addAttribute("receipeList", list);
		model.addAttribute("totalCnt", cnt);

		return "admin/admin_ReceipeBoard/admin_receipe_list";
	}

	@RequestMapping("/admin/receipe/write")
	String receipe_write(Model model, AdminReceipeBoardDto paramDto) {
		System.out.println("receipe_write : " + paramDto);
		

		if (paramDto.getId().equals("")) {
			model.addAttribute("receipeDto", new AdminReceipeBoardDto());
		} else
			model.addAttribute("receipeDto", service.getView(paramDto));

		return "ReceipeBoard/receipe_write";
	}

	
	@RequestMapping("/admin/receipe/save")
	String receipe_save(AdminReceipeBoardDto dto, String upload) {

		//List<MultipartFile> multiList = new ArrayList<MultipartFile>();

		//System.out.println("-------------------->: " + multi.getFile("upload").getOriginalFilename());
		//multiList.add(multi.getFile("upload"));
		//List<String> fileNameList = new ArrayList<String>();

		//String path = req.getServletContext().getRealPath("/");
		//FileUploadUtil.upload(path, multiList, fileNameList);
		
		
		System.out.println("--------------------"+ upload);
		
		if (!upload.isBlank()) {
			dto.setImage(upload);
			System.out.println("占쎈솁占쎌뵬占쎌뵠�뵳占� : " + upload);
		} else
			dto.setImage("default.jpg");

		if (dto.getId().equals(""))
			service.insert(dto);
		else
			service.update(dto);
		return "redirect:/receipe/list";

	}

//	
	@RequestMapping("/admin/receipe/view")
	String receipe_view(AdminReceipeBoardDto dto, Model model) {
		AdminReceipeBoardDto resultDto = service.getView(dto);
		service.updateView(dto);
		
		model.addAttribute("receipeDto", resultDto);

		return "ReceipeBoard/receipe_view";
	}

	@RequestMapping("/admin/receipe/delete")
	String receipe_delete(AdminReceipeBoardDto dto) {

		service.delete(dto);

		return "redirect:/receipe/list";
	}
	

	@RequestMapping(value = "/admin/receipe/modify")
	String gallery_modify(AdminReceipeBoardDto dto, Model model) {
		System.out.println("-------------------modify");

		AdminReceipeBoardDto resultDto = service.getView(dto);
		model.addAttribute("receipeDto", resultDto);
					
		return "ReceipeBoard/receipe_write";
	}
	
//
////	@ResponseBody // json 占쎌굨占쎈뻼 �뵳�뗪쉘
////	@RequestMapping(value = "/ck/fileupload3", method = { RequestMethod.POST, RequestMethod.GET })
////	public String fileUpload(AdminReceipeBoardDto dto, HttpServletRequest req, MultipartHttpServletRequest multi) {
////
////		List<MultipartFile> multiList = new ArrayList<MultipartFile>();
////		multiList.add(multi.getFile("upload"));
////		System.out.println("-------------------->ck占쎈퓠占쎈탵占쎄숲: " + multi.getFile("upload").getOriginalFilename());
////		List<String> fileNameList = new ArrayList<String>();
////
////		String path = req.getServletContext().getRealPath("/");
////		System.out.println("�눧�눖�봺占쎌읅占쎌맄燁살꼵而� : " + path);
////
////		// 占쎈뼄占쎌젫 占쎈솁占쎌뵬占쎌뵠 占쎈씜嚥≪뮆諭� 占쎈┷占쎈뮉 �겫占썽겫占�   //url 占쎌뵠 �겫占썽겫占� 
////		FileUploadUtil.upload(path, multiList, fileNameList);
////		
////		System.out.println("{ \"uploaded\" : true, \"url\" : \"http://localhost:8080/myhome/upload/"
////				+ fileNameList.get(0) + "\" }");
////		String url = "{ \"uploaded\" : true, \"url\" : \"http://localhost:8080/myhome/upload/" + fileNameList.get(0) + "\" }";
////	
////		return url;
////	}

	
//**************
//	
//	@RequestMapping(value="/admin/receipe/comment/write")
//	@ResponseBody
//	HashMap<String, String> comment_write(CommentDto dto)
//	{
//		System.out.println("comment_id : " + dto.getComment_id());
////		if( dto.getComment_id().equals(""))
////			service.comment_insert(dto);
////		else
////			service.comment_update(dto);
//		
//		service.comment_insert(dto);
//		HashMap<String, String>map = new HashMap<String, String>();
//		map.put("result", "success");
//		return map; 
//	}
//	
//	@RequestMapping(value="/admin/receipe/comment/list")
//	@ResponseBody
//	List<CommentDto> comment_list(CommentDto dto)
//	{
//		System.out.println("board_id : " + dto.getComment_board_id());
//		List<CommentDto> list = service.getCommentList(dto);
//		return list; 
//	}
//	
//	
//	@RequestMapping(value="/admin/receipe/comment/getView")
//	@ResponseBody
//	CommentDto comment_getView(CommentDto dto)
//	{
//		System.out.println("id : " + dto.getComment_id());
//		CommentDto resultDto = service.getCommentView(dto);
//		return resultDto; 
//	}
//	
//	@RequestMapping(value="/admin/receipe/comment/update")
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
//	@RequestMapping(value="/admin/receipe/comment/delete")
//	@ResponseBody
//	HashMap<String, String> comment_delete(CommentDto dto)
//	{
//		service.comment_delete(dto);
//		
//		HashMap<String, String>map = new HashMap<String, String>();
//		map.put("result", "success");
//		return map; 
//	}	
//	
}
