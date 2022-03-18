package com.woori.myhome.ReceipeBoard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
@Repository("ReceipeBoardDao")
public class ReceipeBoardDaoImpl implements ReceipeBoardDao {
	 
	@Autowired
	SqlSessionTemplate sm;

	@Override
	public List<ReceipeBoardDto> getList(ReceipeBoardDto dto) {
		// TODO Auto-generated method stub
		return sm.selectList("Receipe_getList",dto);
	}

	@Override
	public int getTotal(ReceipeBoardDto dto) {
		// TODO Auto-generated method stub
		return sm.selectOne("Receipe_getTotal", dto);
	}

	@Override
	public void insert(ReceipeBoardDto dto) {
		sm.insert("Receipe_insert", dto);
		
	}

	@Override
	public void update(ReceipeBoardDto dto) {
		sm.update("Receipe_update", dto);
		
	}

	@Override
	public void delete(ReceipeBoardDto dto) {
		sm.delete("Receipe_delete", dto);
		
	}

	@Override
	public ReceipeBoardDto getView(ReceipeBoardDto dto) {
		return sm.selectOne("Receipe_getView", dto);
	}

	@Override
	public void updateView(ReceipeBoardDto dto) {
		sm.update("Receipe_updateView",dto);
	}
	@Override
	public List<ReceipeBoardDto> getKFoodList(ReceipeBoardDto dto) {
		// TODO Auto-generated method stub
		return sm.selectList("Receipe_KFood_getList",dto);
	}

}
