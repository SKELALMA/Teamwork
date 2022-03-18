package com.woori.myhome.admin.noticeboard;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woori.myhome.comment.CommentDao;
import com.woori.myhome.comment.CommentDto;

@Service("adminNoticeBoardService")
public class AdminNoticeBoardServiceImpl implements AdminNoticeBoardService {

	@Resource(name="adminNoticeBoardDao")
	AdminNoticeBoardDao dao;
	
	@Resource(name="commentDao")
	CommentDao commentDao;
	
	@Override
	public List<AdminNoticeBoardDto> getList(AdminNoticeBoardDto dto) {

		return dao.getList(dto);
	}

	@Override
	public int getTotal(AdminNoticeBoardDto dto) {

		return dao.getTotal(dto);
	}

	@Override
	public void insert(AdminNoticeBoardDto dto) {

		dao.insert(dto);
	}

	@Override
	public AdminNoticeBoardDto getView(AdminNoticeBoardDto dto) {

		return dao.getView(dto);
	}

	@Override
	public void delete(AdminNoticeBoardDto dto) {

		dao.delete(dto);
	}

	@Override
	public void update(AdminNoticeBoardDto dto) {
		dao.update(dto);		
	}

//	@Override
//	public void comment_insert(CommentDto dto) {
//
//		commentDao.insert(dto);
//	}
//
//	@Override
//	public List<CommentDto> getCommentList(CommentDto dto) {
//
//		return commentDao.getList(dto);
//	}
//
//	@Override
//	public CommentDto getCommentView(CommentDto dto) {
//
//		return commentDao.comment_getView(dto);
//	}
//
//	@Override
//	public void comment_update(CommentDto dto) {
//
//		commentDao.comment_update(dto);
//	}
//
//	@Override
//	public void comment_delete(CommentDto dto) {
//		
//		commentDao.comment_delete(dto);
//	}

}
