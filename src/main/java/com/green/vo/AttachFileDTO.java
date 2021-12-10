package com.green.vo;

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
public class AttachFileDTO {
	private long rno;
	private String fileName;
	private String uploadPath;
	private String uuid;
	private long fileSize;
}
