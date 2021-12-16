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
public class GUserVO {
	
	  private Long cno;
	  private char authorized;
	  private String user_id;
	  private String group_name;
	  
	  // 그룹 생성할때 리더 가입처리 
	  public GUserVO(GroupVO vo) {
		  this.user_id = vo.getLeader();
		  this.group_name = vo.getGroup_name();
		  this.authorized = 'N';
	  }
	
}
