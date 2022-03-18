package com.woori.myhome.ReceipeBoard;
 
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woori.myhome.comment.CommentDao;
import com.woori.myhome.comment.CommentDto;
 
@Service("ReceipeboardService")
public class ReceipeBoardServiceImpl implements ReceipeBoardService{

	@Resource(name="ReceipeBoardDao")
	ReceipeBoardDao dao;
	
	@Resource(name="commentDao")
	CommentDao commentDao;
	
	@Override
	public List<ReceipeBoardDto> getList(ReceipeBoardDto dto) {
		// TODO Auto-generated method stub
		return dao.getList(dto);
	}

	@Override
	public int getTotal(ReceipeBoardDto dto) {
		// TODO Auto-generated method stub
		return dao.getTotal(dto);
	}

	@Override
	public void insert(ReceipeBoardDto dto) {
		dao.insert(dto);
	}

	@Override
	public void update(ReceipeBoardDto dto) {
		dao.update(dto);
	}

	@Override
	public void delete(ReceipeBoardDto dto) {
		dao.delete(dto);
	}

	@Override
	public ReceipeBoardDto getView(ReceipeBoardDto dto) {
		// TODO Auto-generated method stub
		return dao.getView(dto);
	}

	@Override
	public void updateView(ReceipeBoardDto dto) {
		dao.updateView(dto);
		
	}
	@Override
	public List<ReceipeBoardDto> getKFoodList(ReceipeBoardDto dto) {
		// TODO Auto-generated method stub
		return dao.getKFoodList(dto);
	}
	//************** 댓글
	@Override
	public void comment_insert(CommentDto dto) {
		// TODO Auto-generated method stub
		commentDao.insert(dto);
	}

	@Override
	public List<CommentDto> getCommentList(CommentDto dto) {
		// TODO Auto-generated method stub
		return commentDao.getList(dto);
	}

	@Override
	public CommentDto getCommentView(CommentDto dto) {
		// TODO Auto-generated method stub
		return commentDao.comment_getView(dto);
	}

	@Override
	public void comment_update(CommentDto dto) {
		commentDao.comment_update(dto);
	}

	@Override
	public void comment_delete(CommentDto dto) {
		commentDao.comment_delete(dto);
	}

}
