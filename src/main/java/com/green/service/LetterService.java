package com.green.service;

import java.util.List;

import com.green.vo.QnaVO;
import com.green.mapper.QnaAttachMapper;
import com.green.vo.Criteria;
import com.green.vo.LetterVO;
import com.green.vo.QnaAttachDTO;
import com.green.vo.QnaReplyVO;

public interface LetterService {
	public int insert(LetterVO vo);
	public List<LetterVO> myLetter(String recipient);
}
