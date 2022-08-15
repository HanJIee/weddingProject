package com.wedding.app.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
@RequestMapping("/space/*")
public class SpaceController {
	
	@GetMapping("/hallList") 
    public ModelAndView hallList() { 
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("space/hallList");
    	return mav;
    } 
	
	@GetMapping("/serviceList") 
    public ModelAndView serviceList() { 
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("space/serviceList");
    	return mav;
    } 
}
