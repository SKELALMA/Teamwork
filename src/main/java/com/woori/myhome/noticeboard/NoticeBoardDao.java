package com.woori.myhome.noticeboard;

import java.util.List;

import com.woori.myhome.noticeboard.NoticeBoardDto;

public interface NoticeBoardDao {
	
	List<NoticeBoardDto> getList(NoticeBoardDto dto);
	int getTotal(NoticeBoardDto dto);
	void insert(NoticeBoardDto dto);
	NoticeBoardDto getView(NoticeBoardDto dto);
	void delete(NoticeBoardDto dto);
	void update(NoticeBoardDto dto);
	
	
	
}
