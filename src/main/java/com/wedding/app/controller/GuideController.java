package com.wedding.app.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/guide/*")
public class GuideController {
	//식순리스트로 이동
	@GetMapping("orderList")
	public ModelAndView orderList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("guide/orderList");
		return mav;
	}
	
	//체크리스트로 이동
		@GetMapping("checkList")
		public ModelAndView checkList() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("guide/checkList");
			return mav;
		}
	
	
}
