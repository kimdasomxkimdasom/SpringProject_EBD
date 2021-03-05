package com.acorn.ebd.market.dto;

import org.springframework.web.multipart.MultipartFile;

public class MarketDto {
	private int num;
	private String writer;
	private String title;
	private String salesType;
	private String salesStatus;
	private String imgpath; //이미지 저장경로
	private String content;
	private int viewCnt;
	private String regdate;
	
	//업로드 되는 이미지의 정보를 담을 필드
	private MultipartFile myImg; 
	
	//페이징처리를 위한
	private int startRowNum;
	private int endRowNum;
	private int prevNum;
	private int nextNum;
	
	//디폴트 생성자
	public MarketDto() {}

	public MarketDto(int num, String writer, String title, String salesType, String salesStatus, String imgpath,
			String content, int viewCnt, String regdate, MultipartFile myImg, int startRowNum, int endRowNum,
			int prevNum, int nextNum) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.salesType = salesType;
		this.salesStatus = salesStatus;
		this.imgpath = imgpath;
		this.content = content;
		this.viewCnt = viewCnt;
		this.regdate = regdate;
		this.myImg = myImg;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSalesType() {
		return salesType;
	}

	public void setSalesType(String salesType) {
		this.salesType = salesType;
	}

	public String getSalesStatus() {
		return salesStatus;
	}

	public void setSalesStatus(String salesStatus) {
		this.salesStatus = salesStatus;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public MultipartFile getMyImg() {
		return myImg;
	}

	public void setMyImg(MultipartFile myImg) {
		this.myImg = myImg;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public int getPrevNum() {
		return prevNum;
	}

	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}

	public int getNextNum() {
		return nextNum;
	}

	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}

	

	
	
	
}
