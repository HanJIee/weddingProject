package com.wedding.app.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
	
	/*
	 * //파일업로드 public ResponseEntity<String> ____( ,HttpServletRequest request) {
	 * String path =
	 * request.getSession().getServletContext().getRealPath("/upload");
	 * 
	 * HttpHeaders headers = new HttpHeaders(); headers.setContentType(new
	 * MediaType("text", "html", Charset.forName("UTF-8")));
	 * headers.add("Content-Type", "text/html; charset=UTF-8");
	 * 
	 * String msg =""; try { MultipartHttpServletRequest mr =
	 * (MultipartHttpServletRequest)request; List<MultipartFile> files =
	 * mr.getFiles("filename");
	 * 
	 * } }
	 */
	
}
