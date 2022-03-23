package com.woori.myhome.ReceipeBoard;

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
public class ReceipeBoardController {
	@Resource(name = "ReceipeboardService")
	ReceipeBoardService service;

	
	@RequestMapping("/receipe/list")
	String receipe_list(Model model, ReceipeBoardDto dto) {
		System.out.println("[controller] receipe_list");
		dto.setPageSize(12);
		dto.setStart(dto.getPg() * dto.getPageSize());

		List<ReceipeBoardDto> list = service.getList(dto);

		System.out.println("list: " + list);

		int cnt = service.getTotal(dto);

		model.addAttribute("receipeList", list);
		model.addAttribute("totalCnt", cnt);

		return "ReceipeBoard/receipe_list";
	}
	
	//�븳�떇 �젅�떆�뵾 媛��졇�삤湲�
	@RequestMapping("/receipe/list/kfood")
	String receipe_kfood_list(Model model, ReceipeBoardDto dto) {
		System.out.println("[controller] receipe_list");
		dto.setPageSize(12);
		dto.setStart(dto.getPg() * dto.getPageSize());
		dto.setCategory("한식");
		
		List<ReceipeBoardDto> list = service.getKFoodList(dto);
	
		System.out.println("list: " + list);

		int cnt = service.getTotal(dto);

		model.addAttribute("receipeList", list);
		model.addAttribute("totalCnt", cnt);

		return "ReceipeBoard/receipe_list";
	}
	
	//以묒떇 �젅�떆�뵾 媛��졇�삤湲�
	@RequestMapping("/receipe/list/china")
	String receipe_Cfood_list(Model model, ReceipeBoardDto dto) {
		System.out.println("[controller] receipe_list");
		dto.setPageSize(12);
		dto.setStart(dto.getPg() * dto.getPageSize());
		dto.setCategory("중식");
		
		List<ReceipeBoardDto> list = service.getKFoodList(dto);
	
		System.out.println("list: " + list);

		int cnt = service.getTotal(dto);

		model.addAttribute("receipeList", list);
		model.addAttribute("totalCnt", cnt);

		return "ReceipeBoard/receipe_list";
	}
	//�씪�떇 �젅�떆�뵾 媛��졇�삤湲�
	@RequestMapping("/receipe/list/japan")
	String receipe_Jfood_list(Model model, ReceipeBoardDto dto) {
		System.out.println("[controller] receipe_list");
		dto.setPageSize(12);
		dto.setStart(dto.getPg() * dto.getPageSize());
		dto.setCategory("일식");
		
		List<ReceipeBoardDto> list = service.getKFoodList(dto);
	
		System.out.println("list: " + list);

		int cnt = service.getTotal(dto);

		model.addAttribute("receipeList", list);
		model.addAttribute("totalCnt", cnt);

		return "ReceipeBoard/receipe_list";
	}
	//�뼇�떇 �젅�떆�뵾 媛��졇�삤湲�
	@RequestMapping("/receipe/list/west")
	String receipe_Wfood_list(Model model, ReceipeBoardDto dto) {
		System.out.println("[controller] receipe_list");
		dto.setPageSize(12);
		dto.setStart(dto.getPg() * dto.getPageSize());
		dto.setCategory("양식");
		
		List<ReceipeBoardDto> list = service.getKFoodList(dto);
	
		System.out.println("list: " + list);

		int cnt = service.getTotal(dto);

		model.addAttribute("receipeList", list);
		model.addAttribute("totalCnt", cnt);

		return "ReceipeBoard/receipe_list";
	}
	
	@RequestMapping("/receipe/write")
	String receipe_write(Model model, ReceipeBoardDto paramDto) {
		System.out.println("receipe_write : " + paramDto);
		

		if (paramDto.getId().equals("")) {
			model.addAttribute("receipeDto", new ReceipeBoardDto());
		} else
			model.addAttribute("receipeDto", service.getView(paramDto));

		return "ReceipeBoard/receipe_write";
	}

	
	@RequestMapping("/receipe/save")
	String receipe_save(ReceipeBoardDto dto, String upload) {

		//List<MultipartFile> multiList = new ArrayList<MultipartFile>();

		//System.out.println("-------------------->: " + multi.getFile("upload").getOriginalFilename());
		//multiList.add(multi.getFile("upload"));
		//List<String> fileNameList = new ArrayList<String>();

		//String path = req.getServletContext().getRealPath("/");
		//FileUploadUtil.upload(path, multiList, fileNameList);
		
		
		System.out.println("--------------------"+ upload);
		
		if (!upload.isBlank()) {
			dto.setImage(upload);
		} else
			dto.setImage("default.jpg");

		if (dto.getId().equals(""))
			service.insert(dto);
		else
			service.update(dto);
		return "redirect:/receipe/list";

	}

//	
	@RequestMapping("/receipe/view")
	String receipe_view(ReceipeBoardDto dto, Model model) {
		ReceipeBoardDto resultDto = service.getView(dto);
		service.updateView(dto);
		
		model.addAttribute("receipeDto", resultDto);

		return "ReceipeBoard/receipe_view";
	}

