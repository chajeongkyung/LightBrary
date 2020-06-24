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
	
	public RentDto() {
		super();
	}
	public RentDto(int no, int memberNo, int bookNo, Date reserveDate, Date rentDate, Date expireDate, Date returnDate,
			String sendFlag, String delFlag) {
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
	@Override
	public String toString() {
		return "RentDto [no=" + no + ", memberNo=" + memberNo 
				+ ", bookNo=" + bookNo + ", reserveDate=" + reserveDate
				+ ", rentDate=" + rentDate + ", expireDate=" + expireDate 
				+ ", returnDate=" + returnDate + ", sendFlag="
				+ sendFlag + ", delFlag=" + delFlag + "]";
	}

	
	
}
