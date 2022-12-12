package com.example.demo09.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo09.model.Board;
import com.example.demo09.model.Comment;
import com.example.demo09.repository.BoardRepository;
import com.example.demo09.repository.CommentRepository;



@Service
public class CommentService {
	@Autowired
	private CommentRepository commentRepository;
	@Autowired
	private BoardRepository boardRepository;
	
	@Transactional
	public void insert(Comment comment) {
//		commentRepository.save(comment);
		
		//replyCnt + 1
		Board b = boardRepository.findById(comment.getBoard().getNum()).get();
		b.setReplyCnt(b.getReplyCnt()+1);
		
		//SQL		
		commentRepository.insert(comment.getContent(), comment.getBoard().getNum(), comment.getUser().getId());
	}
	
	public List<Comment> commentList(Long bnum){
		return commentRepository.findByBnum(bnum);
	}
	
	//댓글삭제
	public void delete(Long cnum) {
		//댓글개수 -1
		Optional<Comment> c = commentRepository.findById(cnum);
		Board b = c.get().getBoard();
		b.setReplyCnt(b.getReplyCnt()-1);
				
		commentRepository.deleteById(cnum);
	}
	
	
	
	
	
}
