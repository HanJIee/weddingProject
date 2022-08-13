package com.wedding.app.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.wedding.app.service.BoardService;

@RestController
@RequestMapping("/about/*")
public class AboutController {
	@Inject
	BoardService serivce;

	@GetMapping("/brand")
	public ModelAndView brand() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("about/brand");
		return mav;
	}
	
	@GetMapping("/map")
	public ModelAndView map() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("about/map");
		return mav;
	}
}
