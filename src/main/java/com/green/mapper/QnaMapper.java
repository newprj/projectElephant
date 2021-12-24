package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.green.vo.Criteria;
import com.green.vo.QnaVO;

public interface QnaMapper {
	public List<QnaVO> listqna();
	public List<QnaVO> listqnaWithPaging(@Param("cri") Criteria cri);
	
	public int insertQna(QnaVO vo);
	public int insertQnaKey(QnaVO vo);

	public QnaVO get(Long qno);
	public int update(QnaVO vo);
	public int deleteByQno(Long qno);
	
	public int totalCount(@Param("cri") Criteria cri);
	public int Qnatotal(@Param("cri") Criteria cri,@Param("writer") String writer);
	
	public int updateHit(@Param("qno") Long qno,@Param("hit") Long hit);
	
	public List<QnaVO> myQna(String writer);
	
}
