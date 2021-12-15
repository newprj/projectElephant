package com.green.mapper;

import java.util.List;

import com.green.vo.ReviewVO;
import com.green.vo.SearchCriteria;

public interface ReviewMapper {
		public int insert(ReviewVO vo);
		public ReviewVO read(Long rno);
		public int delete (Long rno);
		public int update (ReviewVO vo);
		public int rnoRead ();
		public List<ReviewVO> getList();
		public List<ReviewVO> list(SearchCriteria scri);
		public int listCount(SearchCriteria scri);
		public void updateReplyCount(Long rno);
		public void viewCount(Long rno);
		public void attachedFile(Long rno);
	}


