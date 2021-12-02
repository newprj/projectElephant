package com.green.service;

import java.util.List;

import com.green.vo.QnaVO;
import com.green.vo.ReplyVO;

public interface QnaService {
	//QnA
	public List<QnaVO> list();
	public int insertQna(QnaVO vo);
	public QnaVO get(Long qno);
	public int update(QnaVO vo);
	
	//reply
	public int register(ReplyVO vo);
	public List<ReplyVO> replyList(Long qno);
}
