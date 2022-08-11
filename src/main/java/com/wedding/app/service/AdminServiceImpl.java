package com.wedding.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wedding.app.dao.AdminDAO;
import com.wedding.app.vo.ReservationVO;

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

	
}
