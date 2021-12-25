package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.green.vo.Criteria;
import com.green.vo.QnaReplyVO;

public interface QnaReplyMapper {
	public int register(QnaReplyVO vo);
	public List<QnaReplyVO> replyList(Long qno);
	public int replyDelete(Long rno);
	public int replyUpdate(QnaReplyVO vo);
	public int count(Long qno);
	
	public int replyTotal(@Param("cri") Criteria cri,@Param("r_writer") String r_writer);
	
	public List<QnaReplyVO> myReply(String r_writer);
}
