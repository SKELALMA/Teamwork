package com.woori.myhome.qnaboard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("qnaBoardDao")
public class QnABoardDaoImpl implements QnABoardDao {

	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	public List<QnABoardDto> getList(QnABoardDto dto) {

		return sm.selectList("QnABoard_getList", dto);
	}

	@Override
	public int getTotal(QnABoardDto dto) {

		return sm.selectOne("QnABoard_getTotal", dto);
	}

	@Override
	public void insert(QnABoardDto dto) {

		sm.insert("QnABoard_insert", dto);
	}

	@Override
	public void insert_reply(QnABoardDto dto) {

		sm.update("QnABoard_updateLevel", dto);
		sm.insert("QnABoard_reply", dto);
	}

	@Override
	public QnABoardDto getView(QnABoardDto dto) {

		return sm.selectOne("QnABoard_getView", dto);
	}

	@Override
	public void delete(QnABoardDto dto) {
		sm.delete("QnABoard_delete", dto);
		
	}

	@Override
	public void update(QnABoardDto dto) {
		sm.update("QnABoard_update", dto);
		
	}

	@Override
	public void cntHit(QnABoardDto dto) {
		
		sm.update("QnABoard_hit", dto);
	}

}
