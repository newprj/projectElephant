package com.green.vo;

import java.util.Date;
import java.util.List;

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
public class GroupVO {
	
	private Long gno;
    private String group_name;
    private String leader;
    private String subject;
    private String description;
    private int member_number;
    private Long viewCnt;
    private Date regdate;

    private String authorized;
    private String profile;
    
    private int applicantCnt;
    private int joinedCnt;

    private List<GUserVO> userList;
}
