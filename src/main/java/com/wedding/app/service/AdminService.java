package com.wedding.app.service;

import java.util.List;

import com.wedding.app.vo.BoardVO;
import com.wedding.app.vo.DaychangeVO;
import com.wedding.app.vo.ReservationVO;
import com.wedding.app.vo.StaffVO;

public interface AdminService {
	
	public List<ReservationVO> adList();
	public int reservationMultiCancel(ReservationVO vo);
	public int reservationMultiComplete(ReservationVO vo);
	public int reservationMultiChange(ReservationVO vo);
	public List<DaychangeVO> adCheck();
	public StaffVO loginOk(StaffVO vo);
	public int adBoardOk(BoardVO vo);
	public BoardVO getBoard(int no);
	public int adBoardEditOk(BoardVO vo);
}
