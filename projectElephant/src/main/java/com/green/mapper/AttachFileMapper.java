package com.green.mapper;

import java.util.List;

import com.green.vo.AttachFileDTO;

public interface AttachFileMapper {
	public int insert(AttachFileDTO dto);
	public int delete (Long rno);
	public List<AttachFileDTO> getList(long rno);
	public AttachFileDTO read(String uuid);
}
