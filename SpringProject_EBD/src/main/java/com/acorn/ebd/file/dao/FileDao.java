package com.acorn.ebd.file.dao;

import java.util.List;

import com.acorn.ebd.file.dto.FileDto;
import com.acorn.ebd.market.dto.MarketDto;

public interface FileDao {
	// 글 목록
	public List<FileDto> getList(FileDto dto);
	// 글의 갯수 (검색 키워드에 해당하는 갯수)
	public int getCount(FileDto dto);
	// 글 하나의 정보 얻어오기 
	public FileDto getData(int num);
	// 글 추가하기
	public void insert(FileDto dto);
	// 글 삭제하기
	public void delete(int num);
	// 글 수정하기 
	public void update(FileDto dto);
	// 글 조회수 올리기
	public void addViewCount(int num);
	
	// 하트 관련
	public void insertHeart(FileDto dto);
	public void deleteHeart(FileDto dto);
	public List<Integer> getHeartInfo(FileDto dto); //하트 정보
	public List<Integer> getHeartCnt(FileDto dto); //하트 갯수
	public boolean getHeartInfoDetail(FileDto dto);
	public int getHeartCntDetail(int num);
	
	//조회수 높은 순대로 TOP5를 리턴하는 메소드 
	public List<FileDto> getBestViewCntList();
	
	//나의 서재에서 내가 쓴글 리스트를 불러오는 메소드 
	public List<FileDto> getMyList(FileDto dto);
	//나의 서재에서 내가 쓴글 리스트의 count를 불러오는 메소드 
	public int getMyCount(FileDto dto);
	//나의 서재에서 내가 누른 하트의 리스트를 불러오는 메소드
	public List<FileDto> getMyHeartList(FileDto dto);
	//나의 서재에서 내가 누른 하트의 리스트 개수를 불러오는 메소드 
	public int getMyHeartCount(FileDto dto);
}
