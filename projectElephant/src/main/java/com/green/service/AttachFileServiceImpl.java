package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.AttachFileMapper;
import com.green.vo.AttachFileDTO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class AttachFileServiceImpl implements AttachFileService{
	@Setter(onMethod_=@Autowired)
	private AttachFileMapper mapper;
	
	@Override
	public void register(AttachFileDTO dto) {
		mapper.insert(dto);		
	}


	@Override
	public void remove(Long rno) {
		mapper.delete(rno);
		
	}

	@Override
	public List<AttachFileDTO> getList(long rno) {
		return mapper.getList(rno);
	}


	@Override
	public AttachFileDTO read(String uuid) {
		return mapper.read(uuid);
	}

}
