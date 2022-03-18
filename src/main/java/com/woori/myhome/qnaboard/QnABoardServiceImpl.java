package com.woori.myhome.qnaboard;
 
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woori.myhome.comment.CommentDao;
import com.woori.myhome.comment.CommentDto;

@Service("qnaBoardService")
public class QnABoardServiceImpl implements QnABoardService {
	
	@Resource(name="qnaBoardDao")
	QnABoardDao dao;
	
	@Resource(name="commentDao")
	CommentDao commentDao;
	
	@Override
	public List<QnABoardDto> getList(QnABoardDto dto) {

		return dao.getList(dto);
	}

	@Override
	public int getTotal(QnABoardDto dto) {

		return dao.getTotal(dto);
	}

	@Override
	public void insert(QnABoardDto dto) {

		dao.insert(dto);
	}

	@Override
	public void insert_reply(QnABoardDto dto) {
		
		dao.insert_reply(dto);
	}

	@Override
	public QnABoardDto getView(QnABoardDto dto) {
		
		return dao.getView(dto);
	}

	@Override
	public void delete(QnABoardDto dto) {
		
		dao.delete(dto);
	}

	@Override
	public void update(QnABoardDto dto) {
		
		dao.update(dto);
	}
	
	@Override
	public void cntHit(QnABoardDto dto) {
		dao.cntHit(dto);
	}

	@Override
	public void comment_insert(CommentDto dto) {
		
		commentDao.insert(dto);
	}

	@Override
	public List<CommentDto> getCommentList(CommentDto dto) {
		
		return commentDao.getList(dto);
	}

	@Override
	public CommentDto getCommentView(CommentDto dto) {
		
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
