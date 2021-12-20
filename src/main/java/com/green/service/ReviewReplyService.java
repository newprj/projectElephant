package com.green.service;

import java.util.List;

import com.green.vo.ReviewReplyVO;

public interface ReviewReplyService {
	public void register(ReviewReplyVO vo);
	public ReviewReplyVO get(Long cno);
	public void modify(ReviewReplyVO vo);
	public void remove(Long cno);
	public List<ReviewReplyVO> getList(Long rno);
	
}
