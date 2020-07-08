package com.lightbrary.book.model;

import java.util.Date;

public class BookUpdateParamDto {
	//업데이트용 데이터
	private int no;
	private String name;
	private String writer;
	private String publish;
	private Date publishDate;
	private int statusCode;
	
	//찾기 및 페이지 옵션값
	private int curPage;
	private String searchName;
	private String searchWriter;
	private String searchPublish;
	private String publishDateStart;
	private String publishDateEnd;
	private String searchCategory1;
	private String searchCategory2;
	private String searchCategory3;
	private int searchStatus;
	
	public BookListParamDto getBookListParamDto() {
		BookListParamDto bookListParamDto = new BookListParamDto();
		bookListParamDto.setCurPage(curPage);
		bookListParamDto.setSearchName(searchName);
		bookListParamDto.setSearchWriter(searchWriter);
		bookListParamDto.setSearchPublish(searchPublish);
		bookListParamDto.setPublishDateStart(publishDateStart);
		bookListParamDto.setPublishDateEnd(publishDateEnd);
		bookListParamDto.setSearchCategory1(searchCategory1);
		bookListParamDto.setSearchCategory2(searchCategory2);
		bookListParamDto.setSearchCategory3(searchCategory3);
		bookListParamDto.setSearchStatus(searchStatus);
		return bookListParamDto;
	}
	
	public BookDto getBookDto() {
		BookDto bookDto = new BookDto();
		bookDto.setNo(no);
		bookDto.setName(name);
		bookDto.setWriter(writer);
		bookDto.setPublish(publish);
		bookDto.setPublishDate(publishDate);
		bookDto.setStatusCode(statusCode);
		return bookDto;
	}

	public BookUpdateParamDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookUpdateParamDto(int no, String name, String writer, String publish, Date publishDate, int statusCode,
			int curPage, String searchName, String searchWriter, String searchPublish, String publishDateStart,
			String publishDateEnd, String searchCategory1, String searchCategory2, String searchCategory3,
			int searchStatus) {
		super();
		this.no = no;
		this.name = name;
		this.writer = writer;
		this.publish = publish;
		this.publishDate = publishDate;
		this.statusCode = statusCode;
		this.curPage = curPage;
		this.searchName = searchName;
		this.searchWriter = searchWriter;
		this.searchPublish = searchPublish;
		this.publishDateStart = publishDateStart;
		this.publishDateEnd = publishDateEnd;
		this.searchCategory1 = searchCategory1;
		this.searchCategory2 = searchCategory2;
		this.searchCategory3 = searchCategory3;
		this.searchStatus = searchStatus;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getSearchWriter() {
		return searchWriter;
	}

	public void setSearchWriter(String searchWriter) {
		this.searchWriter = searchWriter;
	}

	public String getSearchPublish() {
		return searchPublish;
	}

	public void setSearchPublish(String searchPublish) {
		this.searchPublish = searchPublish;
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

	public String getSearchCategory1() {
		return searchCategory1;
	}

	public void setSearchCategory1(String searchCategory1) {
		this.searchCategory1 = searchCategory1;
	}

	public String getSearchCategory2() {
		return searchCategory2;
	}

	public void setSearchCategory2(String searchCategory2) {
		this.searchCategory2 = searchCategory2;
	}

	public String getSearchCategory3() {
		return searchCategory3;
	}

	public void setSearchCategory3(String searchCategory3) {
		this.searchCategory3 = searchCategory3;
	}

	public int getSearchStatus() {
		return searchStatus;
	}

	public void setSearchStatus(int searchStatus) {
		this.searchStatus = searchStatus;
	}

	@Override
	public String toString() {
		return "BookUpdateParamDto [no=" + no + ", name=" + name + ", writer=" + writer + ", publish=" + publish
				+ ", publishDate=" + publishDate + ", statusCode=" + statusCode + ", curPage=" + curPage
				+ ", searchName=" + searchName + ", searchWriter=" + searchWriter + ", searchPublish=" + searchPublish
				+ ", publishDateStart=" + publishDateStart + ", publishDateEnd=" + publishDateEnd + ", searchCategory1="
				+ searchCategory1 + ", searchCategory2=" + searchCategory2 + ", searchCategory3=" + searchCategory3
				+ ", searchStatus=" + searchStatus + "]";
	}
	
}
