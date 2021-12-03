package com.green.service;

import java.util.List;

import com.green.vo.CalendarVO;

public interface CalendarService {
	
	public int createEvent(CalendarVO calendar);
	public int updateEvent(CalendarVO calendar);
	public List<CalendarVO> showEventByGroup(String Group);
	public CalendarVO showEventOne(Long cno);
	public List<CalendarVO> showEventByDay(String startDate);
	public int deleteEvent(Long cno);

}
