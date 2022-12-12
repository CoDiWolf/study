package com.example.demo06.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


import com.example.demo06.service.UserService;

@RestController
@RequestMapping("/reply/*")
public class UserController {
@Autowired
private UserService userService;

@GetMapping("userlist")
public String lists(Model model) {
	model.addAttribute("users", userService.lists());
	return "/board/userlist";
}


@DeleteMapping("delete/{id}")
@ResponseBody
public Long delete(@PathVariable Long id) {
	userService.delete(id);
	return id;
}

}

