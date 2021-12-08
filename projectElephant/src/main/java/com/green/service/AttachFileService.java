package com.green.service;

import java.util.List;

import com.green.vo.AttachFileDTO;


public interface AttachFileService {
	public void register(AttachFileDTO dto);
	public List<AttachFileDTO> getList(long rno);
	public AttachFileDTO read(String uuid);
	public void remove(String uuid);
}
