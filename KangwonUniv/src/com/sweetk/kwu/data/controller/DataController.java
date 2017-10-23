package com.sweetk.kwu.data.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sweetk.kwu.data.mapper.DataMapper;
import com.sweetk.kwu.data.vo.DataVo;

@Controller
public class DataController {

	Logger log = Logger.getLogger(DataController.class);
			
	@Autowired
    private SqlSession sqlSession;
	
	
    @Autowired 
    private PlatformTransactionManager transactionManager;
    
    @RequestMapping("/info_list.do")
    protected ModelAndView info_list(DataVo dvo, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
    	
    	ModelAndView mav = new ModelAndView("info/info_list");
    	DataMapper mapper = sqlSession.getMapper(DataMapper.class);
    	
    	/*if (session.getAttribute("UserId") == null || session.getAttribute("authNo") == null) { 
			resp.sendRedirect("login.do");
		}*/
    	
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
		
		ArrayList<DataVo> list = null;
		
		String srchNm = req.getParameter("srch_nm");
		String subject = req.getParameter("subject");
		String odr = req.getParameter("order_prt");
		
		if("".equals(odr) || odr == null) {
			odr = "1";
		}
		
    	try {
    		
    		dvo.setBoard_prt("1"); // 정보제공 (1)
    		dvo.setOrder_prt(odr); // 등록순 (기본) (1)
    		dvo.setSrch_nm(srchNm);
    		dvo.setSubject(subject);
    		
    		count = mapper.info_list_count(dvo);
    		
    		if (count > 0) {
    			if(endRow>count) endRow = count;
    			dvo.setStartRow(startRow);
    			dvo.setEndRow(pageSize);
    			list = mapper.info_list(dvo);
    		} else {
    			list = null;
    		}
    		
    		/*number=count-(currentPage-1)*pageSize;
			pageGroupCount =count/(pageSize*pageGroupSize)+( count %(pageSize*pageGroupSize) == 0 ? 0 : 1);
			numPageGroup = (int)Math.ceil((double)currentPage/pageGroupSize);*/
			
			mav.addObject("list", list);
			mav.addObject("srch", dvo);
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
    
    @RequestMapping(value = "/info_list_append.ajax", method = {RequestMethod.POST, RequestMethod.GET})
    protected ModelAndView info_list_append(DataVo dvo, HttpServletRequest req, HttpServletResponse resp, HttpSession session
    		,@RequestParam(value="odr",required=false) String odr
    		,@RequestParam(value="srch_nm",required=false) String srchNm
    		,@RequestParam(value="subject",required=false) String subject
    		,@RequestParam(value="pageNum",required=false) String pageNum
    		,@RequestParam(value="count",required=false) int count) throws Exception {
    	log.info(getClass());
    	
    	ModelAndView mav = new ModelAndView("info/info_list_append");
    	DataMapper mapper = sqlSession.getMapper(DataMapper.class);
    	
    	/*if (session.getAttribute("UserId") == null || session.getAttribute("authNo") == null) { 
			resp.sendRedirect("login.do");
		}*/
    	
    	System.out.println("odr : " + odr);
    	System.out.println("pageNum : " + pageNum);
    	
    	// paging 
    	int pageSize = 5;
    	/*int pageGroupSize = 5;*/
    	
    	if (pageNum == null || pageNum == "") {
    		pageNum = "1";
    	}
    	
    	int currentPage = Integer.parseInt(pageNum);
    	int startRow = (currentPage - 1) * pageSize;
    	int endRow = currentPage * pageSize;
    	/*int number=0;
    	int pageGroupCount = 0;
    	int numPageGroup = 0;*/
    	
    	ArrayList<DataVo> list = null;
    	
    	try {
    		
    		dvo.setBoard_prt("1"); // 정보제공 (1)
    		dvo.setOrder_prt(odr); // 등록순 (기본) (1)
    		dvo.setSrch_nm(srchNm);
    		dvo.setSubject(subject);
    		
    		count = mapper.info_list_count(dvo);
    		 
    		if (count > 0) {
    			if(endRow>count) endRow = count;
    			dvo.setStartRow(startRow);
    			dvo.setEndRow(pageSize);
    			list = mapper.info_list(dvo);
    		} else {
    			list = null;
    		}
    		
    		/*number=count-(currentPage-1)*pageSize;
    		pageGroupCount =count/(pageSize*pageGroupSize)+( count %(pageSize*pageGroupSize) == 0 ? 0 : 1);
    		numPageGroup = (int)Math.ceil((double)currentPage/pageGroupSize);*/
    		
    		mav.addObject("list", list);
    		mav.addObject("srch", dvo);
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
    
    @RequestMapping("/info_create.do")
    protected ModelAndView info_create(DataVo dvo, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
    	
    	ModelAndView mav = new ModelAndView("info/info_create");
    	DataMapper mapper = sqlSession.getMapper(DataMapper.class);
    	
    	/*if (session.getAttribute("UserId") == null || session.getAttribute("authNo") == null) { 
			resp.sendRedirect("login.do");
		}*/
    	
    	try {
    		
    		mav.addObject("list", null);
    		
    	} catch(Exception e){
    		e.printStackTrace();
    	}
    	
    	return mav;
    }
    
    @RequestMapping("/info_save.do")
    protected ModelAndView info_save(DataVo dvo, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
    	
    	ModelAndView mav = new ModelAndView("info/info_detail");
    	DataMapper mapper = sqlSession.getMapper(DataMapper.class);
    	
    	/*if (session.getAttribute("UserId") == null || session.getAttribute("authNo") == null) { 
			resp.sendRedirect("login.do");
		}*/
    	
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
			
			dvo.setBoard_prt("1"); // 정보창고
			dvo.setSubject(subj);
			dvo.setTitle(ttl);
			dvo.setCntn(cnt);
			dvo.setTag(tg);
			dvo.setReg_id("test");
			
			int a = mapper.info_insert(dvo);
			
			System.out.println("a : " + a);
			System.out.println("b : " + dvo.getBoard_no());
			System.out.println("fCnt : " + fCnt);
			
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
						
						dvo.setFile_nm(newFile);
						dvo.setOrg_file_nm(fileName);
						
						mapper.info_file_insert(dvo);
					}
			}
			
			
			DataVo info = new DataVo();
			
			info = mapper.info_detail(dvo.getBoard_no());
			
			ArrayList<DataVo> list = mapper.info_file_list(dvo.getBoard_no());
			
			mav.addObject("info", info);
			mav.addObject("f_list", list);
			mav.addObject("r_list", "");
    		
    	} catch(Exception e){
    		e.printStackTrace();
    	}
    	
    	return mav;
    }
    
    
    @RequestMapping("/info_detail.do")
    protected ModelAndView info_detail(DataVo dvo, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
    	
    	ModelAndView mav = new ModelAndView("info/info_detail");
    	DataMapper mapper = sqlSession.getMapper(DataMapper.class);
    	
    	/*if (session.getAttribute("UserId") == null || session.getAttribute("authNo") == null) { 
			resp.sendRedirect("login.do");
		}*/
    	
    	String no = req.getParameter("b_no");
    	
    	System.out.println("no : " + no);
    	
    	try {
    		
    		DataVo info = new DataVo();
    		
    		mapper.info_view_count( Integer.parseInt(no) );
			info = mapper.info_detail( Integer.parseInt(no) );
			
			ArrayList<DataVo> list = mapper.info_file_list(Integer.parseInt(no));
			ArrayList<DataVo> r_list = mapper.info_repl_list(Integer.parseInt(no));
			
			/*String t = info.getTag();
			String[] ar = t.split(",");
			
			ArrayList<String> arr = new ArrayList<String>();

			for (String r : ar) {
				arr.add(r);
			}*/

			mav.addObject("info", info);
			mav.addObject("f_list", list);
			mav.addObject("r_list", r_list);
			mav.addObject("srch", dvo);
    		
    	} catch(Exception e){
    		e.printStackTrace();
    	}
    	
    	return mav;
    }
    
    @RequestMapping(value = "/info_repl_save.ajax", method = {RequestMethod.POST, RequestMethod.GET})
    protected ModelAndView info_repl_save(DataVo dvo, HttpServletRequest req, HttpServletResponse resp, HttpSession session
    		,@RequestParam(value="b_no",required=false) String bNo
    		,@RequestParam(value="repl_cntn",required=false) String replCntn) throws Exception {
    	log.info(getClass());
    	
    	ModelAndView mav = new ModelAndView("info/info_repl_append");
    	DataMapper mapper = sqlSession.getMapper(DataMapper.class);
    	
    	/*if (session.getAttribute("UserId") == null || session.getAttribute("authNo") == null) { 
			resp.sendRedirect("login.do");
		}*/
    	
    	try {
    		dvo.setBoard_no(Integer.parseInt(bNo));
    		dvo.setRepl_cntn(replCntn);
    		dvo.setReg_id("test");
    		mapper.info_repl_insert(dvo);
    		
    		ArrayList<DataVo> r_list = mapper.info_repl_list(Integer.parseInt(bNo));
    		
    		mav.addObject("list", r_list);
    		
    	} catch(Exception e){
    		e.printStackTrace();
    	}
    	
    	return mav;
    }
    
    @RequestMapping("/info_edit.do")
    protected ModelAndView info_edit(DataVo dvo, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
    	
    	ModelAndView mav = new ModelAndView("info/info_edit");
    	DataMapper mapper = sqlSession.getMapper(DataMapper.class);
    	
    	/*if (session.getAttribute("UserId") == null || session.getAttribute("authNo") == null) { 
			resp.sendRedirect("login.do");
		}*/
    	
    	String no = req.getParameter("b_no");
    	
    	try {
    		
    		DataVo info = new DataVo();
    		
			info = mapper.info_detail( Integer.parseInt(no) );
			
			ArrayList<DataVo> list = mapper.info_file_list(Integer.parseInt(no));

			mav.addObject("info", info);
			mav.addObject("f_list", list);
			mav.addObject("srch", dvo);
    		
    	} catch(Exception e){
    		e.printStackTrace();
    	}
    	
    	return mav;
    }
    
    @RequestMapping("/info_update.do")
    protected ModelAndView info_update(DataVo dvo, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
    	
    	ModelAndView mav = new ModelAndView("info/info_detail");
    	DataMapper mapper = sqlSession.getMapper(DataMapper.class);
    	
    	/*if (session.getAttribute("UserId") == null || session.getAttribute("authNo") == null) { 
			resp.sendRedirect("login.do");
		}*/
    	
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
    		
    		String b_no = (String)multi.getParameter("board_no");
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
			    dvo.setFile_nos(tmp);
			    mapper.info_file_delete(dvo);
			} 
			
			dvo.setBoard_no(Integer.parseInt(b_no));
			dvo.setSubject(subj);
			dvo.setTitle(ttl);
			dvo.setCntn(cnt);
			dvo.setTag(tg);
			dvo.setReg_id("test");
			
			mapper.info_update(dvo);
			
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
						
						dvo.setFile_nm(newFile);
						dvo.setOrg_file_nm(fileName);
						
						mapper.info_file_insert(dvo);
					}
			}
			
			
			DataVo info = new DataVo();
			
			info = mapper.info_detail(dvo.getBoard_no());
			
			ArrayList<DataVo> list = mapper.info_file_list(dvo.getBoard_no());
			ArrayList<DataVo> r_list = mapper.info_repl_list(dvo.getBoard_no());
			
			mav.addObject("info", info);
			mav.addObject("f_list", list);
			mav.addObject("r_list", r_list);
    		
    	} catch(Exception e){
    		e.printStackTrace();
    	}
    	
    	return mav;
    }
    
}
