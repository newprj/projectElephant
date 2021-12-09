package com.green.mapper;

import java.util.List;

import com.green.vo.StudyVO;

public interface StudyMapper {
	public List<StudyVO> studySelect();
	public int studyInsert(StudyVO vo); //테스트
}
