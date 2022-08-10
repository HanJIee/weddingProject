package com.wedding.app.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/reservation/*")
public class ReservationController {
	//예약상담페이지 이동
	@GetMapping("consult")
	public ModelAndView consult() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reservation/consult");
		return mav;
	}
}
