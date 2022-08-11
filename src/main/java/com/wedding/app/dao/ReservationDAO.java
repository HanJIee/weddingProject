package com.wedding.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.wedding.app.vo.ReservationVO;

@Mapper
@Repository
public interface ReservationDAO {
	public List<ReservationVO> reservationList(String hallname);
}
