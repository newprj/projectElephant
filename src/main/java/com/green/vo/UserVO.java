package com.green.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class UserVO {

	private Long uno;
	private String user_id;
	private String password;
	private String name;
	private String email;
	
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regDate;

}
