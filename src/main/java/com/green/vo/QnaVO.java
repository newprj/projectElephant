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
public class QnaVO {
	private Long qno;
    private String title;
    private String writer;
    private String q_content;
    private Date reg_date;
    private Date up_date;
    private String pwd;
    private String p_group;
    private Long hit;
    
    private List<QnaAttachDTO> attachList;
}
