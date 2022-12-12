package com.example.demo06.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
@Getter @Setter
@Entity
public class FileBoard {
//번호 제목 저자 내용 이미지
	@Id @GeneratedValue(strategy =GenerationType.IDENTITY)
	private Long num;
	private String title;
	private String writer;
	private String content;
	@Transient
	private MultipartFile upload;//업로드 파일
	private String fileimage;//파일 이름
}
