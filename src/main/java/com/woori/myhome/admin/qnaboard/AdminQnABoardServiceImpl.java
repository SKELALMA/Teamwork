package com.woori.myhome.admin.qnaboard;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woori.myhome.comment.CommentDao;
import com.woori.myhome.comment.CommentDto;

@Service("adminQnABoardServcie")
public class AdminQnABoardServiceImpl implements AdminQnABoardService {

	@Resource(name="adminQnABoardDao")
	AdminQnABoardDao dao;
	
//	@Resource(name="commentDao")
//	CommentDao commentDao;
	
	@Override
	public List<AdminQnABoardDto> getList(AdminQnABoardDto dto) {

		return dao.getList(dto);
	}

	@Override
	public int getTotal(AdminQnABoardDto dto) {

		return dao.getTotal(dto);
	}

	@Override
	public void insert(AdminQnABoardDto dto) {

		dao.insert(dto);
	}

	@Override
	public void insert_reply(AdminQnABoardDto dto) {
		
		dao.insert_reply(dto);
	}

	@Override
	public AdminQnABoardDto getView(AdminQnABoardDto dto) {
		
		return dao.getView(dto);
	}

	@Override
	public void delete(AdminQnABoardDto dto) {
		
		dao.delete(dto);
	}

	@Override
	public void update(AdminQnABoardDto dto) {
		
		dao.update(dto);
	}

	@Override
	public void cntHit(AdminQnABoardDto dto) {
		dao.cntHit(dto);
		
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
