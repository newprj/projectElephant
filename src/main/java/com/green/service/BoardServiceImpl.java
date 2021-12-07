package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.BoardMapper;
import com.green.mapper.FileMapper;
import com.green.vo.BoardVO;
import com.green.vo.FileVO;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Setter(onMethod_=@Autowired)
	BoardMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	FileMapper fileMapper;

	@Override
	public void register(BoardVO vo) {
		mapper.register(vo);
		if(vo.getAttachList() == null || vo.getAttachList().size() <=0 ) return;
		vo.getAttachList().forEach(file -> {
			file.setBno(vo.getBno());
			fileMapper.register(file);
		});
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

	@Override
	public List<FileVO> getFileListByBno(Long bno) {
		
		return fileMapper.filesByBno(bno);
	}

}
