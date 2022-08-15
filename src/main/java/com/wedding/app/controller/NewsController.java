package com.wedding.app.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.wedding.app.service.NewsService;
import com.wedding.app.vo.StaffVO;

@RestController
@RequestMapping("/news/*")
public class NewsController {
	@Inject
	NewsService service;
	
	@GetMapping("notice")
	public ModelAndView notice(){
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("boardList", service.noticeList());
		mav.setViewName("/news/notice");
		return mav;
	}
	@GetMapping("event")
	public ModelAndView event() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", service.event());
		mav.setViewName("news/event");
		return mav;
	}
		
	@GetMapping("gallery")
	public ModelAndView gallery() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", service.gallery());
		mav.setViewName("news/gallery");
		return mav;
	}
	
	
	@GetMapping("eventView")
	   public ModelAndView eventView(@RequestParam("no") int no) {
	      ModelAndView mav = new ModelAndView();
	      StaffVO svo = service.getStaffId();
	      mav.addObject("svo", svo);
	      mav.addObject("vo", service.getEvent(no));
	      mav.setViewName("news/eventView");
	      return mav;
	   }
	@GetMapping("galleryView")
	   public ModelAndView galleryView(@RequestParam("no") int no) {
	      ModelAndView mav = new ModelAndView();
	      StaffVO svo = service.getStaffId();
	      mav.addObject("svo", svo);
	      mav.addObject("vo", service.getGallery(no));
	      mav.setViewName("news/galleryView");
	      return mav;
	   }

	@GetMapping("noticeView")
	public ModelAndView noticeView(@RequestParam("no")int no) {
		//조회수 증가
		service.hitCount(no);
		StaffVO svo = service.getStaffId();
		ModelAndView mav = new ModelAndView();
		mav.addObject("svo", svo);
		mav.addObject("vo", service.getBoard(no));
		mav.setViewName("news/noticeView");
		
		return mav;
	}
	
	@GetMapping("noticeDel")
	public ModelAndView noticeDel(int no) {
		ModelAndView mav = new ModelAndView();
		int cnt = service.noticeDel(no);
		if(cnt>0) {
			mav.setViewName("redirect:notice");
		}
		return mav;
	}
	
	@GetMapping("eventDel")
	public ModelAndView eventDel(int no) {
		ModelAndView mav = new ModelAndView();
		int cnt = service.eventDel(no);
		if(cnt>0) {
			mav.setViewName("redirect:event");
		}
		return mav;
	}
	@GetMapping("galleryDel")
	public ModelAndView galleryDel(int no) {
		ModelAndView mav = new ModelAndView();
		int cnt = service.galleryDel(no);
		if(cnt>0) {
			mav.setViewName("redirect:gallery");
		}
		return mav;
	}
	
	
}
