package com.green.vo;

import java.sql.Date;

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
public class VisitCountVO {
	
	  private Long visit_id;
	  private String visit_ip;
	  private Date visit_time;
	  private String visit_refer;
	  private String visit_agent;
	
}
