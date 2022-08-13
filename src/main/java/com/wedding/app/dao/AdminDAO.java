package com.wedding.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.wedding.app.vo.ReservationVO;

@Mapper
@Repository
public interface AdminDAO {
	
	public List<ReservationVO> adList();
	public int reservationMultiCancel(ReservationVO vo);
	public int reservationMultiComplete(ReservationVO vo);
	public int reservationMultiChange(ReservationVO vo);
}
