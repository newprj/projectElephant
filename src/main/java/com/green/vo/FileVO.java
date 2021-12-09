package com.green.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class FileVO {
	
	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean fileType;
	private Long bno;
}
