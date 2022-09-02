package com.wedding.app.controller;

import java.nio.charset.Charset;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	//회원가입하기
	@PostMapping("signUpOk")
	public ResponseEntity<String> signUpOk(UserVO vo) {
		// RestController에서는 ResponseBody를 보낼 수 있다.
		// 클라이언트에게 데이터와 뷰파일을 담을 수 있는 뷰페이지를 별도로 만들 필요가 없다.
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		headers.add("Content-Type","text/html; charset=utf-8");
		try {//회원등록-> 로그인폼으로 이동
			int result = service.signUpOk(vo);
			
			String msg = "<script>";
			msg += "alert('회원가입이 성공하였습니다.로그인페이지로 이동합니다.');";
			msg += "location.href='/user/login'";
			msg += "</script>";
			
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);//성공:200
		}catch(Exception e) {//회원등록 실패 -> 이전페이지(history:자바스크립트)
			String msg = "<script>";
			msg += "alert('회원가입이 실패하였습니다.');";
			msg += "history.back();";
			msg += "</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
			
			e.printStackTrace();
		}
		return entity;
	}
	//id중복검사
	@PostMapping("idChk")
	@ResponseBody
	public String idChk(String userid) throws Exception{
		int result = service.idCheck(userid);
		
		if(result !=0) {
			return "fail";
		}else {
			return "success";
		}
	}
}
