package com.lightbrary.member.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberListParamDto {
	private int no;
	private String name;
	private String email;
	private String phone;
	private String address;
	@DateTimeFormat(pattern="yyyy/MM/dd HH:mm:ss")
	private Date createdDate;
	
	private String joinDateStart;
	private String joinDateEnd;
	
	private int curPage;
	private int startPage;
	private int endPage;
	
	public MemberListParamDto() {
		super();
		this.no = 0;
		this.name = "";
		this.email = "";
		this.phone =  "";
		this.address =  "";
		this.createdDate = null;
		this.joinDateStart =  "";
		this.joinDateEnd = "";
		this.curPage = 0;
		this.startPage = 0;
		this.endPage = 0;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public MemberListParamDto(int no, String name, String email, String phone, String address, Date createdDate,
			String joinDateStart, String joinDateEnd, int curPage, int startPage, int endPage) {
		super();
		this.no = no;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.createdDate = createdDate;
		this.joinDateStart = joinDateStart;
		this.joinDateEnd = joinDateEnd;
		this.curPage = curPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public Date getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getJoinDateStart() {
		return joinDateStart;
	}

	public void setJoinDateStart(String joinDateStart) {
		this.joinDateStart = joinDateStart;
	}

	public String getJoinDateEnd() {
		return joinDateEnd;
	}

	public void setJoinDateEnd(String joinDateEnd) {
		this.joinDateEnd = joinDateEnd;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "MemberListParamDto [name=" + name + ", email=" + email + ", joinDateStart=" + joinDateStart
				+ ", joinDateEnd=" + joinDateEnd + ", curPage=" + curPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}
	
}
