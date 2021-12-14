package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mapper.CalendarMapper;
import com.green.vo.CalendarVO;

import lombok.Setter;

@Service
public class CalendarServiceImpl implements CalendarService{
	
	@Setter(onMethod_=@Autowired)
	CalendarMapper mapper;

	@Override
	public long createEvent(CalendarVO calendar) {
		// TODO Auto-generated method stub
		 mapper.createEvent(calendar);
		return mapper.getMaxCid();
	}

	@Override
	public int updateEvent(CalendarVO calendar) {
		// TODO Auto-generated method stub
		return mapper.updateEvent(calendar);
	}

	@Override
	public List<CalendarVO> showEventByGroup(String Group) {
		// TODO Auto-generated method stub
		return mapper.showEventByGroup(Group);
	}

	@Override
	public CalendarVO showEventOne(Long cno) {
		// TODO Auto-generated method stub
		return mapper.showEventOne(cno);
	}

	@Override
	public List<CalendarVO> showEventByDay(String startDate) {
		// TODO Auto-generated method stub
		return mapper.showEventByDay(startDate);
	}

	@Override
	public int deleteEvent(Long cno) {
		// TODO Auto-generated method stub
		return mapper.deleteEvent(cno);
	}

	@Override
	public List<CalendarVO> eventsAfterToday(String group) {
		// TODO Auto-generated method stub
		return mapper.eventsAfterToday(group);
	}

}
