package com.green.mapper;

import java.util.List;

import com.green.vo.Criteria;
import com.green.vo.LetterVO;
import com.green.vo.QnaVO;

public interface LetterMapper {
	public int insert(LetterVO vo);
	public List<LetterVO> myLetter(String recipient);
}
