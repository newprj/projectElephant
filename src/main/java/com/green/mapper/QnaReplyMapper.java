package com.green.mapper;

import java.util.List;

import com.green.vo.QnaReplyVO;

public interface QnaReplyMapper {
	public int register(QnaReplyVO vo);
	public List<QnaReplyVO> replyList(Long qno);
	public int replyDelete(Long rno);
	public int replyUpdate(QnaReplyVO vo);
	public int count(Long qno);
	
	public List<QnaReplyVO> myReply(String r_writer);
}
