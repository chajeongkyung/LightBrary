package com.lightbrary.rent.model;

import java.util.Date;

public class RentDto {
	private int no;
	private int memberNo;
	private int bookNo;
	private Date reserveDate;
	private Date rentDate;
	private Date expireDate;
	private Date returnDate;
	private String sendFlag;
	private String delFlag;
	
	private String bookName;
	private String publish;
	private String writer;
	
	private String mname;
	private String email;
	private String phone;
	private String address;
	
	private String bookStatus;	
	
	public RentDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RentDto(int no, int memberNo, int bookNo, Date reserveDate, Date rentDate, Date expireDate, Date returnDate,
			String sendFlag, String delFlag, String bookName, String publish, String writer, String mname, String email,
			String phone, String address, String bookStatus) {
		super();
		this.no = no;
		this.memberNo = memberNo;
		this.bookNo = bookNo;
		this.reserveDate = reserveDate;
		this.rentDate = rentDate;
		this.expireDate = expireDate;
		this.returnDate = returnDate;
		this.sendFlag = sendFlag;
		this.delFlag = delFlag;
		this.bookName = bookName;
		this.publish = publish;
		this.writer = writer;
		this.mname = mname;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.bookStatus = bookStatus;
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

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public Date getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}

	public Date getRentDate() {
		return rentDate;
	}

	public void setRentDate(Date rentDate) {
		this.rentDate = rentDate;
	}

	public Date getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(Date expireDate) {
		this.expireDate = expireDate;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public String getSendFlag() {
		return sendFlag;
	}

	public void setSendFlag(String sendFlag) {
		this.sendFlag = sendFlag;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getPublish() {
		return publish;
	}

	public void setPublish(String publish) {
		this.publish = publish;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getBookStatus() {
		return bookStatus;
	}

	public void setBookStatus(String bookStatus) {
		this.bookStatus = bookStatus;
	}

	@Override
	public String toString() {
		return "RentDto [no=" + no + ", memberNo=" + memberNo + ", bookNo=" + bookNo + ", reserveDate=" + reserveDate
				+ ", rentDate=" + rentDate + ", expireDate=" + expireDate + ", returnDate=" + returnDate + ", sendFlag="
				+ sendFlag + ", delFlag=" + delFlag + ", bookName=" + bookName + ", publish=" + publish + ", writer="
				+ writer + ", mname=" + mname + ", email=" + email + ", bookStatus=" + bookStatus + "]";
	}
	
}
