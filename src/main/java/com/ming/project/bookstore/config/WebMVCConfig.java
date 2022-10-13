package com.ming.project.bookstore.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ming.project.bookstore.common.PermissionInterceptor;

public class WebMVCConfig implements WebMvcConfigurer {

	@Autowired
	private PermissionInterceptor interceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(interceptor)
		.addPathPatterns("/**")
		.excludePathPatterns("/static/**", "/images/**", 
				"/user/signout");
	}
}
