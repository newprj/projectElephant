package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.BoardMapper;
import com.green.mapper.FileMapper;
import com.green.vo.BoardVO;
import com.green.vo.Criteria;
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
		vo.getAttachList();
		fileMapper.deleteAllByBno(vo.getBno());
		int modifyResult = mapper.update(vo);
		if( modifyResult==1 && vo.getAttachList() != null && vo.getAttachList().size()>0) {
			vo.getAttachList().forEach(file -> {
				
				file.setBno(vo.getBno());
				System.out.println(file);
				fileMapper.register(file);
			});
		}
		
		return modifyResult;
	}

	@Override
	public int delete(Long bno) {
		// TODO Auto-generated method stub
		fileMapper.deleteAllByBno(bno);
		return mapper.delete(bno);
	}

	@Override
	public List<FileVO> getFileListByBno(Long bno) {
		
		return fileMapper.filesByBno(bno);
	}

	@Override
	public List<BoardVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		
		return mapper.getTotalCount(cri);
	}

}