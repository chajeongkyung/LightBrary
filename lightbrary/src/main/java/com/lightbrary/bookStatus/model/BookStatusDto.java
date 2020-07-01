package com.lightbrary.bookStatus.model;

public class BookStatusDto {
	private int code;
	private String name;
	public BookStatusDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookStatusDto(int code, String name) {
		super();
		this.code = code;
		this.name = name;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "BookStatusDto [code=" + code + ", name=" + name + "]";
	}
	
}
