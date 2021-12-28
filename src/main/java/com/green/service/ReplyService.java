package com.green.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.green.vo.BoardReplyVO;
import com.green.vo.Criteria;

public interface ReplyService {
	
	public List<BoardReplyVO> getReplysByBno(Long bno);
	public BoardReplyVO getReplyOne(Long rno);
	public int registerReply(BoardReplyVO vo);
	public int updateReply(BoardReplyVO vo);
	public int deleteReply(Long rno);

	public List<BoardReplyVO> myReply(@Param("cri") Criteria cri,@Param("replyer") String replyer);
	public int totalReply(@Param("cri") Criteria cri,@Param("replyer") String replyer);
}
