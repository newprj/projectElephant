package com.green.mapper;

import java.util.List;

import com.green.vo.ReviewAttachFileDTO;

public interface ReviewAttachFileMapper {
	public int insert(ReviewAttachFileDTO dto);
	public int delete (String uuid);
	public void deleteAll(long rno);
	public List<ReviewAttachFileDTO> getList(long rno);
	public ReviewAttachFileDTO read(String uuid);
}

