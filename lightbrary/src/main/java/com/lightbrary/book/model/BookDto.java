package com.lightbrary.book.model;

import java.util.Date;

public class BookDto {
	
	private int no;
	private int statusCode;
	private String bookCode;
	private String categoryCode;
	private int imageNo;
	private String name;
	private String publish;
	private Date publishDate;
	private String writer;
	private String delFlag;
	private String imageName;
	
	public BookDto() {
		super();
	}

	public BookDto(int no, int statusCode, String bookCode,
			String categoryCode, int imageNo, String name, String publish,
			Date publishDate, String writer, String delFlag, String imageName) {
		super();
		this.no = no;
		this.statusCode = statusCode;
		this.bookCode = bookCode;
		this.categoryCode = categoryCode;
		this.imageNo = imageNo;
		this.name = name;
		this.publish = publish;
		this.publishDate = publishDate;
		this.writer = writer;
		this.delFlag = delFlag;
		this.imageName = imageName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public String getBookCode() {
		return bookCode;
	}
	
	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}
	
	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPublish() {
		return publish;
	}

	public void setPublish(String publish) {
		this.publish = publish;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	@Override
	public String toString() {
		return "BookDto [no=" + no + ", statusCode=" + statusCode 
				+ ", bookCode=" + bookCode + ", categoryCode=" + categoryCode
				+ ", imageNo=" + imageNo + ", name=" + name + ", publish=" 
				+ publish + ", publishDate=" + publishDate + ", writer="
				+ writer + ", delFlag=" + delFlag + "]";
	}
	
	
	
}
