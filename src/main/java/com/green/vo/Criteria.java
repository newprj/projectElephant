package com.green.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	
	private int pageNum;
	private int amount;
	private String group_name;
	private Long bno;
	
	//검색을 위한 변수
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1, 10);
	}
	
	public Criteria(String group_name) {
		this();
		this.group_name = group_name;
	}
	
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public Criteria(int pageNum, int amount, String group_name) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.group_name = group_name;
	}
	
	public Criteria(int pageNum, int amount, String group_name, Long bno) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.group_name = group_name;
		this.bno = bno;
	}
	
	public String[] getTypeArr() { //mybatis에서  typeArr을 사용 
		return type==null? new String[] {} : type.split("");//문자열을 공백으로 분리 
	}
	

}
