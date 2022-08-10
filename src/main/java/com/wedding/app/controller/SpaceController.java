package com.wedding.app.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.wedding.app.service.BoardService;

@RestController
@RequestMapping("/space/*")
public class SpaceController {
	@Inject
	BoardService service;

	
	@GetMapping("/hallList") 
    public ModelAndView hallList() { 
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("space/hallList");
    	return mav;
    } 
}
