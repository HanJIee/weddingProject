package com.wedding.app.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.wedding.app.service.AdminService;
import com.wedding.app.vo.BoardVO;
import com.wedding.app.vo.EventVO;
import com.wedding.app.vo.GalleryVO;
import com.wedding.app.vo.ReservationVO;
import com.wedding.app.vo.StaffVO;

@RestController
@RequestMapping("/staff/*")
public class AdminController {
	@Inject
	AdminService service;
	
	@GetMapping("adlogin")
	public ModelAndView adlogin() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("staff/adlogin");
		return mav;
	}
	@PostMapping("loginOk")
	public ModelAndView loginOk(StaffVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		StaffVO svo = service.loginOk(vo);
		if(svo!=null) {
			session.setAttribute("adId", svo.getStaffid());
			session.setAttribute("adStatus", "Y");
			mav.setViewName("redirect:adReservation");
		}else {
			mav.setViewName("redirect:adlogin");
		}
		return mav;
	}
	
	
	//관리자페이지 이동
	@GetMapping("admin")
	public ModelAndView adminForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("staff/admin");
		return mav;
	}
	//==============================================================================
	//이벤트 글쓰기 페이지 이동
	@GetMapping("adEvent")
	public ModelAndView adEvent() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("staff/adEvent");
		return mav;
	}
	//이벤트 글등록 + 파일업로드
	@PostMapping("adEventOk")
	public ResponseEntity<String> adEventOk(EventVO vo, HttpServletRequest request){
		//업로드할 위치의 절대경로
		String path = request.getSession().getServletContext().getRealPath("/img/event");
		System.out.println("path="+path);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=utf-8");
		
		//파일업로드
		String message = "";
		try {
			//1. 클라이언트 컴퓨터에 있는 파일이 서버로 복사하기 위해서는  
			//MultipartHttpServletRequest 객체를 request 객체에서 타입캐스팅으로 구한다.
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			
			// mr에는 업로드한 파일수만큼 MultipartFile객체가 존재한다.
			// MultipartFile객체를 List 컬렉션에 담아 리턴해준다.
			List<MultipartFile> files = mr.getFiles("fname");
			
			//업로드한 파일이 있을 때
			if(files != null) {
				//첨부한 파일의 수만큼 반복적으로 업로드를 처리한다.
				int cnt=0;
				for(int i=0;i<files.size();i++) {
					MultipartFile mf = files.get(i);
					//업로드한 실제 파일명
					String orgName = mf.getOriginalFilename();
					System.out.println("원래파일명 : "+orgName);
					//이미 파일명이 존재하면 rename
					if(orgName != null && !orgName.equals("")) {
						File f = new File(path, orgName);
						if(f.exists()) {
							for(int renameNum=1;;renameNum++) {
								int dot = orgName.lastIndexOf(".");
								String fileName = orgName.substring(0,dot);
								String extName = orgName.substring(dot+1);
								
								f = new File(path, fileName+"("+renameNum+")."+extName);
								if(!f.exists()){
									orgName = f.getName();
									break;
								}
							}
						}
						//파일업로드 실행
						mf.transferTo(f);
						cnt++;
						if(cnt==1) vo.setFilename(f.getName());
					}
				}
			}
			//DB등록
			vo.setStaffid((String)request.getSession().getAttribute("adId"));
			int cnt = service.dataInsert(vo);
			if(cnt>0) {
				message += "<script>";
				message += "alert('자료실 등록이 완료되었습니다.');";
				message += "location.href='/news/event';";
				message += "</script>";
			}else {//등록실패
				throw new Exception();
			}
			
		}catch(Exception e) {
			fileDelete(path, vo.getFilename());
			
			message += "<script>";
			message += "alert('글 등록에 실패하였습니다.');";
			message += "history.go(-1);";
			message += "</script>";
		}
		ResponseEntity<String> entity = new ResponseEntity<String>(message, headers, HttpStatus.OK);
		return entity;
	}
	//파일 삭제
	public void fileDelete(String path, String filename) {
		try {
			if(filename!=null) {
				File file = new File(path, filename);
				file.delete();
			}
		}catch(Exception e) {
			
		}
	}
	//이벤트 페이지 수정폼
	@GetMapping("adEventEdit/{no}")
	public ModelAndView adEventEdit(@PathVariable("no") int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", service.dataSelect(no));
		mav.setViewName("staff/adEventEdit");
		return mav;
	}
	//이벤트 페이지 수정 DB
	@PostMapping("adEventEditOk")
	public ResponseEntity<String> adEventEditOk(EventVO vo, HttpServletRequest request){
		
		//파일명보관
		EventVO dbFile = service.getFilenames(vo.getNo());
		System.out.println(service.getFilenames(vo.getNo()));
		//최종 사용할 파일명정리하는 컬렉션
		List<String> editFileList = new ArrayList<String>();
		//DB에서 선택한 파일을 컬렉션에 담기
		if(dbFile.getFilename()!=null) {
			editFileList.add(dbFile.getFilename());
		}
		//삭제파일명과 같은 파일 최종컬렉션에서 제거
		if(vo.getDelFile()!=null) {
			for(String del : vo.getDelFile()) {
				editFileList.remove(del);
			}
		}
		
		//업로드할 위치
		String path = request.getServletContext().getRealPath("/img/event");
		//새로 업로드한 파일명 보관할 컬렉션
		List<String> newUpload = new ArrayList<String>();
		//스크립트 넣을 변수 선언
		String msg = "";
		try {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			
			List<MultipartFile> newMf = mr.getFiles("fname");
			if(newMf!=null) {//업로드한 파일이 있으면
				for(int i=0;i<newMf.size();i++) {
					MultipartFile mf = newMf.get(i);
					String org_filename = mf.getOriginalFilename();
					
					if(org_filename!=null && !org_filename.equals("")) {
						File file = new File(path, org_filename);
						if(file.exists()) {
							for(int j=1;;j++) {
								int p = org_filename.lastIndexOf(".");
								String filenameNoExt = org_filename.substring(0,p);
								String ext = org_filename.substring(p+1);
								String renameFilename = filenameNoExt+"("+j+")."+ext;
								file = new File(path, renameFilename);
								if(!file.exists()) {
									org_filename = renameFilename;
									break;
								}
							}
						}
						mf.transferTo(file);
						newUpload.add(file.getName());
						editFileList.add(file.getName());
					}
				}
			}
			//DB 업데이트 
			for(int i=0;i<editFileList.size();i++) {
				if(i==0) vo.setFilename(editFileList.get(0));
			}
			//세션에 로그인한 아이디
			vo.setStaffid((String)request.getSession().getAttribute("adId"));
			int result = service.dataUpdate(vo);
			if(result>0) {
				if(vo.getDelFile()!=null) {
					for(String f : vo.getDelFile()) {
						fileDelete(path,f);
					}
				}
				//글내용보기로 페이지 이동
				msg += "<script>";
				msg += "alert('이벤트 글수정 성공하였습니다.');";
				msg += "location.href='/news/eventView?no="+vo.getNo()+"';";
				msg += "</script>";
			}else {
				throw new Exception();
			}
		}catch(Exception e) {
			e.printStackTrace();
			
			//update 실패
			//새로 업로드된 파일을 지운다.
			for(String f : newUpload) {
				fileDelete(path,f);
			}
			//수정페이지로 이동
			msg += "<script>";
			msg += "alert('이벤트 글수정에 실패하였습니다.');";
			msg += "history.back();";
			msg += "</script>";
		}
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		ResponseEntity<String> entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		return entity;
	}
	//==============================================================================
	//공지사항 글쓰기 페이지 이동
	@GetMapping("adBoard")
	public ModelAndView adBoard() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("staff/adBoard");
		return mav;
	}
	//공지사항 글쓰기 DB
	@PostMapping("adBoardOk")
	public ResponseEntity<String> adBoardOk(BoardVO vo, HttpServletRequest request){
		vo.setStaffid((String)request.getSession().getAttribute("adId"));
		vo.setIp(request.getRemoteAddr());
		
		String msg = "<script>";
		try {
			service.adBoardOk(vo);
			msg += "alert('공지사항 글이 등록되었습니다.');";
			msg += "location.href='/news/notice';";
			//글쓰기 성공시 이동 페이지 boardList로 변경해야함
		}catch(Exception e){
			msg += "alert('공지사항 등록에 실패하였습니다.');";
			msg += "history.go(-1);";
		}
		msg += "</script>";
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		ResponseEntity<String> entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		return entity;
	}
	//공지사항 글수정 페이지 이동
	@GetMapping("adBoardEdit/{num}")
	public ModelAndView adBoardEdit(@PathVariable("num") int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", service.getBoard(no));
		mav.setViewName("staff/adBoardEdit");
		return mav;
	}
	//공지사항 글수정 DB
	@PostMapping("adBoardEditOk")
	public ResponseEntity<String> adBoardEditOk(BoardVO vo, HttpSession session){
		vo.setStaffid((String)session.getAttribute("adId"));
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		String msg = "<script>";
		try {
			service.adBoardEditOk(vo);
			msg += "alert('글이 수정되었습니다.');";
			msg += "location.href='/news/notice';";
			//수정 성공시 이동 페이지 boardList로 변경해야함
		}catch(Exception e){
			msg += "alert('공지사항 수정에 실패하였습니다.');";
			msg += "history.go(-1);";
		}
		msg += "</script>";
		
		ResponseEntity<String> entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		return entity;
	}
	//===============================================================================
	//갤러리 글쓰기 이동
	@GetMapping("adGallery")
	public ModelAndView adGallery() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("staff/adGallery");
		return mav;
	}
	//갤러리 글쓰기 폼 + 파일업로드
	@PostMapping("adGalleryOk")
	public ResponseEntity<String> adGalleryOk(GalleryVO vo, HttpServletRequest request){
		//업로드할 위치의 절대경로
		String path = request.getSession().getServletContext().getRealPath("/img/gallery");
		System.out.println("path="+path);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=utf-8");
		
		//파일업로드
		String message = "";
		try {
			//1. 클라이언트 컴퓨터에 있는 파일이 서버로 복사하기 위해서는  
			//MultipartHttpServletRequest 객체를 request 객체에서 타입캐스팅으로 구한다.
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			
			// mr에는 업로드한 파일수만큼 MultipartFile객체가 존재한다.
			// MultipartFile객체를 List 컬렉션에 담아 리턴해준다.
			List<MultipartFile> files = mr.getFiles("fname");
			
			//업로드한 파일이 있을 때
			if(files != null) {
				//첨부한 파일의 수만큼 반복적으로 업로드를 처리한다.
				int cnt=0;
				for(int i=0;i<files.size();i++) {
					MultipartFile mf = files.get(i);
					//업로드한 실제 파일명
					String orgName = mf.getOriginalFilename();
					System.out.println("원래파일명 : "+orgName);
					//이미 파일명이 존재하면 rename
					if(orgName != null && !orgName.equals("")) {
						File f = new File(path, orgName);
						if(f.exists()) {
							for(int renameNum=1;;renameNum++) {
								int dot = orgName.lastIndexOf(".");
								String fileName = orgName.substring(0,dot);
								String extName = orgName.substring(dot+1);
								
								f = new File(path, fileName+"("+renameNum+")."+extName);
								if(!f.exists()){
									orgName = f.getName();
									break;
								}
							}
						}
						//파일업로드 실행
						mf.transferTo(f);
						cnt++;
						if(cnt==1) vo.setFilename(f.getName());
						System.out.println("이름=>"+f.getName()+"cnt=>"+cnt);
					}
				}
			}
			//DB등록
			vo.setStaffid((String)request.getSession().getAttribute("adId"));
			
			int cnt = service.gdataInsert(vo);
			
			if(cnt>0) {
				message += "<script>";
				message += "alert('갤러리 등록이 완료되었습니다.');";
				message += "location.href='/news/gallery';";
				message += "</script>";
			}else {//등록실패
				throw new Exception();
			}
			
		}catch(Exception e) {
			fileDelete(path, vo.getFilename());
			
			message += "<script>";
			message += "alert('갤러리 등록에 실패하였습니다.');";
			message += "history.go(-1);";
			message += "</script>";
		}
		ResponseEntity<String> entity = new ResponseEntity<String>(message, headers, HttpStatus.OK);
		return entity;
	}
	//갤러리 페이지 수정폼
		@GetMapping("adGalleryEdit/{no}")
		public ModelAndView adGalleryEdit(@PathVariable("no") int no) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("vo", service.gdataSelect(no));
			mav.setViewName("staff/adGalleryEdit");
			return mav;
		}
		//갤러리 페이지 수정 DB
		@PostMapping("adGalleryEditOk")
		public ResponseEntity<String> adGalleryEditOk(GalleryVO vo, HttpServletRequest request){
			
			//파일명보관
			GalleryVO dbFile = service.ggetFilenames(vo.getNo());
			//최종 사용할 파일명정리하는 컬렉션
			List<String> editFileList = new ArrayList<String>();
			//DB에서 선택한 파일을 컬렉션에 담기
			if(dbFile.getFilename()!=null) {
				editFileList.add(dbFile.getFilename());
			}
			//삭제파일명과 같은 파일 최종컬렉션에서 제거
			if(vo.getDelFile()!=null) {
				for(String del : vo.getDelFile()) {
					editFileList.remove(del);
				}
			}
			
			//업로드할 위치
			String path = request.getServletContext().getRealPath("/img/gallery");
			//새로 업로드한 파일명 보관할 컬렉션
			List<String> newUpload = new ArrayList<String>();
			//스크립트 넣을 변수 선언
			String msg = "";
			try {
				MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
				
				List<MultipartFile> newMf = mr.getFiles("fname");
				if(newMf!=null) {//업로드한 파일이 있으면
					for(int i=0;i<newMf.size();i++) {
						MultipartFile mf = newMf.get(i);
						String org_filename = mf.getOriginalFilename();
						
						if(org_filename!=null && !org_filename.equals("")) {
							File file = new File(path, org_filename);
							if(file.exists()) {
								for(int j=1;;j++) {
									int p = org_filename.lastIndexOf(".");
									String filenameNoExt = org_filename.substring(0,p);
									String ext = org_filename.substring(p+1);
									String renameFilename = filenameNoExt+"("+j+")."+ext;
									file = new File(path, renameFilename);
									if(!file.exists()) {
										org_filename = renameFilename;
										break;
									}
								}
							}
							mf.transferTo(file);
							newUpload.add(file.getName());
							editFileList.add(file.getName());
						}
					}
				}
				//DB 업데이트 
				for(int i=0;i<editFileList.size();i++) {
					if(i==0) vo.setFilename(editFileList.get(0));
				}
				//세션에 로그인한 아이디
				vo.setStaffid((String)request.getSession().getAttribute("adId"));
				int result = service.gdataUpdate(vo);
				if(result>0) {
					if(vo.getDelFile()!=null) {
						for(String f : vo.getDelFile()) {
							fileDelete(path,f);
						}
					}
					//글내용보기로 페이지 이동
					msg += "<script>";
					msg += "alert('갤러리 글수정 성공하였습니다.');";
					msg += "location.href='/news/galleryView?no="+vo.getNo()+"';";
					msg += "</script>";
				}else {
					throw new Exception();
				}
			}catch(Exception e) {
				e.printStackTrace();
				
				//update 실패
				//새로 업로드된 파일을 지운다.
				for(String f : newUpload) {
					fileDelete(path,f);
				}
				//수정페이지로 이동
				msg += "<script>";
				msg += "alert('갤러리 글수정에 실패하였습니다.');";
				msg += "history.back();";
				msg += "</script>";
			}
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
			headers.add("Content-Type", "text/html; charset=UTF-8");
			
			ResponseEntity<String> entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			return entity;
		}
	//===============================================================================
	//예약관리 페이지 이동
	//예약 내역 가져오기
	@GetMapping("adReservation")
	public ModelAndView adList(){
		
		 ModelAndView mav = new ModelAndView(); 
		 mav.addObject("list",service.adList());
		 mav.setViewName("staff/adReservation");
		 return mav;
	}
	
	//예약취소
	@PostMapping("multiCancel")
	public ResponseEntity<String> reservationMultiCancel(ReservationVO vo) {
		System.out.println(vo.getNoList().size());
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=utf-8");
		
		String msg = "<script>";
		int cnt = service.reservationMultiCancel(vo);
		if(cnt>0) {
			msg += "alert('예약이 취소되었습니다.');";
		}else {
			msg += "alert('실패!');";
		}
		msg += "location.href='/staff/adReservation';</script>";
		
		entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		return entity;
	}
	
	//예약확정
		@PostMapping("multiComplete")
		public ResponseEntity<String> reservationMultiComplete(ReservationVO vo) {
			System.out.println(vo.getNoList().size());
			ResponseEntity<String> entity = null;
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
			headers.add("Content-Type", "text/html; charset=utf-8");
			
			String msg = "<script>";
			int cnt = service.reservationMultiComplete(vo);
			if(cnt>0) {
				msg += "alert('예약이 확정되었습니다.');";
			}else {
				msg += "alert('실패!');";
			}
			msg += "location.href='/staff/adReservation';</script>";
			
			
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			return entity;
		}
		
	//예약변경
		@PostMapping("multiChange")
		public ResponseEntity<String> reservationMultiChange(ReservationVO vo) {
			ResponseEntity<String> entity = null;
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
			headers.add("Content-Type", "text/html; charset=utf-8");
			
			String msg = "<script>";
			int cnt = service.reservationMultiChange(vo);
			if(cnt>0) {
				msg += "alert('예약이 변경되었습니다.');";
			}else {
				msg += "alert('실패!');";
			}
			msg += "location.href='/staff/adReservation';</script>";
			
			
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			return entity;
		}
		
		//문의 내역 가져오기
		@GetMapping("adCheck")
		public ModelAndView adCheck(){
			
			 ModelAndView mav = new ModelAndView();
			 
			 mav.addObject("list",service.adCheck());
			 mav.setViewName("staff/adCheck");
			 return mav;
		}
		
	
	
}
