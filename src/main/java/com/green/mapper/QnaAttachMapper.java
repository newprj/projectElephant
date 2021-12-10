package com.green.mapper;

import java.util.List;

import com.green.vo.QnaAttachDTO;

public interface QnaAttachMapper {
	public void insert(QnaAttachDTO dto);
	public void delete(String uuid);
	public List<QnaAttachDTO> findByQno(Long Qno);
	public void deleteAll(Long Qno);
	public int cnt(Long Qno);
}
