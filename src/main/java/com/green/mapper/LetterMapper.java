package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.green.vo.Criteria;
import com.green.vo.LetterVO;

public interface LetterMapper {
	public int insert(LetterVO vo);
	public List<LetterVO> sendLetter(String writer);
	public void delete(@Param("writer") String writer,@Param("lno") Long lno);
	
	public List<LetterVO> myLetter(String recipient);
	public int totalCount(Criteria cri);
	public List<LetterVO> listqnaWithPaging( @Param("cri") Criteria cri,@Param("recipient") String recipient);
}
