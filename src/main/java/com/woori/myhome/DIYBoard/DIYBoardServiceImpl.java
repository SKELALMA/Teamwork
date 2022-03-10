package com.woori.myhome.DIYBoard;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woori.myhome.comment.CommentDao;
import com.woori.myhome.comment.CommentDto;

@Service("DIYboardService")
public class DIYBoardServiceImpl implements DIYBoardService{

	@Resource(name="DIYboardDao")
	DIYBoardDao dao;
	
	@Resource(name="commentDao")
	CommentDao commentDao;
	
	@Override
	public List<DIYBoardDto> getList(DIYBoardDto dto) {
		// TODO Auto-generated method stub
		return dao.getList(dto);
	}

	@Override
	public int getTotal(DIYBoardDto dto) {
		// TODO Auto-generated method stub
		return dao.getTotal(dto);
	}

	@Override
	public void insert(DIYBoardDto dto) {
		dao.insert(dto);
	}

	@Override
	public void update(DIYBoardDto dto) {
		dao.update(dto);
	}

	@Override
	public void delete(DIYBoardDto dto) {
		dao.delete(dto);
	}

	@Override
	public DIYBoardDto getView(DIYBoardDto dto) {
		// TODO Auto-generated method stub
		return dao.getView(dto);
	}

	@Override
	public void updateView(DIYBoardDto dto) {
		dao.updateView(dto);
		
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
