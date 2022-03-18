package com.woori.myhome.admin.noticeboard;

import java.util.List;

import com.woori.myhome.comment.CommentDto;

public interface AdminNoticeBoardService {

	//공지사항 게시판 Dao 연결
	List<AdminNoticeBoardDto> getList(AdminNoticeBoardDto dto);
	int getTotal(AdminNoticeBoardDto dto);
	void insert(AdminNoticeBoardDto dto);
	AdminNoticeBoardDto getView(AdminNoticeBoardDto dto);
	void delete(AdminNoticeBoardDto dto);
	void update(AdminNoticeBoardDto dto);
	
	//댓글 Dao 연결
//	void comment_insert(CommentDto dto);
//	List<CommentDto> getCommentList(CommentDto dto);	
//	CommentDto getCommentView(CommentDto dto);
//	void comment_update(CommentDto dto);
//	void comment_delete(CommentDto dto);
}
