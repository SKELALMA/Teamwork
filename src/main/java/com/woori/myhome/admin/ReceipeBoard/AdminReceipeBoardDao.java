package com.woori.myhome.admin.ReceipeBoard;

import java.util.List;


public interface AdminReceipeBoardDao {
	List<AdminReceipeBoardDto> getList(AdminReceipeBoardDto dto);
	int getTotal(AdminReceipeBoardDto dto);
	void insert(AdminReceipeBoardDto dto );
	void update(AdminReceipeBoardDto dto );
	void delete(AdminReceipeBoardDto dto );
	AdminReceipeBoardDto getView(AdminReceipeBoardDto dto);
	void updateView(AdminReceipeBoardDto dto);
}
