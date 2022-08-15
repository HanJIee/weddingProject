package com.wedding.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wedding.app.dao.AdminDAO;
import com.wedding.app.vo.BoardVO;
import com.wedding.app.vo.DaychangeVO;
import com.wedding.app.vo.EventVO;
import com.wedding.app.vo.ReservationVO;
import com.wedding.app.vo.StaffVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Inject
	AdminDAO dao;
	
	@Override
	public List<ReservationVO> adList() {
		return dao.adList();
	}

	@Override
	public int reservationMultiCancel(ReservationVO vo) {
		return dao.reservationMultiCancel(vo);
	}

	@Override
	public int reservationMultiComplete(ReservationVO vo) {
		return dao.reservationMultiComplete(vo);
	}

	@Override
	public int reservationMultiChange(ReservationVO vo) {
		return dao.reservationMultiChange(vo);
	}

	@Override
	public List<DaychangeVO> adCheck() {
		return dao.adCheck();
	}

	@Override
	public StaffVO loginOk(StaffVO vo) {
		return dao.loginOk(vo);
	}

	@Override
	public int adBoardOk(BoardVO vo) {
		return dao.adBoardOk(vo);
	}

	@Override
	public BoardVO getBoard(int no) {
		return dao.getBoard(no);
	}
	
	@Override
	public int adBoardEditOk(BoardVO vo) {
		return dao.adBoardEditOk(vo);
	}

	@Override
	public int dataInsert(EventVO vo) {
		return dao.dataInsert(vo);
	}

	

	
}
