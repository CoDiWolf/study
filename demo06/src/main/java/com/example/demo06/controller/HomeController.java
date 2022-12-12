package com.example.demo06.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo06.auth.PrincipalUser;
import com.example.demo06.model.Board;
import com.example.demo06.model.User;
import com.example.demo06.repository.UserRepository;
import com.example.demo06.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor //오토와이어 대신 파이널을 적었으므로 필요함.
public class HomeController {
	private final UserService userService;
	private final UserRepository userRepository;
	
	
	@GetMapping("/")
	public String home() {
		return "redirect:/board/list";
	}
	
	@GetMapping("/login")
	public String login() {
		return "/user/login";
	}
	
	//회원가입 폼
	@GetMapping("register")
	public String register() {
		return "/user/join";
	}
	//회원가입 폼
	@GetMapping("userUpdate")
	public String userUpdate() {
		return "/user/userUpdate";
	}

	@PostMapping("register")
	@ResponseBody
	public String register(@RequestBody User user) {
		//username 이 있으면 fail 리턴
		if(userRepository.findByUsername(user.getUsername())!=null) {
			return "fail";
		}		
		userService.register(user);
		return "success";
	}
	
	

	

}
