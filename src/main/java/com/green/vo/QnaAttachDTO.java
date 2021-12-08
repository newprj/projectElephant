package com.green.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class QnaAttachDTO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;	//이미지인지 아닌지
	
	private Long qno;
	
}
