package com.green.mapper;

import java.util.List;

import com.green.vo.BoardVO;

public interface BoardMapper {
	
	public int register(BoardVO vo);
	public List<BoardVO> showList(String group_name);
	public BoardVO read(Long bno);
	public int update(BoardVO vo);
	public int delete(Long bno);


}
