package com.green.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.green.vo.QnaVO;
import com.green.mapper.QnaAttachMapper;
import com.green.vo.Criteria;
import com.green.vo.LetterVO;
import com.green.vo.QnaAttachDTO;
import com.green.vo.QnaReplyVO;

public interface LetterService {
	public int insert(LetterVO vo);
	public List<LetterVO> myLetter(String recipient);
	public List<LetterVO> sendLetter(String writer);
	public void delete(@Param("writer") String writer,@Param("lno") Long lno);
}
