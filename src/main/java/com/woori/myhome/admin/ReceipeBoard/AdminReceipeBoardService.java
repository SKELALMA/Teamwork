package com.woori.myhome.admin.ReceipeBoard;

import java.util.List;

import com.woori.myhome.comment.CommentDto;

public interface AdminReceipeBoardService {
	List<AdminReceipeBoardDto> getList(AdminReceipeBoardDto dto);
	int getTotal(AdminReceipeBoardDto dto);
	void insert(AdminReceipeBoardDto dto );
	void update(AdminReceipeBoardDto dto );
	void delete(AdminReceipeBoardDto dto );
	AdminReceipeBoardDto getView(AdminReceipeBoardDto dto);
	void updateView(AdminReceipeBoardDto dto);
	
//	
//	void comment_insert(CommentDto dto);
//	List<CommentDto> getCommentList(CommentDto dto);	
//	CommentDto getCommentView(CommentDto dto);
//	void comment_update(CommentDto dto);
//	void comment_delete(CommentDto dto);
}
