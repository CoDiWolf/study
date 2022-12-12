package com.example.demo06.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo06.model.Board;
import com.example.demo06.model.Comment;
import com.example.demo06.model.User;
import com.example.demo06.repository.BoardRepository;
import com.example.demo06.repository.CommentRepository;
import com.example.demo06.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private BCryptPasswordEncoder encoder;
	@Autowired
	private UserRepository userRepository;
	//회원가입
	public void register(User user) {
		//비번 아호화 시키고 추가
		 
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword);
		user.setPassword(encPassword);//암호화 된 비번
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
