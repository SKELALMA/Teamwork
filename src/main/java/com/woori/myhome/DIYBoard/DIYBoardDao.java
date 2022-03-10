package com.woori.myhome.DIYBoard;

import java.util.List;


public interface DIYBoardDao {
	List<DIYBoardDto> getList(DIYBoardDto dto);
	int getTotal(DIYBoardDto dto);
	void insert(DIYBoardDto dto );
	void update(DIYBoardDto dto );
	void delete(DIYBoardDto dto );
	DIYBoardDto getView(DIYBoardDto dto);
	void updateView(DIYBoardDto dto);
}
