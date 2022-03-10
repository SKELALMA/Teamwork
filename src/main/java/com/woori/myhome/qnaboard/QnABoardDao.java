package com.woori.myhome.qnaboard;

import java.util.List;

public interface QnABoardDao {
	List<QnABoardDto> getList(QnABoardDto dto);
	int getTotal(QnABoardDto dto);
	void insert(QnABoardDto dto);
	void insert_reply(QnABoardDto dto);
	QnABoardDto getView(QnABoardDto dto);
	void delete(QnABoardDto dto);
	void update(QnABoardDto dto);
	void cntHit(QnABoardDto dto);
}
