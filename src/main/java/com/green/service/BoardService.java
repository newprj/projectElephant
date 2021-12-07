package com.green.service;

import java.util.List;

import com.green.vo.BoardVO;
import com.green.vo.Criteria;
import com.green.vo.FileVO;

public interface BoardService {
	
	public void register(BoardVO vo);
	public List<BoardVO> showList(String group_name);
	public BoardVO read(Long bno);
	public int update(BoardVO vo);
	public int delete(Long bno);
	
	public List<FileVO> getFileListByBno(Long bno);
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);

}
