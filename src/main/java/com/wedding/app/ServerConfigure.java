package com.wedding.app;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.wedding.app.interceptor.LoginInterceptor;
import com.wedding.app.interceptor.AdLoginInterceptor;

@Configuration
public class ServerConfigure implements WebMvcConfigurer {
	//인터셉트가 처리될 매핑주소를 List컬렉션으로 작성한다.
	private static final List<String> URL_PATTERNS = Arrays.asList(
			"/reservation/consult","/reservation/consultOk",
			"/reservation/check", "/reservation/modify",
			"/reservation/modifyOk"
			);
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns(URL_PATTERNS);
		registry.addInterceptor(new AdLoginInterceptor()).addPathPatterns(
				"/staff/admin","/staff/adEvent","/staff/adEventOk",
				"/staff/adEventEdit/*","/staff/adEventEditOk",
				"/staff/adBoard","/staff/adBoradOk","/staff/adBoardEdit/*",
				"/staff/adBoardEditOk","/staff/adGallery","/staff/adGalleryOk",
				"/staff/adGelleryEdit/*","/staff/adGalleryEditOk",
				"/staff/adReservation","/staff/multiCancle","/staff/multiComplete",
				"/staff/multiChange","/staff/adCheck"
				);
		
	}
}
