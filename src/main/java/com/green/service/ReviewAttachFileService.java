package com.green.service;

import java.util.List;

import com.green.vo.ReviewAttachFileDTO;


public interface ReviewAttachFileService {
	public void register(ReviewAttachFileDTO dto);
	public List<ReviewAttachFileDTO> getList(long rno);
	public ReviewAttachFileDTO read(String uuid);
	public void remove(String uuid);
}
