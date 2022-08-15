package com.wedding.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.wedding.app.vo.BoardVO;
import com.wedding.app.vo.DaychangeVO;
import com.wedding.app.vo.EventVO;
import com.wedding.app.vo.GalleryVO;
import com.wedding.app.vo.ReservationVO;
import com.wedding.app.vo.StaffVO;

@Mapper
@Repository
public interface AdminDAO {
	
	public List<ReservationVO> adList();
	public int reservationMultiCancel(ReservationVO vo);
	public int reservationMultiComplete(ReservationVO vo);
	public int reservationMultiChange(ReservationVO vo);
	public List<DaychangeVO> adCheck();
	public StaffVO loginOk(StaffVO vo);
	public int adBoardOk(BoardVO vo);
	public BoardVO getBoard(int no);
	public int adBoardEditOk(BoardVO vo);
	public int dataInsert(EventVO vo);
	public EventVO dataSelect(int no);
	public EventVO getFilenames(int no);
	public int dataUpdate(EventVO vo);
	public int gdataInsert(GalleryVO vo);
	public GalleryVO gdataSelect(int no);
	public GalleryVO ggetFilenames(int no);
	public int gdataUpdate(GalleryVO vo);
}
