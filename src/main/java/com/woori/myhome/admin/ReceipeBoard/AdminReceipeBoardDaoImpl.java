package com.woori.myhome.admin.ReceipeBoard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
@Repository("adminReceipeBoardDao")
public class AdminReceipeBoardDaoImpl implements AdminReceipeBoardDao {
	
	@Autowired
	SqlSessionTemplate sm;

	@Override
	public List<AdminReceipeBoardDto> getList(AdminReceipeBoardDto dto) {
		// TODO Auto-generated method stub
		return sm.selectList("AdminReceipe_getList",dto);
	}

	@Override
	public int getTotal(AdminReceipeBoardDto dto) {
		// TODO Auto-generated method stub
		return sm.selectOne("AdminReceipe_getTotal", dto);
	}

	@Override
	public void insert(AdminReceipeBoardDto dto) {
		sm.insert("AdminReceipe_insert", dto);
		
	}

	@Override
	public void update(AdminReceipeBoardDto dto) {
		sm.update("AdminReceipe_update", dto);
		
	}

	@Override
	public void delete(AdminReceipeBoardDto dto) {
		sm.delete("AdminReceipe_delete", dto);
		
	}

	@Override
	public AdminReceipeBoardDto getView(AdminReceipeBoardDto dto) {
		return sm.selectOne("AdminReceipe_getView", dto);
	}

	@Override
	public void updateView(AdminReceipeBoardDto dto) {
		sm.update("AdminReceipe_updateView",dto);
	}

}
