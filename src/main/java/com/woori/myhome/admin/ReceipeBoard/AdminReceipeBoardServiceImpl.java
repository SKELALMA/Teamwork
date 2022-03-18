package com.woori.myhome.admin.ReceipeBoard;
 
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woori.myhome.comment.CommentDao;
import com.woori.myhome.comment.CommentDto;

@Service("adminReceipeboardService")
public class AdminReceipeBoardServiceImpl implements AdminReceipeBoardService{

	@Resource(name="adminReceipeBoardDao")
	AdminReceipeBoardDao dao;
	
//	@Resource(name="commentDao")
//	CommentDao commentDao;
	
	@Override
	public List<AdminReceipeBoardDto> getList(AdminReceipeBoardDto dto) {
		// TODO Auto-generated method stub
		return dao.getList(dto);
	}

	@Override
	public int getTotal(AdminReceipeBoardDto dto) {
		// TODO Auto-generated method stub
		return dao.getTotal(dto);
	}

	@Override
	public void insert(AdminReceipeBoardDto dto) {
		dao.insert(dto);
	}

	@Override
	public void update(AdminReceipeBoardDto dto) {
		dao.update(dto);
	}

	@Override
	public void delete(AdminReceipeBoardDto dto) {
		dao.delete(dto);
	}

	@Override
	public AdminReceipeBoardDto getView(AdminReceipeBoardDto dto) {
		// TODO Auto-generated method stub
		return dao.getView(dto);
	}

	@Override
	public void updateView(AdminReceipeBoardDto dto) {
		dao.updateView(dto);
		
	}
	
	//************** 댓글
//	@Override
//	public void comment_insert(CommentDto dto) {
//		// TODO Auto-generated method stub
//		commentDao.insert(dto);
//	}
//
//	@Override
//	public List<CommentDto> getCommentList(CommentDto dto) {
//		// TODO Auto-generated method stub
//		return commentDao.getList(dto);
//	}
//
//	@Override
//	public CommentDto getCommentView(CommentDto dto) {
//		// TODO Auto-generated method stub
//		return commentDao.comment_getView(dto);
//	}
//
//	@Override
//	public void comment_update(CommentDto dto) {
//		commentDao.comment_update(dto);
//	}
//
//	@Override
//	public void comment_delete(CommentDto dto) {
//		commentDao.comment_delete(dto);
//	}

}
