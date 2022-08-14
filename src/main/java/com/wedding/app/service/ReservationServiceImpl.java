package com.wedding.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wedding.app.dao.ReservationDAO;
import com.wedding.app.vo.DaychangeVO;
import com.wedding.app.vo.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Inject
	ReservationDAO dao;

	@Override
	public List<ReservationVO> reservationList(String hallname) {
		return dao.reservationList(hallname);
	}

	@Override
	public ReservationVO getInfo(String userid) {
		return dao.getInfo(userid);
	}

	@Override
	public int modifyOk(DaychangeVO vo) {
		return dao.modifyOk(vo);
	}


	

	
}
