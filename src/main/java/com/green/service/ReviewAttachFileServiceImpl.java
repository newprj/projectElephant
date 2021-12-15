package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.ReviewAttachFileMapper;
import com.green.vo.ReviewAttachFileDTO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class ReviewAttachFileServiceImpl implements ReviewAttachFileService{
	@Setter(onMethod_=@Autowired)
	private ReviewAttachFileMapper mapper;
	
	@Override
	public void register(ReviewAttachFileDTO dto) {
		mapper.insert(dto);		
	}


	@Override
	public void remove(String uuid) {
		mapper.delete(uuid);
		
	}

	@Override
	public List<ReviewAttachFileDTO> getList(long rno) {
		return mapper.getList(rno);
	}


	@Override
	public ReviewAttachFileDTO read(String uuid) {
		return mapper.read(uuid);
	}

}
