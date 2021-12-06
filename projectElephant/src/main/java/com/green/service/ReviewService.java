package com.green.service;

import java.util.List;

import com.green.vo.Criteria;
import com.green.vo.ReviewVO;
import com.green.vo.SearchCriteria;


public interface ReviewService {
	public void register(ReviewVO vo);
	public ReviewVO get(Long rno);
	public void modify(ReviewVO vo);
	public void remove(ReviewVO vo);
	public List<ReviewVO> getList();
	public List<ReviewVO> list(SearchCriteria scri);
	public int listCount(SearchCriteria scri);
	public int rnoRead ();
}
