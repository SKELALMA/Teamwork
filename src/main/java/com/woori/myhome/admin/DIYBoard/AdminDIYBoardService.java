package com.woori.myhome.admin.DIYBoard;

import java.util.List;

import com.woori.myhome.comment.CommentDto;
 
public interface AdminDIYBoardService {
	List<AdminDIYBoardDto> getList(AdminDIYBoardDto dto);
	int getTotal(AdminDIYBoardDto dto);
	void insert(AdminDIYBoardDto dto );
	void update(AdminDIYBoardDto dto );
	void delete(AdminDIYBoardDto dto );
	AdminDIYBoardDto getView(AdminDIYBoardDto dto);
	void updateView(AdminDIYBoardDto dto);
	List<AdminDIYBoardDto> getListHit(AdminDIYBoardDto dto);
	
//	void comment_insert(CommentDto dto);
//	List<CommentDto> getCommentList(CommentDto dto);	
//	CommentDto getCommentView(CommentDto dto);
//	void comment_update(CommentDto dto);
//	void comment_delete(CommentDto dto);
}
