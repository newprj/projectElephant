package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.CPageMapper;
import com.green.vo.CPageVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class CPageServiceImpl implements CPageService{
	@Setter(onMethod_=@Autowired)
	private CPageMapper mapper;
	
	@Override
	public int insert(CPageVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public int delete(String member) {
		return mapper.delete(member);
	}

	@Override
	public List<CPageVO> getList(String group_name) {
		return mapper.getList(group_name);
	}

	@Override
	public CPageVO read(String member) {
		return mapper.read(member);
	}

	@Override
	public void update(CPageVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public int memberLimit(String group_name) {
		// TODO Auto-generated method stub
		return mapper.memberLimit(group_name);
	}

	

}
