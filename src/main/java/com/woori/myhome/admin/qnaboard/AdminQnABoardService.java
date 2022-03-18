package com.woori.myhome.admin.qnaboard;

import java.util.List;

import com.woori.myhome.comment.CommentDto;

public interface AdminQnABoardService {
	List<AdminQnABoardDto> getList(AdminQnABoardDto dto);
	int getTotal(AdminQnABoardDto dto);
	void insert(AdminQnABoardDto dto);
	void insert_reply(AdminQnABoardDto dto);
	AdminQnABoardDto getView(AdminQnABoardDto dto);
	void delete(AdminQnABoardDto dto);
	void update(AdminQnABoardDto dto);
	void cntHit(AdminQnABoardDto dto);
	
//	void comment_insert(CommentDto dto);
//	List<CommentDto> getCommentList(CommentDto dto);	
//	CommentDto getCommentView(CommentDto dto);
//	void comment_update(CommentDto dto);
//	void comment_delete(CommentDto dto);
}
