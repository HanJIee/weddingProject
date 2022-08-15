package com.wedding.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.wedding.app.vo.BoardVO;
import com.wedding.app.vo.EventVO;
import com.wedding.app.vo.GalleryVO;
import com.wedding.app.vo.StaffVO;


@Mapper
@Repository
public interface NewsDAO {

	public List<BoardVO> noticeList();
	public void hitCount(int no);
	public BoardVO getBoard(int no);
	public List<EventVO> event();
	public EventVO getEvent(int no);
	public List<GalleryVO> gallery();
	public GalleryVO getGallery(int no);
	public StaffVO getStaffId();
	public int noticeDel(int no);
	public int eventDel(int no);
	public int galleryDel(int no);
}
