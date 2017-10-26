package com.sweetk.kwu.lecture.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
    	
    }

    
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
    	mav.addObject("initSortOrder",lvo.getSortOrder1());
    	
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
    
    
    @RequestMapping(value="/lec_board_detail.do", method = {RequestMethod.GET})
    protected ModelAndView lec_board_detail(LectureVo lvo,HttpServletRequest req, HttpSession session, HttpServletResponse response) throws Exception {
    	
    	System.out.println(req.getQueryString());
    	ModelAndView mav = new ModelAndView("/lecture/lec_board_detail");
    	LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);

    	lvo.setId(session.getAttribute("UserId").toString());

    	mapper.update_view_count(lvo);
    	LectureVo info = mapper.lec_board_detail(lvo);
    	
		
		ArrayList<LectureVo> list = mapper.info_file_list(lvo.getLec_board_no());
		ArrayList<LectureVo> r_list = mapper.info_repl_list(lvo.getLec_board_no());
    	
    	
    	mav.addObject("lec_no",lvo.getLec_no());
    	mav.addObject("lec_board_no",lvo.getLec_board_no());
    	mav.addObject("info",info);
		mav.addObject("f_list", list);
		mav.addObject("r_list", r_list);
    	
    	return mav;
    }
    
    @RequestMapping(value = "/lec_board_repl_save.ajax", method = {RequestMethod.POST, RequestMethod.GET})
    protected ModelAndView lec_board_repl_save(LectureVo lvo, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
    	
    	System.out.println(lvo.toString());
    	
    	ModelAndView mav = new ModelAndView("/lecture/lec_board_reply_append");
    	LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);
    	
    	try {
    		lvo.setId(session.getAttribute("UserId").toString());
    		mapper.info_repl_insert(lvo);
    		
    		ArrayList<LectureVo> r_list = mapper.info_repl_list(lvo.getLec_board_no());
    		mav.addObject("list", r_list);
    		
    	} catch(Exception e){
    		e.printStackTrace();
    	}
    	
    	return mav;
    }
    
    
    @RequestMapping("/lec_board_edit.do")
    protected ModelAndView lec_board_edit(LectureVo lvo, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
    	
    	ModelAndView mav = new ModelAndView("/lecture/lec_board_modify");
    	LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);
    	try {

    		LectureVo info = mapper.lec_board_detail(lvo);
    		ArrayList<LectureVo> list = mapper.info_file_list(lvo.getLec_board_no());
    		ArrayList<LectureVo> grouplist = mapper.select_lec_group(lvo);

			mav.addObject("info", info);
			mav.addObject("f_list", list);
			mav.addObject("lec_no",lvo.getLec_no());
			mav.addObject("lec_board_no",lvo.getLec_board_no());
			mav.addObject("grouplist",grouplist);
    	} catch(Exception e){
    		e.printStackTrace();
    	}
    	return mav;
    }
    
    
    
    @RequestMapping("/lec_board_update.do")
    protected void lec_board_update(LectureVo lvo, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
    	
    	LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);
    	
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

			String dNo = (String)multi.getParameter("file_del_no");
			
			System.out.println("dNo : " + dNo);
			
			if(!"".equals(dNo) && dNo != null) {
				dNo = dNo.substring(1);
				String[] tmp = dNo.split(",");
			    lvo.setFile_nos(tmp);
			    
			    mapper.info_file_delete(lvo);
			}
			
			lvo.setLec_board_prt(subj);
			lvo.setTitle(ttl);
			lvo.setCntn(cnt);
			lvo.setTag(tg);
			lvo.setId(session.getAttribute("UserId").toString());
			
			int a = mapper.info_update(lvo);
			
			
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
      	
    	resp.sendRedirect("/lec_board_detail.do?lec_no="+lvo.getLec_no()+"&lec_board_no="+lvo.getLec_board_no());
    }
    
    
    @RequestMapping(value="/lec_stu.do", method = {RequestMethod.GET})
    protected ModelAndView lec_stu(LectureVo lvo,HttpServletRequest req, HttpSession session, HttpServletResponse response) throws Exception {
    	
    	System.out.println(req.getQueryString());
    	ModelAndView mav = new ModelAndView("/lecture/lec_stu");
    	LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);
    	lvo.setId(session.getAttribute("UserId").toString());
    	
    	String lecTitle = mapper.select_lec_title(lvo);
    	ArrayList<LectureVo> grouplist = mapper.select_lec_group(lvo);
    	ArrayList<LectureVo> studentList = mapper.select_lec_group_student(lvo);
    	
    	mav.addObject("lecTitle",lecTitle);
    	mav.addObject("lec_no",lvo.getLec_no());
    	mav.addObject("grouplist",grouplist);
    	mav.addObject("studentList",studentList);
    	
		return mav;
    }
    
    
    @RequestMapping(value="/lec_stu.ajax", method = {RequestMethod.GET})
    protected ModelAndView lec_stu_ajax(LectureVo lvo,HttpServletRequest req, HttpSession session, HttpServletResponse response) throws Exception {
    	
    	System.out.println(req.getQueryString());
    	ModelAndView mav = new ModelAndView("/lecture/lec_stu_temp");
    	LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);
    	lvo.setId(session.getAttribute("UserId").toString());
    	
    	ArrayList<LectureVo> grouplist = mapper.select_lec_group(lvo);
    	ArrayList<LectureVo> studentList = mapper.select_lec_group_student(lvo);
    	
    	mav.addObject("grouplist",grouplist);
    	mav.addObject("studentList",studentList);
    	
		return mav;
    }

    
    @RequestMapping(value="/stu_group_update.ajax", method = {RequestMethod.GET})
    protected void stu_group_update(LectureVo lvo,HttpServletRequest req, HttpSession session, HttpServletResponse response) throws Exception {
    	
    	System.out.println(req.getQueryString());
    	LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);
    	mapper.stu_group_update(lvo);
    }

    @RequestMapping(value="/lec_group_add.ajax", method = {RequestMethod.GET})
    protected void lec_group_add(LectureVo lvo,HttpServletRequest req, HttpSession session, HttpServletResponse response) throws Exception {
    	
    	System.out.println(req.getQueryString());
    	PrintWriter out = response.getWriter();
    	
    	LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);
    	
    	try {
    		int max = mapper.select_max_group_no(lvo); 
//        	System.out.println(max);		
    	    if(max >= 5){
    	    	out.println("-1");
    	    }else{
    	    	lvo.setGroup_no(max+1);
    	    	mapper.insert_group_no(lvo); 
    	    	out.println("1");
    	    }
		} catch (Exception e) {
			out.print("0");
		}finally {
			out.close();
		}
    }

    @RequestMapping(value="/lec_group_del.ajax", method = {RequestMethod.GET})
    protected void lec_group_del(LectureVo lvo,HttpServletRequest req, HttpSession session, HttpServletResponse response) throws Exception {
    	
    	System.out.println(req.getQueryString());
    	PrintWriter out = response.getWriter();
    	
    	LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);
    	
    	try {
    		
    		int max = mapper.select_max_group_no(lvo); 
    		lvo.setGroup_no(max);
    		
    		int belongCnt = mapper.select_group_belong_cnt(lvo);
        	System.out.println(belongCnt);		
    		
    		if(belongCnt <= 0 && max > 1){
    			out.println("1");
     			mapper.delete_group_no(lvo); 
    		}else{
    			out.println("-1");
    		}
    	} catch (Exception e) {
    		out.print("0");
    	}finally {
    		out.close();
    	}
    }
    
    
    @RequestMapping(value = "/excelFileUpload.ajax", method = {RequestMethod.POST,RequestMethod.GET}) 
	protected void excelFileUpload(LectureVo lvo,HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
    	System.out.println("lvo.getLec_no() : " + lvo.getLec_no());
		LectureMapper mapper = sqlSession.getMapper(LectureMapper.class);
		
		String savePath =  req.getServletContext().getRealPath("files");  
		
		System.out.println("savePath :" + savePath);
		
		int sizeLimit = 1024*1024*15; 
		String encType = "utf-8"; 
		MultipartRequest multi = new MultipartRequest(req, savePath, sizeLimit, encType, new DefaultFileRenamePolicy());
		Enumeration formNames = multi.getFileNames(); 		
		
		String formName = (String) formNames.nextElement(); 
        String fileName = multi.getFilesystemName(formName);
	    String OfileName = multi.getOriginalFileName(formName);
	    
	    System.out.println("formName : " + formName);
	    System.out.println("fileName : " +fileName); 
	    System.out.println("OrifileName : " +OfileName); 
	    		
	    if (fileName != null) {
	         File mFile = multi.getFile(formName);
	         long filesize = mFile.length();
	         System.out.println("filesize : "+ filesize);
	    }
	    
	    int cnt=0; // 인서트한 학생 숫자 	    
	    
	    FileInputStream file = new FileInputStream(new File(savePath+"/"+fileName));
	    XSSFWorkbook workbook = new XSSFWorkbook(file);
	    XSSFSheet sheet = workbook.getSheetAt(0);
	    Iterator<Row> rowIterator = sheet.iterator();
      
	    while(rowIterator.hasNext()) {
	    	Row row = rowIterator.next();
	        if(row != null && row.getCell(0) != null){
	       
	             String id = row.getCell(0).getStringCellValue();
	             String name = row.getCell(1).getStringCellValue();
	             
	             System.out.println("id : " + id);
	             System.out.println("name : " + name);
	             
	             // member 테이블에 값이 없으면  1,비번 생성 2,조에 디폴트로  1조로 하고 회원구분 2(학생)  insert
	             lvo.setId(id);
	             lvo.setName(name);
	             lvo.setTempPw(temporaryPassword(8));
	             lvo.setGroup_no(1);
	             lvo.setMem_prt("2");
	             
	             mapper.insert_excel_stu(lvo);
	             mapper.insert_excel_group(lvo);
	             
	             
	             // FIXME 해당 아이디? 이메일로 메일전송
	             Email("master@kcti.co.kr",id,"test","test");
	         }
	    }
	    
	}//.fileUpload
    
    
    
    // 임시 비밀번호 생성
    public static String temporaryPassword(int size) {
    	StringBuffer buffer = new StringBuffer();
    	Random random = new Random();
    	String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9".split(",");
    	for (int i = 0; i < size; i++) {
    		buffer.append(chars[random.nextInt(chars.length)]);
    	}
    	return buffer.toString();
	}
    
    public void Email (String From, String To, String Subject, String Content){
		    
	    try{
	       String from = From;
	       String to = To;
	       String subject = Subject;
	       String content = Content;
	       
	       Properties props = new Properties();
	       props.put("mail.transport.protocol", "smtp"); 
	       props.put("mail.smtp.host", "175.122.1.86"); 
	//       props.put("mail.smtp.host", "mail.knto.or.kr"); 
	       props.put("mail.smtp.port", "25");
	       //props.put("mail.smtp.starttls.enable", "true");
	//       props.put("mail.smtp.starttls.required", "true");
	       
	       //props.put("mail.smtp.ssl.enable", "true");
	       props.put("mail.smtp.auth", "true");
	       //props.put("mail.smtp.socketFactory.port", "25");
	         //props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	         //props.put("mail.smtp.socketFactory.fallback","false");
		 
	       SMTPAuthenticator auth = new SMTPAuthenticator(); // 계정 정보
	       Session mailSession = Session.getInstance(props, auth); // (gmail
	       mailSession.setDebug(true);
	       
	       Message msg = new MimeMessage(mailSession); // 메일 메시지 정보 및 내용을 담음
	       InternetAddress fr = new InternetAddress(from,"문화관광해설사 관리자", "euc-kr");
	       msg.setFrom(fr);
	       
	       msg.setHeader("content-type", "text/html;charset=utf-8");
	         msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
	         msg.setSubject(subject);
	         msg.setSentDate(new Date());
	         
	         MimeMultipart mp = new MimeMultipart();
	         mp.setSubType("related");
	 
	         String html_body = "";
	         MimeBodyPart mbp1= new MimeBodyPart();
	         html_body = content;
	         mbp1.setContent(html_body, "text/html;charset=utf-8");
	         
	         mp.addBodyPart(mbp1);
	 
	         msg.setContent(mp);
	         Transport.send(msg);
		       
		    } catch (Exception e) {
		       e.printStackTrace();
		    }
		    return;
		 }
    
    public class SMTPAuthenticator extends Authenticator {
	   protected PasswordAuthentication getPasswordAuthentication() {
	      String username = "edukor";
	      String password = "adminkto1!";
	      return new PasswordAuthentication(username, password);
	   }
	}
	
}//.class





//end