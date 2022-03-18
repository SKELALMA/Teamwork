package com.woori.myhome.DIYBoard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
@Repository("DIYboardDao")
public class DIYBoardDaoImpl implements DIYBoardDao {
	
	@Autowired
	SqlSessionTemplate sm;

	@Override
	public List<DIYBoardDto> getList(DIYBoardDto dto) {
		// TODO Auto-generated method stub
		return sm.selectList("DIY_getList",dto);
	}

	@Override
	public int getTotal(DIYBoardDto dto) {
		// TODO Auto-generated method stub
		return sm.selectOne("DIY_getTotal", dto);
	}

	@Override
	public void insert(DIYBoardDto dto) {
		sm.insert("DIY_insert", dto);
		
	}

	@Override
	public void update(DIYBoardDto dto) {
		sm.update("DIY_update", dto);
		
	}

	@Override
	public void delete(DIYBoardDto dto) {
		sm.delete("DIY_delete", dto);
		
	}

	@Override
	public DIYBoardDto getView(DIYBoardDto dto) {
		return sm.selectOne("DIY_getView", dto);
	}

	@Override
	public void updateView(DIYBoardDto dto) {
		sm.update("DIY_updateView",dto);
	}

	@Override
	public List<DIYBoardDto> getListHit(DIYBoardDto dto) {
		// TODO Auto-generated method stub
		return sm.selectList("DIY_getList_byhit",dto);
	}

}
