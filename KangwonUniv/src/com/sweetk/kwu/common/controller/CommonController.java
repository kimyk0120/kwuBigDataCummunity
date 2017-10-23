package com.sweetk.kwu.common.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sweetk.kwu.common.mapper.CommonMapper;
import com.sweetk.kwu.common.vo.CommonVo;

@Controller
public class CommonController {
	
	Logger log = Logger.getLogger(CommonController.class);
	
	@Autowired
    private SqlSession sqlSession;
	
	
    @Autowired 
    private PlatformTransactionManager transactionManager;
	
	@RequestMapping("/")
	protected ModelAndView main_page(HttpServletRequest req, HttpSession session, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("main");
		
		return mav;
	}
	@RequestMapping("/login.do")
	protected ModelAndView login(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("login");
		
		return mav;
	}
	
	@RequestMapping("/join.do")
	protected ModelAndView join(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("join");
		
		return mav;
	}

	@RequestMapping("/login_check.do")
	protected ModelAndView login_check(CommonVo cvo, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("login");
		CommonMapper mapper = sqlSession.getMapper(CommonMapper.class);
		
		CommonVo info = new CommonVo();
		
		try {
		
			int cnt = mapper.login_check(cvo);
			
			if(cnt > 0) {
				
				info = mapper.user_info(cvo);
				
				if(info != null) {
					
					session.setAttribute("UserId", info.getId());
					session.setAttribute("UserEmail", info.getId());
					session.setAttribute("UserNm", info.getName());
					session.setAttribute("UserAuth", info.getMem_prt());
					session.setAttribute("UserImg", info.getImg_nm());
					
					resp.sendRedirect("main.do");
				}
				
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping("/main.do")
	protected ModelAndView main( HttpServletRequest req, HttpSession session, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("main");
		
		return mav;
	}
	
	@RequestMapping("/join_save.do")
    protected ModelAndView join_save(CommonVo cvo, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView("login");
		CommonMapper mapper = sqlSession.getMapper(CommonMapper.class);
		
		String strSaveDir = "/files/user/";
    	
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
    		
    		String nm = (String)multi.getParameter("name");
			String mail = (String)multi.getParameter("email");
			String pwd = (String)multi.getParameter("password");
			String tg = (String)multi.getParameter("tags");
			String chk = (String)multi.getParameter("chk");
			
			cvo.setId(mail);
			cvo.setPassword(pwd);
			cvo.setEmail(mail);
			cvo.setName(nm);
			cvo.setAgree_yn(chk);
			cvo.setMem_prt("3");  // 일반
			
			String fileName = multi.getFilesystemName("file-input");
			String OfileName = multi.getOriginalFileName("file-input");
			String newFile = "";
			
			if(!"".equals(fileName) && fileName != null) {
				
				newFile = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
				int index = fileName.indexOf(".");
				String filename1 = fileName.substring(index, fileName.length());// .확장자만 남기고 다 삭제
				newFile = newFile + filename1;
	
				File file=new File(savePath+"/"+fileName); //원본파일부르기
				file.renameTo(new File(savePath+"/"+newFile)); //파일이름변경
				
				cvo.setImg_nm(newFile);
				cvo.setImg_org_nm(fileName);
			}
			
			mapper.user_insert(cvo);
			
		} catch(Exception e){
    		e.printStackTrace();
    	}
    	
    	return mav;
	
	}
	
}
