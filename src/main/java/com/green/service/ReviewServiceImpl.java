package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.mapper.ReviewAttachFileMapper;
import com.green.mapper.ReviewMapper;
import com.green.vo.ReviewAttachFileDTO;
import com.green.vo.Criteria;
import com.green.vo.ReviewVO;
import com.green.vo.SearchCriteria;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService{
	@Setter(onMethod_=@Autowired)
	private ReviewMapper mapper;
	@Setter(onMethod_=@Autowired)
	private ReviewAttachFileMapper attachMapper;
	
	
	@Transactional
	@Override
	public void register(ReviewVO vo) {
		System.out.println("2) 서비스에서 insert 하기 "+vo);
		System.out.println("2) 서비스에서 vo 가져옴????????????????????????"+vo.getGetAttachFile());
		mapper.insert(vo);
		
		if(vo.getGetAttachFile()==null || vo.getGetAttachFile().size()<=0) {
			return;
		}
		vo.getGetAttachFile().forEach(i->{
			i.setRno(vo.getRno());
			attachMapper.insert(i);
			System.out.println("2) 서비스에서 vo 가져옴????????????????????????"+i);
		});
		mapper.attachedFile(vo.getRno());
		
	}

	@Override
	public ReviewVO get(Long rno) {
		System.out.println("2 서비스에서 데이터 하나 가져오기"+rno);
		return mapper.read(rno);
	}

	@Override
	public void modify(ReviewVO vo) {
		System.out.println("2 서비스에서 수정"+vo);
		mapper.update(vo);
	}

	@Override
	public void remove(ReviewVO vo) {
		System.out.println("2 서비스에서 삭제"+vo);
		
	}

	@Override
	public List<ReviewVO> getList() {
		System.out.println("2 서비스에서 리스트 가져옴");
		return mapper.getList();
	}

	@Override
	public int rnoRead() {
		System.out.println("2 서비스에서 rno max값 가져옴");
		return mapper.rnoRead();
	}


	@Override
	public List<ReviewVO> list(SearchCriteria scri) {
		System.out.println("2 서비스에서 리스트  가져옴");
		List<ReviewVO> voList = mapper.list(scri);
		System.out.println(mapper.list(scri));
		voList.forEach(vo->{
			List<ReviewAttachFileDTO> files = attachMapper.getList(vo.getRno());
			vo.setGetAttachFile(files);
		});
		
		return mapper.list(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) {
		System.out.println("2 서비스에서 리스트 count 가져옴");
		return mapper.listCount(scri);
	}

	@Override
	public void updateReplyCount(Long rno) {
		mapper.updateReplyCount(rno);
		
	}

	@Override
	public void viewCount(Long rno) {
		mapper.viewCount(rno);

	}

	@Override
	public void attachedFile(Long rno) {
		// TODO Auto-generated method stub
		mapper.attachedFile(rno);
		
	}

	@Override
	public List<ReviewAttachFileDTO> getAttachList(Long rno) {
		// TODO Auto-generated method stub
		return attachMapper.getList(rno);
	}
}
