package com.green.service;

import java.util.List;

import com.green.vo.ReplyVO;

public interface ReplyService {
	public void register(ReplyVO vo);
	public ReplyVO get(Long cno);
	public void modify(ReplyVO vo);
	public void remove(Long cno);
	public List<ReplyVO> getList(Long rno);
}
