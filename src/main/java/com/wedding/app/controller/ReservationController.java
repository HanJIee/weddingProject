package com.wedding.app.controller;

import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.wedding.app.service.ReservationService;
import com.wedding.app.vo.ReservationVO;
import com.wedding.app.vo.UserVO;

@RestController
@RequestMapping("/reservation/*")
public class ReservationController {
	@Autowired
	ReservationService service;
	
	//예약상담페이지 이동
	@GetMapping("consult")
	public ModelAndView consult() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reservation/consult");
		return mav;
	}
		
	//예약날짜 가져오기
	@GetMapping("calendar")
	public List<ReservationVO> calendar(String hallname) {
		
		/*"2022-8-25"*/
		List<ReservationVO> list = service.reservationList(hallname);
		//mav.setViewName("reservation/consult");
		System.out.println(list.size());
		return list;
	}
	
	//예약확인페이지 이동
		@GetMapping("check")
		public ModelAndView check(HttpSession session) {
			String userid = (String)session.getAttribute("logId");
			
			ReservationVO vo =service.getInfo(userid);
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("vo",vo);
			
			mav.setViewName("reservation/check");
			return mav;
		}
	
		
		
	//예약변경페이지 이동
	@GetMapping("modify")
	public ModelAndView modify(HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		
		ReservationVO vo =service.getInfo(userid);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo",vo);
		mav.setViewName("reservation/modify");
		return mav;
	}	
	
	
}