	@RequestMapping("/receipe/delete")
	String receipe_delete(ReceipeBoardDto dto) {

		service.delete(dto);

		return "redirect:/receipe/list";
	}
	

	@RequestMapping(value = "/receipe/modify")
	String gallery_modify(ReceipeBoardDto dto, Model model) {
		System.out.println("-------------------modify");

		ReceipeBoardDto resultDto = service.getView(dto);
		model.addAttribute("receipeDto", resultDto);
					
		return "ReceipeBoard/receipe_write";
	}
	

	@ResponseBody // json �뜝�럩援ⓨ뜝�럥六� 占쎈뎨占쎈뿪�돇
	@RequestMapping(value = "/ck/fileupload3", method = { RequestMethod.POST, RequestMethod.GET })
	public String fileUpload(ReceipeBoardDto dto, HttpServletRequest req, MultipartHttpServletRequest multi) {

		List<MultipartFile> multiList = new ArrayList<MultipartFile>();
		multiList.add(multi.getFile("upload"));
		System.out.println("-------------------->ck�뜝�럥�뱺�뜝�럥�꺏�뜝�럡�댉: " + multi.getFile("upload").getOriginalFilename());
		List<String> fileNameList = new ArrayList<String>();

		String path = req.getServletContext().getRealPath("/");
		System.out.println("占쎈닱占쎈닑占쎈뉴�뜝�럩�쓤�뜝�럩留꾤뇖�궡瑗듣�뚳옙 : " + path);

		// �뜝�럥堉꾢뜝�럩�젷 �뜝�럥�냱�뜝�럩逾у뜝�럩逾� �뜝�럥�뵜�슖�돦裕녻キ占� �뜝�럥�뵹�뜝�럥裕� 占쎄껀�뜝�띂寃ュ뜝占�   //url �뜝�럩逾� 占쎄껀�뜝�띂寃ュ뜝占� 
		FileUploadUtil.upload(path, multiList, fileNameList);
		
		System.out.println("{ \"uploaded\" : true, \"url\" : \"http://localhost:8080/myhome/upload/"
				+ fileNameList.get(0) + "\" }");
		String url = "{ \"uploaded\" : true, \"url\" : \"http://localhost:8080/myhome/upload/" + fileNameList.get(0) + "\" }";
	
		return url;
	}

	
//**************
	
	@RequestMapping(value="/receipe/comment/write")
	@ResponseBody
	HashMap<String, String> comment_write(CommentDto dto)
	{
		dto.setComment_board_loc("1");
		System.out.println("comment_id : " + dto.getComment_id());
		if( dto.getComment_id().equals(""))
			service.comment_insert(dto);
		else
			service.comment_update(dto);
		
		//service.comment_insert(dto);
		HashMap<String, String>map = new HashMap<String, String>();
		map.put("result", "success");
		return map; 
	}
	
	@RequestMapping(value="/receipe/comment/list")
	@ResponseBody
	List<CommentDto> comment_list(CommentDto dto)
	{
		dto.setComment_board_loc("1");
		System.out.println("board_id : " + dto.getComment_board_id());
		List<CommentDto> list = service.getCommentList(dto);
		return list; 
	}
	
	
	@RequestMapping(value="/receipe/comment/getView")
	@ResponseBody
	CommentDto comment_getView(CommentDto dto)
	{
		System.out.println("id : " + dto.getComment_id());
		CommentDto resultDto = service.getCommentView(dto);
		return resultDto; 
	}
	
	@RequestMapping(value="/receipe/comment/update")
	@ResponseBody
	HashMap<String, String> comment_update(CommentDto dto) {
		
		service.comment_update(dto);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping(value="/receipe/comment/delete")
	@ResponseBody
	HashMap<String, String> comment_delete(CommentDto dto)
	{
		service.comment_delete(dto);
		
		HashMap<String, String>map = new HashMap<String, String>();
		map.put("result", "success");
		return map; 
	}	
	
}
