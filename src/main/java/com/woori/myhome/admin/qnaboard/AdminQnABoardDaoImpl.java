package com.woori.myhome.admin.qnaboard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminQnABoardDao")
public class AdminQnABoardDaoImpl implements AdminQnABoardDao {

	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	public List<AdminQnABoardDto> getList(AdminQnABoardDto dto) {

		return sm.selectList("AdminQnABoard_getList", dto);
	}

	@Override
	public int getTotal(AdminQnABoardDto dto) {

		return sm.selectOne("AdminQnABoard_getTotal", dto);
	}

	@Override
	public void insert(AdminQnABoardDto dto) {
		
		sm.insert("AdminQnABoard_insert", dto);		
	}

	@Override
	public void insert_reply(AdminQnABoardDto dto) {

		sm.update("AdminQnABoard_updateLevel", dto);
		sm.insert("AdminQnABoard_reply", dto);
	}

	@Override
	public AdminQnABoardDto getView(AdminQnABoardDto dto) {

		return sm.selectOne("AdminQnABoard_getView", dto);
	}

	@Override
	public void delete(AdminQnABoardDto dto) {

		sm.delete("AdminQnABoard_delete", dto);
	}

	@Override
	public void update(AdminQnABoardDto dto) {

		sm.update("AdminQnABoard_update", dto);
	}

	@Override
	public void cntHit(AdminQnABoardDto dto) {

		sm.update("AdminQnABoard_hit", dto);
	}

}
