package com.woori.myhome.admin.DIYBoard;

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
public class AdminDIYBoardController {
	@Resource(name = "adminDIYboardService")
	AdminDIYBoardService service;

	@RequestMapping("/admin/gallery/list")
	String gallery_list(Model model, AdminDIYBoardDto dto) {
		System.out.println("[controller] gallery_list");
		dto.setPageSize(12);
		dto.setStart(dto.getPg() * dto.getPageSize());

		List<AdminDIYBoardDto> list = service.getList(dto);

		System.out.println("list: " + list);

		int cnt = service.getTotal(dto);

		model.addAttribute("galleryList", list);
		model.addAttribute("totalCnt", cnt);

		return "admin/admin_DIYBoard/admin_gallery_list";
	}
	@RequestMapping("/admin/gallery/list/hit")
	String gallery_list_Hit(Model model, AdminDIYBoardDto dto) {
		System.out.println("[controller] gallery_list");
		dto.setPageSize(12);
		dto.setStart(dto.getPg() * dto.getPageSize());

		List<AdminDIYBoardDto> list = service.getListHit(dto);

		System.out.println("fensfsnff list: " + list);

		int cnt = service.getTotal(dto);

		model.addAttribute("galleryList", list);
		model.addAttribute("totalCnt", cnt);

		return "DIYBoard/gallery_list";
	}
	@RequestMapping("/admin/gallery/write")
	String gallery_write(Model model, AdminDIYBoardDto paramDto) {
		System.out.println("gallery_write : " + paramDto);

		if (paramDto.getId().equals("")) {
			model.addAttribute("galleryDto", new AdminDIYBoardDto());
		} else
			model.addAttribute("galleryDto", service.getView(paramDto));

		return "DIYBoard/gallery_write";
	}

	@RequestMapping("/admin/gallery/save")
	String gallery_save(AdminDIYBoardDto dto, String upload) {
		
		System.out.println("--------------------"+ upload);
		
		if (!upload.isBlank()) {
			dto.setImage(upload);
	
		} else
			dto.setImage("default.jpg");

		if (dto.getId().equals(""))
			service.insert(dto);
		else
			service.update(dto);
		return "redirect:/gallery/list";

	}

//	
	@RequestMapping("/admin/gallery/view")
	String gallery_view(AdminDIYBoardDto dto, Model model) {
		AdminDIYBoardDto resultDto = service.getView(dto);
		service.updateView(resultDto);
		
		model.addAttribute("galleryDto", resultDto);

		return "DIYBoard/gallery_view";
	}

	@RequestMapping("/admin/gallery/delete")
	String gallery_delete(AdminDIYBoardDto dto) {

		
		service.delete(dto);

		return "redirect:/admin/gallery/list";
	}

	@RequestMapping(value = "/admin/gallery/modify")
	String gallery_modify(AdminDIYBoardDto dto, Model model) {
	//	System.out.println("-------------------modify");

		AdminDIYBoardDto resultDto = service.getView(dto);
		model.addAttribute("galleryDto", resultDto);

		return "DIYBoard/admin/gallery_write";
	}


	

}
