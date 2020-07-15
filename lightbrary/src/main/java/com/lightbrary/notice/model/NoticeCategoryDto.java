package com.lightbrary.notice.model;

import java.util.Date;

public class NoticeCategoryDto {
	
	private int no;
	private int memberNo;
	private String categoryCode;
	private String title;
	private String content;
	private Date startDate;
	private Date endDate;
	private Date createdDate;
	private Date modifiedDate;
	
	private int code;
	private String name;
	private String scheduleFlag;
	
	private int rnum;
	
	public NoticeCategoryDto() {
		super();
	}

	public NoticeCategoryDto(int no, int memberNo, String categoryCode, String title, String content, Date startDate,
			Date endDate, Date createdDate, Date modifiedDate, int code, String name, String scheduleFlag, int rnum) {
		super();
		this.no = no;
		this.memberNo = memberNo;
		this.categoryCode = categoryCode;
		this.title = title;
		this.content = content;
		this.startDate = startDate;
		this.endDate = endDate;
		this.createdDate = createdDate;
		this.modifiedDate = modifiedDate;
		this.code = code;
		this.name = name;
		this.scheduleFlag = scheduleFlag;
		this.rnum = rnum;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
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

	public String getScheduleFlag() {
		return scheduleFlag;
	}

	public void setScheduleFlag(String scheduleFlag) {
		this.scheduleFlag = scheduleFlag;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return "NoticeCategoryDto [no=" + no + ", memberNo=" + memberNo + ", categoryCode=" + categoryCode + ", title="
				+ title + ", content=" + content + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", createdDate=" + createdDate + ", modifiedDate=" + modifiedDate + ", code=" + code + ", name="
				+ name + ", scheduleFlag=" + scheduleFlag + ", rnum=" + rnum + "]";
	}

}
