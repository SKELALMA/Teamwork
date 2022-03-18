package com.woori.myhome.noticeboard;
 
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.woori.myhome.comment.CommentDao;
import com.woori.myhome.comment.CommentDto;

@Service("noticeBoardService")
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Resource(name="noticeBoardDao")
	NoticeBoardDao dao;
	
	@Resource(name="commentDao")
	CommentDao commentDao;
	
	@Override
	public List<NoticeBoardDto> getList(NoticeBoardDto dto) {

		return dao.getList(dto);
	}

	@Override
	public int getTotal(NoticeBoardDto dto) {

		return dao.getTotal(dto);
	}

	@Override
	public void insert(NoticeBoardDto dto) {

		dao.insert(dto);
	}

	@Override
	public NoticeBoardDto getView(NoticeBoardDto dto) {

		return dao.getView(dto);
	}

	@Override
	public void delete(NoticeBoardDto dto) {

		dao.delete(dto);
	}

	@Override
	public void update(NoticeBoardDto dto) {
		dao.update(dto);		
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
	 
	@Override
	  public void hit(NoticeBoardDto dto) {
	     dao.hit(dto);
	 }
}
