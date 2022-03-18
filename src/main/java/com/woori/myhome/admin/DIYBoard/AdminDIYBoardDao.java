package com.woori.myhome.admin.DIYBoard;

import java.util.List;
 

public interface AdminDIYBoardDao {
	List<AdminDIYBoardDto> getList(AdminDIYBoardDto dto);
	int getTotal(AdminDIYBoardDto dto);
	void insert(AdminDIYBoardDto dto );
	void update(AdminDIYBoardDto dto );
	void delete(AdminDIYBoardDto dto );
	AdminDIYBoardDto getView(AdminDIYBoardDto dto);
	void updateView(AdminDIYBoardDto dto);
	List<AdminDIYBoardDto> getListHit(AdminDIYBoardDto dto);
}
