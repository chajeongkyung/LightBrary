package com.lightbrary.book.model;

public class BookListParamDto {
	private String name;
	private String writer;
	private String publish;
	private String publishDateStart;
	private String publishDateEnd;
	private String bookCategory1;
	private String bookCategory2;
	private String bookCategory3;
	private String categoryStart = "";
	private String categoryEnd = "";
	private int curPage;
	private int startPage;
	private int endPage;
	
	public void initBookListParamDto() {
		if(bookCategory3 != "") {
			categoryStart = bookCategory3;
			categoryEnd = bookCategory3;
		} else if(bookCategory2 != "") {
			categoryStart = bookCategory2.substring(1, 1) + "0";
			categoryEnd = bookCategory2.substring(1, 1) + "9";
		} else if(bookCategory1 != "") {
			categoryStart = bookCategory1.substring(0, 1) + "00";
			categoryEnd = bookCategory1.substring(0, 1) + "99";
		}
	}

	public BookListParamDto() {
		super();
		name = "";
		writer = "";
		publish = "";
		publishDateStart = "";
		publishDateEnd = "";
		bookCategory1 = "";
		bookCategory2 = "";
		bookCategory3 = "";
		categoryStart = "";
		categoryEnd = "";
	}

	public BookListParamDto(String name, String writer, String publish, String publishDateStart, String publishDateEnd,
			String bookCategory1, String bookCategory2, String bookCategory3, String categoryStart, String categoryEnd,
			int curPage, int startPage, int endPage) {
		super();
		this.name = name;
		this.writer = writer;
		this.publish = publish;
		this.publishDateStart = publishDateStart;
		this.publishDateEnd = publishDateEnd;
		this.bookCategory1 = bookCategory1;
		this.bookCategory2 = bookCategory2;
		this.bookCategory3 = bookCategory3;
		this.categoryStart = categoryStart;
		this.categoryEnd = categoryEnd;
		this.curPage = curPage;
		this.startPage = startPage;
		this.endPage = endPage;
		initBookListParamDto();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPublish() {
		return publish;
	}

	public void setPublish(String publish) {
		this.publish = publish;
	}

	public String getPublishDateStart() {
		return publishDateStart;
	}

	public void setPublishDateStart(String publishDateStart) {
		this.publishDateStart = publishDateStart;
	}

	public String getPublishDateEnd() {
		return publishDateEnd;
	}

	public void setPublishDateEnd(String publishDateEnd) {
		this.publishDateEnd = publishDateEnd;
	}

	public String getBookCategory1() {
		return bookCategory1;
	}

	public void setBookCategory1(String bookCategory1) {
		this.bookCategory1 = bookCategory1;
	}

	public String getBookCategory2() {
		return bookCategory2;
	}

	public void setBookCategory2(String bookCategory2) {
		this.bookCategory2 = bookCategory2;
	}

	public String getBookCategory3() {
		return bookCategory3;
	}

	public void setBookCategory3(String bookCategory3) {
		this.bookCategory3 = bookCategory3;
	}

	public String getCategoryStart() {
		return categoryStart;
	}

	public void setCategoryStart(String categoryStart) {
		this.categoryStart = categoryStart;
	}

	public String getCategoryEnd() {
		return categoryEnd;
	}

	public void setCategoryEnd(String categoryEnd) {
		this.categoryEnd = categoryEnd;
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
		return "BookListParamDto [name=" + name + ", writer=" + writer + ", publish=" + publish + ", publishDateStart="
				+ publishDateStart + ", publishDateEnd=" + publishDateEnd + ", bookCategory1=" + bookCategory1
				+ ", bookCategory2=" + bookCategory2 + ", bookCategory3=" + bookCategory3 + ", categoryStart="
				+ categoryStart + ", categoryEnd=" + categoryEnd + ", curPage=" + curPage + ", startPage=" + startPage
				+ ", endPage=" + endPage + "]";
	}
	
	
}
