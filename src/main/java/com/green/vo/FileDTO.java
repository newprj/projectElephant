package com.green.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class FileDTO {
	
	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
}
