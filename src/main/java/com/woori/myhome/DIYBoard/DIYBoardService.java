package com.woori.myhome.DIYBoard;

import java.util.List;

import com.woori.myhome.comment.CommentDto;
 
public interface DIYBoardService {
	List<DIYBoardDto> getList(DIYBoardDto dto);
	int getTotal(DIYBoardDto dto);
	void insert(DIYBoardDto dto );
	void update(DIYBoardDto dto );
	void delete(DIYBoardDto dto );
	DIYBoardDto getView(DIYBoardDto dto);
	void updateView(DIYBoardDto dto);
	List<DIYBoardDto> getListHit(DIYBoardDto dto);
	
	void comment_insert(CommentDto dto);
	List<CommentDto> getCommentList(CommentDto dto);	
	CommentDto getCommentView(CommentDto dto);
	void comment_update(CommentDto dto);
	void comment_delete(CommentDto dto);
}
