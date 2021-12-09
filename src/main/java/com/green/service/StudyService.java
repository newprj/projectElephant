package com.green.service;

import java.util.List;

import com.green.vo.StudyVO;

public interface StudyService {
	public List<StudyVO> allList();
	public int insert(StudyVO vo);
}
