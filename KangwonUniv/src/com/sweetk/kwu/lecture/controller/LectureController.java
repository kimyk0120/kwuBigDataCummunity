package com.sweetk.kwu.lecture.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;

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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sweetk.kwu.data.mapper.DataMapper;
import com.sweetk.kwu.data.vo.DataVo;
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
    

    /**
     * 강의계획서     
     * @param
     * @param req
     * @param session
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/lecPlan.ajax", method = {RequestMethod.GET})
    protected ModelAndView getLecPlan(LectureVo lvo,HttpServletRequest req, HttpSession session, HttpServletResponse response) throws Exception {
    	
    	System.out.println(req.getQueryString());
    	ModelAndView mav = new ModelAndView("/lecture/lec_modal_temp");
    	LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);
		String lecPlan = mapper.select_lec_plan(lvo);
		mav.addObject("lec_plan",lecPlan);
		return mav;
    	
    }//.lecList

    
    /**
     * 강의 보드 리스트 -  확률 및 통계 
     * @param lvo
     * @param req
     * @param session
     * @param response
     * @return
     * @throws Exception
     */
    @Transactional
    @RequestMapping(value="/lec_list_sub.do", method = {RequestMethod.GET})
    protected ModelAndView lec_list_sub(LectureVo lvo,HttpServletRequest req, HttpSession session, HttpServletResponse response) throws Exception {
    	
    	System.out.println(req.getQueryString());
    	ModelAndView mav = new ModelAndView("/lecture/lec_list_sub");
    	LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);
    	
    	ArrayList<LectureVo> grouplist = null;
    	ArrayList<LectureVo> boardList = null;
    	
    	String pageNum = req.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")|| pageNum.equals("0") ){
			 lvo.setCurrentPage(0);			 
		}else{
			lvo.setCurrentPage(Integer.parseInt(pageNum)*lvo.getSubPageSize());
		}
    	
    	lvo.setId(session.getAttribute("UserId").toString());
    	String lecTitle = mapper.select_lec_title(lvo);
    	grouplist = mapper.select_lec_group(lvo);
    	boardList = mapper.select_lec_board(lvo);
    	
    	mav.addObject("lec_no",lvo.getLec_no());
    	mav.addObject("lecTitle",lecTitle);
    	mav.addObject("grouplist",grouplist);
    	mav.addObject("boardList",boardList);
    	mav.addObject("pageNum",lvo.getCurrentPage());
    	
    	return mav;
    }
    
    /**
     * 강의 보드 리스트 ajax
     * @param lvo
     * @param req
     * @param session
     * @param response
     * @return
     */
    @RequestMapping(value="/lec_list_sub.ajax", method = {RequestMethod.GET,RequestMethod.POST})
    protected ModelAndView lec_list_sub_ajax(LectureVo lvo,HttpServletRequest req, HttpSession session, HttpServletResponse response){
    	
    	System.out.println(req.getQueryString());
    	ModelAndView mav = new ModelAndView("/lecture/lec_list_sub_append_temp");
    	LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);
    	ArrayList<LectureVo> boardList = null;

    	String pageNum = req.getParameter("pageNum");
    	if (pageNum == null || pageNum.equals("")|| pageNum.equals("0") ){
    		lvo.setCurrentPage(0);			 
    	}else{
    		lvo.setCurrentPage(Integer.parseInt(pageNum)*lvo.getSubPageSize());
    	}
    	try {    		
    		lvo.setLoginId(session.getAttribute("UserId").toString());
    		
    		boardList = mapper.select_lec_board(lvo);
    		mav.addObject("boardList",boardList);
    		
    		System.out.println(lvo.toString());
    		
    	} catch(Exception e){
    		e.printStackTrace();
    	}
    	return mav;
    }//.lecList
    
    
    @RequestMapping(value="/likeSet.ajax", method = {RequestMethod.GET})
    protected void likeDelAjax(LectureVo lvo,HttpServletRequest req, HttpSession session, HttpServletResponse response) throws Exception {
    	
    	System.out.println(req.getQueryString());
    	LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);
    	lvo.setId(session.getAttribute("UserId").toString());
    	
    	String flag = req.getParameter("flag");
    	if(flag.equals("N")){
    		mapper.likeDel(lvo);
    		mapper.likeMinus(lvo);
    	}else{
    		mapper.likeSet(lvo);
    		mapper.likePlus(lvo);
    	}
    }
    

    @RequestMapping(value="/lec_board_create.do", method = {RequestMethod.GET})
    protected ModelAndView lec_board_create(LectureVo lvo,HttpServletRequest req, HttpSession session, HttpServletResponse response) throws Exception {
    	
    	System.out.println(req.getQueryString());
    	ModelAndView mav = new ModelAndView("/lecture/lec_board_create");
    	LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);
    	ArrayList<LectureVo> grouplist = null;

    	lvo.setId(session.getAttribute("UserId").toString());
    	
    	grouplist = mapper.select_lec_group(lvo);
    	
    	mav.addObject("lec_no",lvo.getLec_no());
    	mav.addObject("grouplist",grouplist);
    	
    	return mav;
    }
    
    
    @RequestMapping("/lec_board_save.do")
    protected void lec_board_save(LectureVo lvo, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
    	
    	ModelAndView mav = new ModelAndView("/lecture/lec_list_sub");
    	LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);
    	
    	ArrayList<LectureVo> grouplist = null;
    	ArrayList<LectureVo> boardList = null;
    	
    	
    	String strSaveDir = "/files/board/";
    	
    	String savePath = req.getRealPath(strSaveDir); 
		
		File targetDir = null;
		targetDir = new File(savePath);
		if(!targetDir.isDirectory()){
			targetDir.mkdirs();
		}
		
		int sizeLimit = 100 * 1024 * 1024 / 2; 
		String encType = "UTF-8"; 
				
		MultipartRequest multi = new MultipartRequest(req, savePath, sizeLimit, encType, new DefaultFileRenamePolicy());
		
		Enumeration formNames = multi.getFileNames();
    	
    	try {
    		
    		String subj = (String)multi.getParameter("subject");
			String ttl = (String)multi.getParameter("title");
			String cnt = (String)multi.getParameter("cntn");
			String tg = (String)multi.getParameter("tags");
			String fCnt = (String)multi.getParameter("file_cnt");
			
			lvo.setLec_board_prt(subj);
			lvo.setTitle(ttl);
			lvo.setCntn(cnt);
			lvo.setTag(tg);
			lvo.setId(session.getAttribute("UserId").toString());
			
			int a = mapper.info_insert(lvo);
			
			
			String fileName = "";
			String newFile = "";

			for(int i=0; i < Integer.parseInt(fCnt); i++) {
			
					fileName = multi.getFilesystemName("uploadBtn"+(i+1));
					String OfileName = multi.getOriginalFileName("uploadBtn"+(i+1));
					
					System.out.println("fileName : " + fileName);
					System.out.println("OfileName : " + OfileName);
					
					if(!"".equals(fileName) && fileName != null) {
					
						newFile = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
						int index = fileName.indexOf(".");
						String filename1 = fileName.substring(index, fileName.length());// .확장자만 남기고 다 삭제
						newFile = newFile + filename1;
			
						File file=new File(savePath+"/"+fileName); //원본파일부르기
						file.renameTo(new File(savePath+"/"+newFile)); //파일이름변경
						
						lvo.setFile_nm(newFile);
						lvo.setOrg_file_nm(fileName);
						
						mapper.info_file_insert(lvo);
					}
			}
			
    	} catch(Exception e){
    		e.printStackTrace();
    	}
      	
    	resp.sendRedirect("/lec_list_sub.do?lec_no="+lvo.getLec_no());
    }
    
    

	
}//.class
