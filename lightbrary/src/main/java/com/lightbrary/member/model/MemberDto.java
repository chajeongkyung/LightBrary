package com.lightbrary.member.model;

import java.util.Date;

public class MemberDto {

	private int no;
	private int gradeCode;
	private String email;
	private String password;
	private String name;
	private String phone;
	private String address;
	private Date createdDate;
	private Date modifiedDate;
	private String delFlag;
	
	public MemberDto() {
		super();
	}

	public MemberDto(int no, int gradeCode, String email, String password, String name, String phone, String address,
			Date createdDate, Date modifiedDate, String delFlag) {
		super();
		this.no = no;
		this.gradeCode = gradeCode;
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.createdDate = createdDate;
		this.modifiedDate = modifiedDate;
		this.delFlag = delFlag;
	}


	public MemberDto(int no, int gradeCode, String email, String password, String name, String phone, String address,
			Date createdDate) {
		super();
		this.no = no;
		this.gradeCode = gradeCode;
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.createdDate = createdDate;
	}

	public MemberDto(int no, String email) {
		super();
		this.no = no;
		this.email = email;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getGradeCode() {
		return gradeCode;
	}

	public void setGradeCode(int gradeCode) {
		this.gradeCode = gradeCode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	@Override
	public String toString() {
		return "MemberDto [no=" + no + ", gradeCode=" 
				+ gradeCode + ", email=" + email + ", password=" + password
				+ ", name=" + name + ", phone=" + phone + ", address=" 
				+ address + ", createdDate=" + createdDate
				+ ", modifiedDate=" + modifiedDate + ", delFlag=" + delFlag + "]";
	}

	
	
}
