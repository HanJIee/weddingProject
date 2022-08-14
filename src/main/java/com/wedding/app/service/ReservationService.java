package com.wedding.app.service;

import java.util.List;

import com.wedding.app.vo.DaychangeVO;
import com.wedding.app.vo.ReservationVO;
import com.wedding.app.vo.UserVO;

public interface ReservationService {
	public List<ReservationVO> reservationList(String hallname);
	public ReservationVO getInfo(String userid);
	public int modifyOk(DaychangeVO vo);
}
