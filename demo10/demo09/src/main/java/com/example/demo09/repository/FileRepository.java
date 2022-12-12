package com.example.demo09.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo09.model.FileBoard;



public interface FileRepository extends JpaRepository<FileBoard, Long>{
	
}
