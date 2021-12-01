package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.BoardMapper;
import com.green.vo.BoardVO;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Setter(onMethod_=@Autowired)
	BoardMapper mapper;

	@Override
	public int register(BoardVO vo) {
		// TODO Auto-generated method stub
		return mapper.register(vo);
	}

	@Override
	public List<BoardVO> showList(String group_name) {
		// TODO Auto-generated method stub
		return mapper.showList(group_name);
	}

	@Override
	public BoardVO read(Long bno) {
		// TODO Auto-generated method stub
		return mapper.read(bno);
	}

	@Override
	public int update(BoardVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(Long bno) {
		// TODO Auto-generated method stub
		return mapper.delete(bno);
	}

}
