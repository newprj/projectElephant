package com.green.mapper;

import java.util.List;

import com.green.vo.ReviewReplyVO;

public interface ReviewReplyMapper {
	public int insert(ReviewReplyVO vo);
	public ReviewReplyVO read(Long cno);
	public int delete (Long cno);
	public int update (ReviewReplyVO vo);
	public List<ReviewReplyVO> getList(Long rno);
}
