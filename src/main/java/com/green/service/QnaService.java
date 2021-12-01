package com.green.service;

import java.util.List;

import com.green.vo.QnaVO;

public interface QnaService {
	public List<QnaVO> list();
	public String test(Long qno);
	public int insertQna(QnaVO vo);
}
