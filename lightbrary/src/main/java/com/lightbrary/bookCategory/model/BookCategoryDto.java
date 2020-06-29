package com.lightbrary.bookCategory.model;

public class BookCategoryDto {
	private String code;
	private int depth;
	private String name;
	
	public BookCategoryDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookCategoryDto(String code, int depth, String name) {
		super();
		this.code = code;
		this.depth = depth;
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "BookCategoryDto [code=" + code + ", depth=" + depth + ", name=" + name + "]";
	}
	
	
}
