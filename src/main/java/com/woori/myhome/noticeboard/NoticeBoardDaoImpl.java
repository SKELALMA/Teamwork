package com.woori.myhome.noticeboard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("noticeBoardDao")
public class NoticeBoardDaoImpl implements NoticeBoardDao {

	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	public List<NoticeBoardDto> getList(NoticeBoardDto dto) {

		return sm.selectList("NoticeBoard_getList", dto);
	}

	@Override
	public int getTotal(NoticeBoardDto dto) {

		return sm.selectOne("NoticeBoard_getTotal", dto);
	}

	@Override
	public void insert(NoticeBoardDto dto) {

		sm.insert("NoticeBoard_insert", dto);
	}

	@Override
	public NoticeBoardDto getView(NoticeBoardDto dto) {

		return sm.selectOne("NoticeBoard_getView", dto);
	}

	@Override
	public void delete(NoticeBoardDto dto) {

		sm.delete("Notice", dto);
	}

	@Override
	public void update(NoticeBoardDto dto) {

		sm.update("NoticeBoard_update", dto);
	}

}
