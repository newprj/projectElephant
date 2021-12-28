package com.green.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	public int update(QnaVO vo);
	public int deleteByQno(Long qno);
	public int totalCount(Criteria cri);
	public List<QnaVO> listqnaWithPaging(Criteria cri);
	public List<QnaAttachDTO> getAttachList(Long qno);
	public List<QnaVO> myQna(String writer);
	public int updateHit(@Param("qno") Long qno,@Param("hit") Long hit);
	public int Qnatotal(@Param("cri") Criteria cri,@Param("writer") String writer);
	
	//reply
	public int register(QnaReplyVO vo);
	public List<QnaReplyVO> replyList(Long qno);
	public int replyDelete(Long rno);
	public int replyUpdate(QnaReplyVO vo);
	public int replyCount(Long qno);
	public List<QnaReplyVO> myReply(String r_writer);
	public int replyTotal(@Param("cri") Criteria cri,@Param("r_writer") String r_writer);

	
	//attach
	public int attachCount(Long qno);
}
