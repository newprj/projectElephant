package com.green.mapper;
import java.util.List;

public interface VisitMapper {
	public int insertVisitor();
	public int todayCnt();

	public List<Integer> weekCnt();
}
