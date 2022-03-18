package com.woori.myhome.noticeboard;
 
import java.util.List;

import com.woori.myhome.comment.CommentDto;

public interface NoticeBoardService {

	//공지사항 게시판 Dao 연결
	List<NoticeBoardDto> getList(NoticeBoardDto dto);
	int getTotal(NoticeBoardDto dto);
	void insert(NoticeBoardDto dto);
	NoticeBoardDto getView(NoticeBoardDto dto);
	void delete(NoticeBoardDto dto);
	void update(NoticeBoardDto dto);
	void hit(NoticeBoardDto dto);

	//댓글 Dao 연결
	void comment_insert(CommentDto dto);
	List<CommentDto> getCommentList(CommentDto dto);	
	CommentDto getCommentView(CommentDto dto);
	void comment_update(CommentDto dto);
	void comment_delete(CommentDto dto);
}
