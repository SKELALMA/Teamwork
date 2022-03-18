package com.woori.myhome.admin.noticeboard;

import java.util.List;

import com.woori.myhome.noticeboard.NoticeBoardDto;

public interface AdminNoticeBoardDao {
	
	List<AdminNoticeBoardDto> getList(AdminNoticeBoardDto dto);
	int getTotal(AdminNoticeBoardDto dto);
	void insert(AdminNoticeBoardDto dto);
	AdminNoticeBoardDto getView(AdminNoticeBoardDto dto);
	void delete(AdminNoticeBoardDto dto);
	void update(AdminNoticeBoardDto dto);
	
	
	
}
