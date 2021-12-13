package com.green.mapper;

import com.green.vo.VisitCountVO;

public interface VisitMapper {
	public int insertVisitor(VisitCountVO vo);
	public int totalCount();
	
}
