package com.wedding.app.service;

import java.util.List;

import com.wedding.app.vo.ReservationVO;

public interface ReservationService {
	public List<ReservationVO> reservationList(String hallname);
}
