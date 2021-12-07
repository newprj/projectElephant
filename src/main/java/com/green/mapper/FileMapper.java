package com.green.mapper;

import java.util.List;

import com.green.vo.BoardVO;
import com.green.vo.FileVO;

public interface FileMapper {
	public void register(FileVO vo);
	public void delete(String uuid);
	public List<FileVO> filesByBno(Long bno);
}
