package com.wedding.app.service;

import java.util.List;

import com.wedding.app.vo.ReservationVO;

public interface AdminService {
	public List<ReservationVO> adList();
	public int reservationMultiCancel(ReservationVO vo);
	public int reservationMultiComplete(ReservationVO vo);
	public int reservationMultiChange(ReservationVO vo);
}
