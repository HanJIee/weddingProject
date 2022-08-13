package com.wedding.app.controller;

import java.nio.charset.Charset;

import javax.inject.Inject;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.wedding.app.service.AdminService;
import com.wedding.app.vo.ReservationVO;

@RestController
@RequestMapping("/staff/*")
public class AdminController {
	@Inject
	AdminService service;
	
	
	//관리자페이지 이동
	@GetMapping("admin")
	public ModelAndView adminForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("staff/admin");
		return mav;
	}
	
	//==============================================================================
	
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
		
	
	
}
