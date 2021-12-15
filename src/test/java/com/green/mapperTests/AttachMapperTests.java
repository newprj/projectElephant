package com.green.mapperTests;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.green.mapper.ReviewAttachFileMapper;
import com.green.vo.ReviewAttachFileDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class AttachMapperTests {
	@Setter(onMethod_=@Autowired)
	private ReviewAttachFileMapper mapper;
	
	//@Test
	public void insertTest() {
		ReviewAttachFileDTO dto = new ReviewAttachFileDTO();
		dto.setFileName("file");
		dto.setUploadPath("c드라이브");
		dto.setUuid("1234");
		dto.setFileSize(123l);
		mapper.insert(dto);
	}
	
	//@Test
	public void readTest() {
		mapper.getList(43l);
	}
	
	
	//@Test
	public void deleteTeset() {
		//mapper.delete(3l);
	}
		
}
