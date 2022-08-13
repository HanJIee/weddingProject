package com.wedding.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wedding.app.dao.ReservationDAO;
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
	public ReservationVO checkPrint(ReservationVO vo) {
		return dao.checkPrint(vo);
	}
	
}
