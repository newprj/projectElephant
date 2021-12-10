package com.green.service;

import java.util.List;

import com.green.vo.QnaVO;
import com.green.mapper.QnaAttachMapper;
import com.green.vo.Criteria;
import com.green.vo.QnaAttachDTO;
import com.green.vo.QnaReplyVO;

public interface QnaService {
	//QnA
	public List<QnaVO> list();
	public void insertQna(QnaVO vo);
	public QnaVO get(Long qno);
	public boolean update(QnaVO vo);
	public int deleteByQno(Long qno);
	public int totalCount(Criteria cri);
	public List<QnaVO> listqnaWithPaging(Criteria cri);
	public List<QnaAttachDTO> getAttachList(Long qno);
	
	//reply
	public int register(QnaReplyVO vo);
	public List<QnaReplyVO> replyList(Long qno);
	public int replyDelete(Long rno);
	public int replyUpdate(QnaReplyVO vo);
	public int replyCount(Long qno);
	
	//attach
	public int attachCount(Long qno);
}
