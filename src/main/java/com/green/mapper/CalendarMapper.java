package com.green.mapper;


import java.util.List;

import com.green.vo.CalendarVO;

public interface CalendarMapper {
	
	public int createEvent(CalendarVO calendar);
	public int updateEvent(CalendarVO calendar);
	public List<CalendarVO> showEventByGroup(String Group);
	public CalendarVO showEventOne(Long cno);
	public List<CalendarVO> showEventByDay(String startDate);
	public int deleteEvent(Long cno);
	public Long getMaxCid();
	
	public List<CalendarVO> eventsAfterToday(String group);

}
