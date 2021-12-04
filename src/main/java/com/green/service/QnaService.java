package com.green.service;

import java.util.List;

import com.green.vo.QnaVO;
import com.green.vo.QnaReplyVO;

public interface QnaService {
	//QnA
	public List<QnaVO> list();
	public int insertQna(QnaVO vo);
	public QnaVO get(Long qno);
	public int update(QnaVO vo);
	public int deleteByQno(Long qno);
	
	//reply
	public int register(QnaReplyVO vo);
	public List<QnaReplyVO> replyList(Long qno);
	public int replyDelete(Long rno);
	public int replyUpdate(QnaReplyVO vo);
}
