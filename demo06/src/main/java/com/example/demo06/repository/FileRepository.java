package com.example.demo06.repository;

import java.io.File;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;



import com.example.demo06.model.FileBoard;

public interface FileRepository  extends JpaRepository<FileBoard,Long>{
	//JPQL(Java Persistence Query Language : 엔티티 객체를 중심)
//	@Query("select sc from tbl_comment6 sc where bnum=?1") //EAGER

	public List<File> findBynum(Long num);
}
