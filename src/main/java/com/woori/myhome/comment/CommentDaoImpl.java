package com.woori.myhome.comment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
@Repository("commentDao")
public class CommentDaoImpl implements CommentDao {

	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	public List<CommentDto> getList(CommentDto dto) {
		
		return sm.selectList("Comment_list", dto);
	}
	
	@Override
	public void insert(CommentDto dto) {
		sm.insert("Comment_insert", dto);
		
	}

	@Override
	public CommentDto comment_getView(CommentDto dto) {

		return sm.selectOne("Comment_getView", dto);
	}

	@Override
	public void comment_update(CommentDto dto) {
		
		System.out.println("수정하고자 하는 댓글 comment_id : " + dto.getComment_id());
		sm.update("Comment_update", dto);
	}

	@Override
	public void comment_delete(CommentDto dto) {
		
		System.out.println("삭제되야하는 댓글 comment_id : " + dto.getComment_id());
		sm.delete("Comment_delete", dto);
	}

	
}
