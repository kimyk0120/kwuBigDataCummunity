package com.sweetk.kwu.lecture.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("LectureController")
public class LectureController {
	
	Logger log = Logger.getLogger(LectureController.class);
	
	@Autowired
    private SqlSession sqlSession;
	
	
    @Autowired 
    private PlatformTransactionManager transactionManager;
	
    
    // 강의 리스트 FIXME 
	@RequestMapping("/lecList.do")
	protected ModelAndView main_page(HttpServletRequest req, HttpSession session, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("/lecture/lec_list");
		
		
		
		
		
		return mav;
	}
	
	
	
}//.class
