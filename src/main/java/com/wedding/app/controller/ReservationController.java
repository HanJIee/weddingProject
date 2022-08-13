package com.wedding.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.wedding.app.service.ReservationService;
import com.wedding.app.vo.ReservationVO;

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
		public ModelAndView check() {
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("reservation/check");
			return mav;
		}
	//예약확인페이지 정보출력
		@PostMapping("checkPrint")
		public ModelAndView checkPrint(ReservationVO vo, HttpSession session) {
			vo.setUserid((String)session.getAttribute("logId"));
			
			ModelAndView mav = new ModelAndView();
			
			//mav.addObject("list", service.checkPrint(vo));
			mav.addObject("vo", vo);
			mav.setViewName("reservation/check");
			return mav;
		}
		/*public String checkPrint(ReservationVO vo, HttpSession session) {
			//로그인 아이디를 얻어 vo에 userid에 셋팅
			vo.setUserid((String)session.getAttribute("logId"));
		}*/
		
		
	//예약상담페이지 이동
	@GetMapping("modify")
	public ModelAndView modify() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reservation/modify");
		return mav;
	}	
}
