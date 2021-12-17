package com.green.vo;

import java.sql.Date;
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
public class BoardVO {
	
	
    private Long bno;
    private String group_name;
    private String title;
    private String content;
    private String writer;
    private Date regdate;
    private Date updateDate;
    private char notice;

    private List<FileVO> attachList;
    private int replyCnt;
}
