package com.woori.myhome.admin.qnaboard;

import java.util.List;

public interface AdminQnABoardDao {

	List<AdminQnABoardDto> getList(AdminQnABoardDto dto);
	int getTotal(AdminQnABoardDto dto);
	void insert(AdminQnABoardDto dto);
	void insert_reply(AdminQnABoardDto dto);
	AdminQnABoardDto getView(AdminQnABoardDto dto);
	void delete(AdminQnABoardDto dto);
	void update(AdminQnABoardDto dto);
	void cntHit(AdminQnABoardDto dto);
}
