package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.green.vo.Criteria;
import com.green.vo.LetterVO;
import com.green.vo.QnaVO;

public interface LetterMapper {
	public int insert(LetterVO vo);
	public List<LetterVO> myLetter(String recipient);
	public List<LetterVO> sendLetter(String writer);
	public void delete(@Param("writer") String writer,@Param("lno") Long lno);
}
