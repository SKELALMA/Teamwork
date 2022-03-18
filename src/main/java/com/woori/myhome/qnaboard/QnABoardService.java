package com.woori.myhome.qnaboard;
 
import java.util.List;

import com.woori.myhome.comment.CommentDto;

public interface QnABoardService {
	List<QnABoardDto> getList(QnABoardDto dto);
	int getTotal(QnABoardDto dto);
	void insert(QnABoardDto dto);
	void insert_reply(QnABoardDto dto);
	QnABoardDto getView(QnABoardDto dto);
	void delete(QnABoardDto dto);
	void update(QnABoardDto dto);
	void cntHit(QnABoardDto dto);
	
	void comment_insert(CommentDto dto);
	List<CommentDto> getCommentList(CommentDto dto);	
	CommentDto getCommentView(CommentDto dto);
	void comment_update(CommentDto dto);
	void comment_delete(CommentDto dto);
}
