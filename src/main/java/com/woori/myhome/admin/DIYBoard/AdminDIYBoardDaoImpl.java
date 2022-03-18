package com.woori.myhome.admin.DIYBoard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminDIYboardDao")
public class AdminDIYBoardDaoImpl implements AdminDIYBoardDao {
	
	@Autowired
	SqlSessionTemplate sm;

	@Override
	public List<AdminDIYBoardDto> getList(AdminDIYBoardDto dto) {
		// TODO Auto-generated method stub
		return sm.selectList("AdminDIY_getList",dto);
	}

	@Override
	public int getTotal(AdminDIYBoardDto dto) {
		// TODO Auto-generated method stub
		return sm.selectOne("AdminDIY_getTotal", dto);
	}

	@Override
	public void insert(AdminDIYBoardDto dto) {
		sm.insert("AdminDIY_insert", dto);
		
	}

	@Override
	public void update(AdminDIYBoardDto dto) {
		sm.update("AdminDIY_update", dto);
		
	}

	@Override
	public void delete(AdminDIYBoardDto dto) {
		sm.delete("AdminDIY_delete", dto);
		
	}

	@Override
	public AdminDIYBoardDto getView(AdminDIYBoardDto dto) {
		return sm.selectOne("AdminDIY_getView", dto);
	}

	@Override
	public void updateView(AdminDIYBoardDto dto) {
		sm.update("AdminDIY_updateView",dto);
	}

	@Override
	public List<AdminDIYBoardDto> getListHit(AdminDIYBoardDto dto) {
		// TODO Auto-generated method stub
		return sm.selectList("AdminDIY_getList_byhit",dto);
	}

}
