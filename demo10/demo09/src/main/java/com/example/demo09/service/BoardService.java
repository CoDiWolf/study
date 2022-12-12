package com.example.demo09.service;

import java.util.Date;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo09.model.Board;
import com.example.demo09.model.User;
import com.example.demo09.repository.BoardRepository;



@Transactional(readOnly=true)
@Service
public class BoardService {
	@Autowired
	private BoardRepository boardRepository;
	
	//추가
	@Transactional
	public void insert(Board board, User user) {
		board.setUser(user);
		boardRepository.save(board);
	}
	
	//전체보기
	public List<Board> list(){
		return boardRepository.findAll();
	}
	
	//페이징, 검색포함 전체보기
	public Page<Board> findAll(String field, String word, Pageable pageable) {
		Page<Board> lists = boardRepository.findAll(pageable);
		if(field.equals("title")) {
			lists=boardRepository.findByTitleContaining(word, pageable);
		}else if(field.equals("content")) {
			lists=boardRepository.findByContentContaining(word, pageable);
		}
		return lists;
	}
	
	public Long count(String field, String word) {
		Long count = boardRepository.count();
		if(field.equals("title")) {
			count = boardRepository.cntTitleSearch(word);
		}else if(field.equals("content")) {
			count = boardRepository.cntContentSearch(word);
		}
		return count;
	}
	
	//개수(카운트)
	public Long count() {
		return boardRepository.count();
	}
	
	//상세보기
	@Transactional
	public Board views(Long num) {
		Board board = boardRepository.findById(num).get();
		board.setHitcount(board.getHitcount()+1);
		
		return board;
	}
	
	//삭제
	@Transactional
	public void delete(Long num) {
		boardRepository.deleteById(num);
//		boardRepository.deleteByNum(num); <- boardrepository에 객체 만들어서 보내는 것 만들었다면 위에꺼써도 되고, 이거써도됨
	}
	
	//수정
	@Transactional
	public void update(Board board) {
		Board b = boardRepository.findById(board.getNum()).get();
		b.setTitle(board.getTitle());
		b.setContent(board.getContent());
		b.setRegdate(new Date());
	}
	
	
	
	
	
}
