package com.lightbrary.book.model;

import java.util.Date;

public class BookImageDto {
	private int no;
	private String originalFileName;
	private String storedFileName;
	private long fileSize;
	private Date createdDate;
	
	public BookImageDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookImageDto(int no, String originalFileName, String storedFileName, int fileSize, Date createdDate) {
		super();
		this.no = no;
		this.originalFileName = originalFileName;
		this.storedFileName = storedFileName;
		this.fileSize = fileSize;
		this.createdDate = createdDate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getStoredFileName() {
		return storedFileName;
	}
	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	@Override
	public String toString() {
		return "BookImageDto [no=" + no + ", originalFileName=" + originalFileName + ", storedFileName="
				+ storedFileName + ", fileSize=" + fileSize + ", createdDate=" + createdDate + "]";
	}
	
}
