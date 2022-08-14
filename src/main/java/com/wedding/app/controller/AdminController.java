package com.wedding.app.controller;

import java.nio.charset.Charset;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.wedding.app.service.AdminService;
import com.wedding.app.vo.BoardVO;
import com.wedding.app.vo.DaychangeVO;
import com.wedding.app.vo.ReservationVO;
import com.wedding.app.vo.StaffVO;

@RestController
@RequestMapping("/staff/*")
public class AdminController {
	@Inject
	AdminService service;
	
	@GetMapping("adlogin")
	public ModelAndView adlogin() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("staff/adlogin");
		return mav;
	}
	@PostMapping("loginOk")
	public ModelAndView loginOk(StaffVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		StaffVO svo = service.loginOk(vo);
		if(svo!=null) {
			session.setAttribute("adId", svo.getStaffid());
			session.setAttribute("adStatus", "Y");
			mav.setViewName("redirect:admin");
		}else {
			mav.setViewName("redirect:adlogin");
		}
		return mav;
	}
	
	
	//관리자페이지 이동
	@GetMapping("admin")
	public ModelAndView adminForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("staff/admin");
		return mav;
	}
	
	//==============================================================================
	//공지사항 글쓰기 페이지 이동
	@GetMapping("adBoard")
	public ModelAndView adBoard() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("staff/adBoard");
		return mav;
	}
	//공지사항 글쓰기 DB
	@PostMapping("adBoardOk")
	public ResponseEntity<String> adBoardOk(BoardVO vo, HttpServletRequest request){
		vo.setStaffid((String)request.getSession().getAttribute("adId"));
		vo.setIp(request.getRemoteAddr());
		
		String msg = "<script>";
		try {
			service.adBoardOk(vo);
			msg += "alert('공지사항 글이 등록되었습니다.');";
			msg += "location.href='/news/notice';";
			//글쓰기 성공시 이동 페이지 boardList로 변경해야함
		}catch(Exception e){
			msg += "alert('공지사항 등록에 실패하였습니다.');";
			msg += "history.go(-1);";
		}
		msg += "</script>";
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		ResponseEntity<String> entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		return entity;
	}
	//공지사항 글수정 페이지 이동
	@GetMapping("adBoardEdit/{num}")
	public ModelAndView adBoardEdit(@PathVariable("num") int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", service.getBoard(no));
		mav.setViewName("staff/adBoardEdit");
		return mav;
	}
	//공지사항 글수정 DB
	@PostMapping("adBoardEditOk")
	public ResponseEntity<String> adBoardEditOk(BoardVO vo, HttpSession session){
		vo.setStaffid((String)session.getAttribute("adId"));
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		String msg = "<script>";
		try {
			service.adBoardEditOk(vo);
			msg += "alert('글이 수정되었습니다.');";
			msg += "location.href='/news/notice';";
			//수정 성공시 이동 페이지 boardList로 변경해야함
		}catch(Exception e){
			msg += "alert('공지사항 수정에 실패하였습니다.');";
			msg += "history.go(-1);";
		}
		msg += "</script>";
		
		ResponseEntity<String> entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		return entity;
	}
	
	//===============================================================================
	
	//===============================================================================
	//예약관리 페이지 이동
	//예약 내역 가져오기
	@GetMapping("adReservation")
	public ModelAndView adList(){
		
		 ModelAndView mav = new ModelAndView(); 
		 mav.addObject("list",service.adList());
		 mav.setViewName("staff/adReservation");
		 return mav;
	}
	
	//예약취소
	@PostMapping("multiCancel")
	public ResponseEntity<String> reservationMultiCancel(ReservationVO vo) {
		System.out.println(vo.getNoList().size());
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=utf-8");
		
		String msg = "<script>";
		int cnt = service.reservationMultiCancel(vo);
		if(cnt>0) {
			msg += "alert('예약이 취소되었습니다.');";
		}else {
			msg += "alert('실패!');";
		}
		msg += "location.href='/staff/adReservation';</script>";
		
		entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		return entity;
	}
	
	//예약확정
		@PostMapping("multiComplete")
		public ResponseEntity<String> reservationMultiComplete(ReservationVO vo) {
			System.out.println(vo.getNoList().size());
			ResponseEntity<String> entity = null;
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
			headers.add("Content-Type", "text/html; charset=utf-8");
			
			String msg = "<script>";
			int cnt = service.reservationMultiComplete(vo);
			if(cnt>0) {
				msg += "alert('예약이 확정되었습니다.');";
			}else {
				msg += "alert('실패!');";
			}
			msg += "location.href='/staff/adReservation';</script>";
			
			
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			return entity;
		}
		
	//예약변경
		@PostMapping("multiChange")
		public ResponseEntity<String> reservationMultiChange(ReservationVO vo) {
			ResponseEntity<String> entity = null;
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
			headers.add("Content-Type", "text/html; charset=utf-8");
			
			String msg = "<script>";
			int cnt = service.reservationMultiChange(vo);
			if(cnt>0) {
				msg += "alert('예약이 변경되었습니다.');";
			}else {
				msg += "alert('실패!');";
			}
			msg += "location.href='/staff/adReservation';</script>";
			
			
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			return entity;
		}
		
		//문의 내역 가져오기
		@GetMapping("adCheck")
		public ModelAndView adCheck(){
			
			 ModelAndView mav = new ModelAndView();
			 
			 mav.addObject("list",service.adCheck());
			 mav.setViewName("staff/adCheck");
			 return mav;
		}
		
	
	
}
