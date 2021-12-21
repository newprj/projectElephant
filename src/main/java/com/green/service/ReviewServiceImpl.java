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

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService{
	@Setter(onMethod_=@Autowired)
	private ReviewMapper reviewMapper;
	@Setter(onMethod_=@Autowired)
	private ReviewAttachFileMapper attachMapper;
	
	
	@Transactional
	@Override
	public void register(ReviewVO vo) {
		reviewMapper.insert(vo);
		
		if(vo.getAttachList()==null || vo.getAttachList().size()<=0) {
			return;
		}
		vo.getAttachList().forEach(i->{
			i.setRno(vo.getRno());
			attachMapper.insert(i);
		});
		reviewMapper.attachedFile(vo.getRno());
	}

	@Override
	public ReviewVO get(Long rno) {
		System.out.println("2 서비스에서 데이터 하나 가져오기"+rno);
		return reviewMapper.read(rno);
	}

	@Transactional
	@Override
	public void modify(ReviewVO vo) {
		vo.getAttachList();
		int modifyResult = reviewMapper.update(vo);
		if( modifyResult==1 && vo.getAttachList() != null && vo.getAttachList().size()>0) {
			vo.getAttachList().forEach(i -> {
				i.setRno(vo.getRno());
				attachMapper.insert(i);			
			});
		}
		reviewMapper.attachedFile(vo.getRno());
	}

	@Override
	public void remove(ReviewVO vo) {
		System.out.println("2 서비스에서 삭제"+vo);
		
	}

	@Override
	public List<ReviewVO> getList() {
		System.out.println("2 서비스에서 리스트 가져옴");
		return reviewMapper.getList();
	}

	@Override
	public int rnoRead() {
		System.out.println("2 서비스에서 rno max값 가져옴");
		return reviewMapper.rnoRead();
	}


	@Override
	public List<ReviewVO> listqnaWithPaging(Criteria cri) {
		System.out.println("2 서비스에서 리스트  가져옴");
		List<ReviewVO> voList = reviewMapper.listqnaWithPaging(cri);
		voList.forEach(vo->{
			List<ReviewAttachFileDTO> files = attachMapper.getList(vo.getRno());
			vo.setAttachList(files);
			reviewMapper.attachedFile(vo.getRno());
		});
		return reviewMapper.listqnaWithPaging(cri);
	}

	@Override
	public int listCount(Criteria cri) {
		System.out.println("2 서비스에서 리스트 count 가져옴");
		return reviewMapper.listCount(cri);
	}

	@Override
	public void updateReplyCount(Long rno) {
		reviewMapper.updateReplyCount(rno);
		
	}

	@Override
	public void viewCount(Long rno) {
		reviewMapper.viewCount(rno);

	}

	@Override
	public void attachedFile(Long rno) {
		// TODO Auto-generated method stub
		reviewMapper.attachedFile(rno);
		
	}

	@Override
	public List<ReviewAttachFileDTO> getAttachList(Long rno) {
		// TODO Auto-generated method stub
		return attachMapper.getList(rno);
	}
}
