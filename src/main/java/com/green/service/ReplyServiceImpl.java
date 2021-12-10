package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.ReplyMapper;
import com.green.vo.ReplyVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService{
	@Setter(onMethod_=@Autowired)
	private ReplyMapper mapper;
	
	@Override
	public void register(ReplyVO vo) {
		mapper.insert(vo);
		
	}

	@Override
	public ReplyVO get(Long cno) {
		
		return mapper.read(cno);
	}

	@Override
	public void modify(ReplyVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public void remove(Long cno) {
		mapper.delete(cno);
		
	}

	@Override
	public List<ReplyVO> getList(Long rno) {
		return mapper.getList(rno);
	}

}
