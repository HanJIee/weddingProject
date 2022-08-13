package com.wedding.app.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.wedding.app.service.UserService;
import com.wedding.app.vo.UserVO;

@RestController
@RequestMapping("/user/*")
public class UserController {
	@Inject
	UserService service;
	

	@GetMapping("signUp")
	public ModelAndView signUp() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/signUp");
		return mav;
	}
	
	
	
	@GetMapping("login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/login");
		return mav;
	}
	
	@PostMapping("loginOk")
	public ModelAndView loginOk(UserVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		UserVO logVO = service.loginOk(vo);

		if(logVO!=null) {//로그인 성공
			session.setAttribute("logId", logVO.getUserid());
			session.setAttribute("logStatus", "Y");
			mav.setViewName("redirect:/");	
		}else {
			mav.setViewName("redirect:login");
		}
		return mav;
	}
	
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();// 세션의 로그인 정보를 제거
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
}
