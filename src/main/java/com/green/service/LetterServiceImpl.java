package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.mapper.LetterMapper;
import com.green.mapper.QnaAttachMapper;
import com.green.mapper.QnaMapper;
import com.green.mapper.QnaReplyMapper;
import com.green.vo.QnaVO;
import com.green.vo.Criteria;
import com.green.vo.LetterVO;
import com.green.vo.QnaAttachDTO;
import com.green.vo.QnaReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class LetterServiceImpl implements LetterService{

	@Setter(onMethod_=@Autowired)
	private LetterMapper mapper;

	@Override
	public int insert(LetterVO vo) {
		// TODO Auto-generated method stub
		return mapper.insert(vo);
	}

	@Override
	public List<LetterVO> myLetter(String recipient) {
		// TODO Auto-generated method stub
		return mapper.myLetter(recipient);
	}

	@Override
	public List<LetterVO> sendLetter(String writer) {
		// TODO Auto-generated method stub
		return mapper.sendLetter(writer);
	}

	@Override
	public void delete(String writer,Long lno) {
		// TODO Auto-generated method stub
		mapper.delete(writer,lno);
	}



	@Override
	public List<LetterVO> listqnaWithPaging(Criteria cri, String recipient) {
		// TODO Auto-generated method stub
		return mapper.listqnaWithPaging(cri, recipient);
	}

	@Override
	public int sendCount(String writer) {
		// TODO Auto-generated method stub
		return mapper.sendCount(writer);
	}

	@Override
	public int totalCount(String recipient) {
		// TODO Auto-generated method stub
		return mapper.totalCount(recipient);
	}

	@Override
	public LetterVO oneLetter(Long lno) {
		// TODO Auto-generated method stub
		return mapper.oneLetter(lno);
	}


	
	
		
}
