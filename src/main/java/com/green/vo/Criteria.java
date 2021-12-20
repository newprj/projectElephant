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
	
	//정렬
	private String sort;
	
	public Criteria() {
		this(1, 10);
	}
	
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	

	
	public String[] getTypeArr() { //mybatis에서  typeArr을 사용 
		return type==null? new String[] {} : type.split("");//문자열을 공백으로 분리 
	}
	

}
