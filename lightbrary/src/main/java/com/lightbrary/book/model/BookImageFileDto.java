package com.lightbrary.book.model;

import java.util.Date;

public class BookImageFileDto {
	private int no;
	private int idx;
	private String originalFileName;
    private String storedFileName;  
	private int fileSize; 
	private Date createdDate;
	
	public BookImageFileDto() {
		super();
	}

	public BookImageFileDto(int no, int idx, String originalFileName, String storedFileName, int fileSize,
			Date createdDate) {
		super();
		this.no = no;
		this.idx = idx;
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

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
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

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
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
		return "BookImageFileDto [no=" + no + ", idx=" + idx + ", originalFileName=" + originalFileName
				+ ", storedFileName=" + storedFileName + ", fileSize=" + fileSize + ", createdDate=" + createdDate
				+ "]";
	}
	
	
}
