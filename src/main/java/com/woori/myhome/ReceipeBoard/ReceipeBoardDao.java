package com.woori.myhome.ReceipeBoard;

import java.util.List;

 
public interface ReceipeBoardDao {
	List<ReceipeBoardDto> getList(ReceipeBoardDto dto);
	int getTotal(ReceipeBoardDto dto);
	void insert(ReceipeBoardDto dto );
	void update(ReceipeBoardDto dto );
	void delete(ReceipeBoardDto dto );
	ReceipeBoardDto getView(ReceipeBoardDto dto);
	void updateView(ReceipeBoardDto dto);
	List<ReceipeBoardDto> getKFoodList(ReceipeBoardDto dto);
}
