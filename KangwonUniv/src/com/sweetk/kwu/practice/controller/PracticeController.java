package com.sweetk.kwu.practice.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

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

import com.sweetk.kwu.data.mapper.DataMapper;
import com.sweetk.kwu.practice.mapper.PracticeMapper;
import com.sweetk.kwu.practice.vo.PracticeVo;

@Controller
public class PracticeController {
	
	Logger log = Logger.getLogger(PracticeController.class);
	
	@Autowired
    private SqlSession sqlSession;
	
	
    @Autowired 
    private PlatformTransactionManager transactionManager;
    
    @RequestMapping("/practice_list.do")
    protected ModelAndView practice_list(PracticeVo pvo, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
    	
    	ModelAndView mav = new ModelAndView("practice/practice_list");
    	PracticeMapper mapper = sqlSession.getMapper(PracticeMapper.class);
    	
    	// paging 
    	int pageSize = 5;
		String pageNum =req.getParameter("pageNum");
		
		if (pageNum == null || pageNum == "") {
			 pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize;
		int endRow = currentPage * pageSize;
		int count = 0;
		
		ArrayList<PracticeVo> list = null;
		
		String srchNm = req.getParameter("srch_nm");
		String prt = req.getParameter("prt");
		String odr = req.getParameter("order_prt");
		
		if("".equals(odr) || odr == null) {
			odr = "1";
		}
		
		try {
			
			pvo.setOrder_prt(odr);
			pvo.setPrt(prt);
			pvo.setSrch_nm(srchNm);
			
			count = mapper.practice_list_count(pvo);
			
			if (count > 0) {
    			if(endRow>count) endRow = count;
    			pvo.setStartRow(startRow);
    			pvo.setEndRow(pageSize);
    			list = mapper.practice_list(pvo);
    		} else {
    			list = null;
    		}
			
			mav.addObject("list", list);
			mav.addObject("srch", pvo);
	    	mav.addObject("currentPage", currentPage);
			mav.addObject("startRow", startRow);
			mav.addObject("endRow", endRow);
			mav.addObject("pageSize", pageSize);
			mav.addObject("count", count);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return mav;
    }
    
    
    @RequestMapping("/practice_create.do")
    protected ModelAndView practice_create(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
    	
    	ModelAndView mav = new ModelAndView("practice/practice_create");

    	
    	try {
    		
    		Date d = new Date();
			
    		Calendar myCal = Calendar.getInstance();
    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	    myCal.setTime(d);    
    	    String now_ym = sdf.format(d);
    	    myCal.add(Calendar.MONTH, +1);    
    	    String next_ym = sdf.format( myCal.getTime());
    		
			
    		System.out.println("now_ym : " + now_ym);
    		System.out.println("next_ym : " + next_ym);
    		
    		
    		mav.addObject("now_ym", now_ym);
    		mav.addObject("next_ym", next_ym);
    		
    		
    	} catch(Exception e){
    		e.printStackTrace();
    	}
    	
    	return mav;
    	
    }
    
}
