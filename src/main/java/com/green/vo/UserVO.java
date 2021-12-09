package com.green.vo;

import java.util.Date;
import java.util.List;

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
public class UserVO {
	private Long uno;
	private String user_id;
	private String password;
	private String name;
	private String email;
	
	//정지 
	private String suspension;
	private String suspContent;
	private Date suspDate;
	
}
