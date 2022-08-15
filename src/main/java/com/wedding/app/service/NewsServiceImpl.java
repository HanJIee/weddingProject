package com.wedding.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wedding.app.dao.NewsDAO;
import com.wedding.app.vo.BoardVO;
import com.wedding.app.vo.EventVO;
import com.wedding.app.vo.StaffVO;

@Service
public class NewsServiceImpl implements NewsService{
	@Inject
	NewsDAO dao;

	@Override
	public List<BoardVO> noticeList() {
		// TODO Auto-generated method stub
		return dao.noticeList();
	}

	@Override
	public void hitCount(int no) {
		dao.hitCount(no);
	}

	@Override
	public BoardVO getBoard(int no) {
		// TODO Auto-generated method stub
		return dao.getBoard(no);
	}

	@Override
	public List<EventVO> event() {
		return dao.event();
	}

	@Override
	public EventVO getEvent(int no) {
		return dao.getEvent(no);
	}

	@Override
	public StaffVO getStaffId() {
		return dao.getStaffId();
	}

	@Override
	public int noticeDel(int no) {
		return dao.noticeDel(no);
	}

	
	
	
}
