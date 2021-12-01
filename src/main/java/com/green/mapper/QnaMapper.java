package com.green.mapper;

import java.util.List;

import com.green.vo.QnaVO;

public interface QnaMapper {
	public List<QnaVO> listqna();
	public String test(Long qno);
	public int insertQna(QnaVO vo);
}
