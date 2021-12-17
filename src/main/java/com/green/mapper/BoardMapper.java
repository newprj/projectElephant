package com.green.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.green.vo.BoardVO;
import com.green.vo.Criteria;

public interface BoardMapper {
	
	public int register(BoardVO vo);
	public List<BoardVO> showList(String group_name);
	public BoardVO read(Long bno);
	public int update(BoardVO vo);
	public int delete(Long bno);
	
	public List<BoardVO> myBoard(String writer);
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);


}
