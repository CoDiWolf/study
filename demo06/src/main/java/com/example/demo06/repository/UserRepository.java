package com.example.demo06.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


import com.example.demo06.model.User;

public interface UserRepository extends JpaRepository<User, Long>{
	User findByUsername(String username);
	
	
	
}
