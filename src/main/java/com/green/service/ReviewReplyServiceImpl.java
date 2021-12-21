package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.ReplyMapper;
import com.green.mapper.ReviewReplyMapper;
import com.green.vo.ReviewReplyVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class ReviewReplyServiceImpl implements ReviewReplyService{
	@Setter(onMethod_=@Autowired)
	private ReviewReplyMapper mapper;
	
	@Override
	public void register(ReviewReplyVO vo) {
		mapper.insert(vo);
		
	}

	@Override
	public ReviewReplyVO get(Long cno) {
		
		return mapper.read(cno);
	}

	@Override
	public void modify(ReviewReplyVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public void remove(Long cno) {
		mapper.delete(cno);
		
	}

	@Override
	public List<ReviewReplyVO> getList(Long rno) {
		return mapper.getList(rno);
	}

}
