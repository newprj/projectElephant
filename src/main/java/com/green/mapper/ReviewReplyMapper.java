package com.green.mapper;

import java.util.List;

import com.green.vo.ReplyVO;

public interface ReviewReplyMapper {
	public int insert(ReplyVO vo);
	public ReplyVO read(Long cno);
	public int delete (Long cno);
	public int update (ReplyVO vo);
	public List<ReplyVO> getList(Long rno);
}
