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

		return "redirect:/admin/receipe/list";
	}
	

	@RequestMapping(value = "/admin/receipe/modify")
	String gallery_modify(AdminReceipeBoardDto dto, Model model) {
		System.out.println("-------------------modify");

		AdminReceipeBoardDto resultDto = service.getView(dto);
		model.addAttribute("receipeDto", resultDto);
					
		return "ReceipeBoard/receipe_write";
	}

	

}
