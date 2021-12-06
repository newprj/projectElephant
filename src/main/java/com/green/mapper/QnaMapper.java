package com.green.mapper;

import java.util.List;

import com.green.vo.Criteria;
import com.green.vo.QnaVO;

public interface QnaMapper {
	public List<QnaVO> listqna();
	public List<QnaVO> listqnaWithPaging(Criteria cri);
	
	public int insertQna(QnaVO vo);
	public QnaVO get(Long qno);
	public int update(QnaVO vo);
	public int deleteByQno(Long qno);
	public int totalCount(Criteria cri);
}
