package com.lightbrary.book.model;

public class BookListParamDto {
	private String searchName;
	private String searchWriter;
	private String searchPublish;
	private String publishDateStart;
	private String publishDateEnd;
	private String searchCategory1;
	private String searchCategory2;
	private String searchCategory3;
	private String categoryStart = "";
	private String categoryEnd = "";
	private int curPage;
	private int startPage;
	private int endPage;
	
	public void initBookListParamDto() {
		if(searchCategory3 != "") {
			categoryStart = searchCategory3;
			categoryEnd = searchCategory3;
		} else if(searchCategory2 != "") {
			categoryStart = searchCategory2.substring(0, 2) + "0";
			categoryEnd = searchCategory2.substring(0, 2) + "9";
		} else if(searchCategory1 != "") {
			categoryStart = searchCategory1.substring(0, 1) + "00";
			categoryEnd = searchCategory1.substring(0, 1) + "99";
		}
	}

	public BookListParamDto() {
		super();
		searchName = "";
		searchWriter = "";
		searchPublish = "";
		publishDateStart = "";
		publishDateEnd = "";
		searchCategory1 = "";
		searchCategory2 = "";
		searchCategory3 = "";
		categoryStart = "";
		categoryEnd = "";
		curPage = 0;
		startPage = 0;
		endPage = 0;
	}

	public BookListParamDto(String searchName, String searchWriter, String searchPublish, String publishDateStart,
			String publishDateEnd, String searchCategory1, String searchCategory2, String searchCategory3,
			String categoryStart, String categoryEnd, int curPage, int startPage, int endPage) {
		super();
		this.searchName = searchName;
		this.searchWriter = searchWriter;
		this.searchPublish = searchPublish;
		this.publishDateStart = publishDateStart;
		this.publishDateEnd = publishDateEnd;
		this.searchCategory1 = searchCategory1;
		this.searchCategory2 = searchCategory2;
		this.searchCategory3 = searchCategory3;
		this.categoryStart = categoryStart;
		this.categoryEnd = categoryEnd;
		this.curPage = curPage;
		this.startPage = startPage;
		this.endPage = endPage;
		initBookListParamDto();
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
		return "BookListParamDto [searchName=" + searchName + ", searchWriter=" + searchWriter + ", searchPublish="
				+ searchPublish + ", publishDateStart=" + publishDateStart + ", publishDateEnd=" + publishDateEnd
				+ ", searchCategory1=" + searchCategory1 + ", searchCategory2=" + searchCategory2 + ", searchCategory3="
				+ searchCategory3 + ", categoryStart=" + categoryStart + ", categoryEnd=" + categoryEnd + ", curPage="
				+ curPage + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}

	
}
