package com.example.demo09.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo09.model.FileBoard;
import com.example.demo09.service.FileService;


@Controller
@RequestMapping("/file/*")
public class FileController {
	@Autowired
	private FileService fileService;
	
	@GetMapping("insert")
	public String insert() {
		return "/file/fileboardinsert";
	}
	
	@PostMapping("fileInsert")
	public String insert(FileBoard fboard, HttpSession session) {
		String uploadFolder = session.getServletContext().getRealPath("/")+"\\resource\\img";
		fileService.fileInsert(fboard, uploadFolder);
		
		return "redirect:list";
	}
	
	@GetMapping("list")
	public String list(Model model) {
		List<FileBoard> filest=fileService.filelist();
		model.addAttribute("files", filest);
		
		return "/file/fileList";
	}
	
	
	
}
