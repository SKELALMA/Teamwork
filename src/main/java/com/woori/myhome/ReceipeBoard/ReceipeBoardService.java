package com.woori.myhome.ReceipeBoard;

import java.util.List;

import com.woori.myhome.comment.CommentDto;
 
public interface ReceipeBoardService {
	List<ReceipeBoardDto> getList(ReceipeBoardDto dto);
	int getTotal(ReceipeBoardDto dto);
	void insert(ReceipeBoardDto dto );
	void update(ReceipeBoardDto dto );
	void delete(ReceipeBoardDto dto );
	ReceipeBoardDto getView(ReceipeBoardDto dto);
	void updateView(ReceipeBoardDto dto);
	List<ReceipeBoardDto> getKFoodList(ReceipeBoardDto dto);
	
	void comment_insert(CommentDto dto);
	List<CommentDto> getCommentList(CommentDto dto);	
	CommentDto getCommentView(CommentDto dto);
	void comment_update(CommentDto dto);
	void comment_delete(CommentDto dto);
}
