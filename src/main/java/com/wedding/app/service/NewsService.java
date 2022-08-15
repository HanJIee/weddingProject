package com.wedding.app.service;

import java.util.List;

import com.wedding.app.vo.BoardVO;
import com.wedding.app.vo.EventVO;
import com.wedding.app.vo.StaffVO;

public interface NewsService {
	public List<BoardVO> noticeList();
	public void hitCount(int no);
	public BoardVO getBoard(int no);
	public List<EventVO> event();
	public EventVO getEvent(int no);
	public StaffVO getStaffId();
	public int noticeDel(int no);
	
}
