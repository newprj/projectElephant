package com.green.mapper;

import java.util.List;

import com.green.vo.CPageVO;

public interface CPageMapper {
	public int insert(CPageVO vo);
	public int delete (long rno);
	public void update (CPageVO vo);
	public void remove (CPageVO vo);
	public List<CPageVO> getList(String group_name);
	public CPageVO read(String member);
}
