package com.green.service;

import java.util.List;

import com.green.vo.ReviewAttachFileDTO;
import com.green.vo.Criteria;
import com.green.vo.ReviewVO;


public interface ReviewService {
	public void register(ReviewVO vo);
	public ReviewVO get(Long rno);
	public void modify(ReviewVO vo);
	public void remove(ReviewVO vo);
	public List<ReviewVO> getList();
	public List<ReviewVO> listqnaWithPaging(Criteria cri);
	public int listCount(Criteria cri);
	public int rnoRead ();
	public void updateReplyCount(Long rno);
	public void viewCount(Long rno);
	public void attachedFile(Long rno);
	public List<ReviewAttachFileDTO> getAttachList(Long rno);
}
