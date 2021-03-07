package com.acorn.ebd.file.dao;

import java.util.List;

import com.acorn.ebd.file.dto.FileDto;

public interface FileDao {
	// 글 목록
	public List<FileDto> getList(FileDto dto);
	// 글의 갯수 (검색 키워드에 해당하는 갯수)
	public int getCount(FileDto dto);
	// 글 하나의 정보 얻어오기 
	public FileDto getData(int num);
	
	public void insert(FileDto dto);
	public void delete(int num);
	public void update(FileDto dto);
	
	//글 조회수 올리기
	public void addViewCount(int num);
}