
package com.green.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.mapper.BoardMapper;
import com.green.mapper.FileMapper;
import com.green.mapper.ReplyMapper;
import com.green.vo.BoardReplyVO;
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
	
	@Setter(onMethod_=@Autowired)
	ReplyMapper replyMapper;
	
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
	public List<BoardVO> getListWithPaging(Criteria cri) {
		List<BoardVO> voList = mapper.getListWithPaging(cri);
		voList.forEach(vo -> {
			List<FileVO> files =fileMapper.filesByBno(vo.getBno());
			List<BoardReplyVO> replies = replyMapper.getReplysByBno(vo.getBno());
			vo.setAttachList(files);
			vo.setReplyCnt(replies.size());
		});
		return voList;
	}
	
	
	
	@Override
	public List<BoardVO> showList(String group_name) {
		List<BoardVO> voList = mapper.showList(group_name);
		List<BoardVO> notice = voList.stream()
			.filter( board -> board.getNotice() == 'Y')
			.collect(Collectors.toList());
		
		notice.forEach(vo ->{
				List<FileVO> files =fileMapper.filesByBno(vo.getBno());
				List<BoardReplyVO> replies = replyMapper.getReplysByBno(vo.getBno());
				vo.setAttachList(files);
				vo.setReplyCnt(replies.size());
			});
		return notice;
	}

	@Override
	public BoardVO read(Long bno) {
		BoardVO board = mapper.read(bno);
		board.setAttachList(fileMapper.filesByBno(board.getBno()));
		return board;
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

	@Transactional
	@Override
	public int delete(Long bno) {
		// TODO Auto-generated method stub
		fileMapper.deleteAllByBno(bno);
		replyMapper.deleteReplyByBno(bno);
		return mapper.delete(bno);
	}

	@Override
	public List<FileVO> getFileListByBno(Long bno) {
		
		return fileMapper.filesByBno(bno);
	}



	@Override
	public int getTotalCount(Criteria cri) {
		
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardVO> myBoard(String writer) {
		// TODO Auto-generated method stub
		return mapper.myBoard(writer);
	}

}