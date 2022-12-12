package com.example.demo09.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo09.model.User;
import com.example.demo09.repository.UserRepository;




@Service
public class UserService {
	@Autowired
	private BCryptPasswordEncoder encoder;
	@Autowired
	private UserRepository userRepository;
	
	//회원가입
	public void register(User user) {
		//비번 암호화 시키고 추가
		String rawPassword=user.getPassword();
		String encPassword=encoder.encode(rawPassword);
		user.setPassword(encPassword); //암호화 된 비번
		user.setRole("ROLE_USER");
		userRepository.save(user);		
	}
	
	//회원정보변경(뷰)
	public User userview(Long id) {
		User user = userRepository.findById(id).get();
		return user;
	}
	
	public List<User> lists(){
		return userRepository.findAll();
	}
	
	public void delete(Long id) {
		userRepository.deleteById(id);
	}
	
}
