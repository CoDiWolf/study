package com.example.demo09.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo09.service.UserService;



@RequestMapping("/board/*")
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@GetMapping("userlist")
	public String lists(Model model) {
		model.addAttribute("users", userService.lists());
		return "/board/userlist";
	}
	
	@GetMapping("userUpdate")
	public String userUpdate(@PathVariable Long id, Model model) {
		model.addAttribute("userview", userService.userview(id));
		return "/board/userUpdate";
	}
	
	@DeleteMapping("delete/{id}")
	@ResponseBody
	public Long delete(@PathVariable Long id) {
		userService.delete(id);
		return id;
	}
	
}
