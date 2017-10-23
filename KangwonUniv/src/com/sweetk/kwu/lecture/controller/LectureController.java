package com.sweetk.kwu.lecture.controller;

import java.util.ArrayList;

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

import com.sweetk.kwu.lecture.mapper.LectureMapper;
import com.sweetk.kwu.lecture.vo.LectureVo;
import com.sweetk.kwu.practice.vo.PracticeVo;

@Controller("LectureController")
public class LectureController {
	
	Logger log = Logger.getLogger(LectureController.class);
	
	@Autowired
    private SqlSession sqlSession;
	
	
    @SuppressWarnings("unused")
	@Autowired 
    private PlatformTransactionManager transactionManager;
	
    
    /**
     * 강의 리스트 
     * @param lvo
     * @param req
     * @param session
     * @param response
     * @return
     */
	@RequestMapping("/lecList.do")
	protected ModelAndView main_page(LectureVo lvo,HttpServletRequest req, HttpSession session, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("/lecture/lec_list");
		LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);
		
		// paging 
    	int pageSize = 10;
		String pageNum = req.getParameter("pageNum");
		
		if (pageNum == null || pageNum == "") {
			 pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize;
		int endRow = currentPage * pageSize;
		int count = 0;
		
		ArrayList<LectureVo> list = null;
		
//		String srchNm = req.getParameter("srch_nm");
//		String prt = req.getParameter("prt");
//		String odr = req.getParameter("order_prt");
		
//		if("".equals(odr) || odr == null) {
//			odr = "1";
//		}
//		
		try {
//			
//			pvo.setOrder_prt(odr);
//			pvo.setPrt(prt);
//			pvo.setSrch_nm(srchNm);
//			
			//count = mapper.practice_list_count(pvo);
			count = mapper.lecture_list_count();
			System.out.println("leture count : " + count);			
			
			
			if (count > 0) {
    			//if(endRow>count) endRow = count;
    			//pvo.setStartRow(startRow);
    			//pvo.setEndRow(pageSize);
    			list = mapper.lecture_list(lvo);
    			
    			//for(LectureVo vo : list){ System.out.println(vo.toString());}
    				
    		} else {
    			list = null;
    		}
			
//			mav.addObject("list", list);
//			mav.addObject("srch", pvo);
//	    	mav.addObject("currentPage", currentPage);
//			mav.addObject("startRow", startRow);
//			mav.addObject("endRow", endRow);
//			mav.addObject("pageSize", pageSize);
//			mav.addObject("count", count);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		return mav;
	}//.lecList
	
	
	
}//.class
