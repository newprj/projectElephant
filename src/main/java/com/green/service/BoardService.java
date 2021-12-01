package com.green.service;

import java.util.List;

import com.green.vo.BoardVO;

public interface BoardService {
	
	public int register(BoardVO vo);
	public List<BoardVO> showList(String group_name);
	public BoardVO read(Long bno);
	public int update(BoardVO vo);
	public int delete(Long bno);


}
