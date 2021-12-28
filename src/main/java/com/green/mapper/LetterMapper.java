package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.green.vo.Criteria;
import com.green.vo.LetterVO;

public interface LetterMapper {
	public int insert(LetterVO vo);
	
	public LetterVO oneLetter(Long lno);
	
	public List<LetterVO> sendLetter(String writer);
	public int sendCount(String writer);
	
	public void delete(@Param("writer") String writer,@Param("lno") Long lno);
	public int totalCount(String recipient);
	public List<LetterVO> myLetter(String recipient);
	public List<LetterVO> listqnaWithPaging( @Param("cri") Criteria cri,@Param("recipient") String recipient);
}
