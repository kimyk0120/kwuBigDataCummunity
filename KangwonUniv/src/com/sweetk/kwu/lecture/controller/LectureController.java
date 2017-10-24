package com.sweetk.kwu.lecture.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sweetk.kwu.lecture.mapper.LectureMapper;
import com.sweetk.kwu.lecture.vo.LectureVo;

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
    @Transactional
	@RequestMapping("/lecList.do")
	protected ModelAndView main_page(LectureVo lvo,HttpServletRequest req, HttpSession session, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("/lecture/lec_list");
		LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);
		ArrayList<LectureVo> list = null;
		
		//FIXME test
		session.setAttribute("UserId", "kimyk");
		
		// paging     	
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")|| pageNum.equals("0") ){
			 lvo.setCurrentPage(0);			 
		}else{
			lvo.setCurrentPage(Integer.parseInt(pageNum)*lvo.getPageSize());
		}
		try {
			int currentYear = Calendar.getInstance().get(Calendar.YEAR);
			lvo.setYear(Integer.toString(currentYear));
			lvo.setTerm("1");
			lvo.setLoginId(session.getAttribute("UserId").toString());
			
			int count = mapper.lecture_list_count();
			
			if (count > 0) {
    			list = mapper.lecture_list(lvo);
    		} else {
    			list = null;
    		}
			mav.addObject("list", list);
			mav.addObject("pageNum",lvo.getCurrentPage());
			
		} catch(Exception e){
			e.printStackTrace();
		}
		return mav;
	}//.lecList
    
    
    /**
     * 강의 리스트 더보기 선택
     * @param lvo
     * @param req
     * @param session
     * @param response
     * @return
     */
    @RequestMapping("/lecList.ajax")
    protected ModelAndView lecListajax(LectureVo lvo,HttpServletRequest req, HttpSession session, HttpServletResponse response
    		,@RequestParam(value="selectSemester",defaultValue="1") String selectSemester
    		,@RequestParam(value="selectYear") String selectYear) {
    	
    	System.out.println(req.getQueryString());
    	ModelAndView mav = new ModelAndView("/lecture/lec_list_append_temp");
    	LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);
    	ArrayList<LectureVo> list = null;
    	// paging     	
    	String pageNum = req.getParameter("pageNum");
    	if (pageNum == null || pageNum.equals("")|| pageNum.equals("0") ){
    		lvo.setCurrentPage(0);			 
    	}else{
    		lvo.setCurrentPage(Integer.parseInt(pageNum)*lvo.getPageSize());
    	}
    	
    	try {    		
    		lvo.setYear(selectYear);
    		lvo.setTerm(selectSemester);
    		lvo.setLoginId(session.getAttribute("UserId").toString());
    		    		    		
    		int count = mapper.lecture_list_count();
    		if (count > 0) {
    			list = mapper.lecture_list(lvo);
    		} else {
    			list = null;
    		}
    		mav.addObject("list", list);    		
    		
    	} catch(Exception e){
    		e.printStackTrace();
    	}
    	return mav;
    }//.lecList

   /**
    * 강의 등록 페이지
    * @param lvo
    * @param req
    * @param session
    * @param response
    * @return
    */
  
    @RequestMapping("/lecCreate.do")
    protected ModelAndView lecCreatePage(LectureVo lvo,HttpServletRequest req, HttpSession session, HttpServletResponse response) {
    	ModelAndView mav = new ModelAndView("/lecture/lec_regi");
    	return mav;
    }//.lecList
	
    
    @Transactional    
    @RequestMapping(value="/lecCreate.ajax", method = {RequestMethod.GET,RequestMethod.POST})
    protected void lecCreateAjax(LectureVo lvo,HttpServletRequest req, HttpSession session, HttpServletResponse response) throws Exception {
    	
    	System.out.println(lvo.toString());
    	PrintWriter pw = response.getWriter();
    	LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);
    	
		try {
			lvo.setId(session.getAttribute("UserId").toString());
			
			int flag = mapper.lec_create(lvo);
			if(flag == 1){
				lvo.setGroup_no(1);
				mapper.insert_lec_group(lvo);
			}
			
			pw.write("1");
		} catch (Exception e) {
			pw.write("0");
		}finally {
			pw.close();
		}
    	
    }//.lecList
    
    
    
    
    
    
	
}//.class
