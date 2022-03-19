package com.woori.myhome.admin.noticeboard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminNoticeBoardDao")
public class AdminNoticeBoardDaoImpl implements AdminNoticeBoardDao {

	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	public List<AdminNoticeBoardDto> getList(AdminNoticeBoardDto dto) {

		return sm.selectList("AdminNoticeBoard_getList", dto);
	}

	@Override
	public int getTotal(AdminNoticeBoardDto dto) {

		return sm.selectOne("AdminNoticeBoard_getTotal", dto);
	}

	@Override
	public void insert(AdminNoticeBoardDto dto) {

		sm.insert("AdminNoticeBoard_insert", dto);
	}

	@Override
	public AdminNoticeBoardDto getView(AdminNoticeBoardDto dto) {

		return sm.selectOne("AdminNoticeBoard_getView", dto);
	}

	@Override
	public void delete(AdminNoticeBoardDto dto) {

		sm.delete("AdminNoticeBoard_delete", dto);
	}

	@Override
	public void update(AdminNoticeBoardDto dto) {

		sm.update("AdminNoticeBoard_update", dto);
	}

}
