package com.sweetk.kwu;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
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

@Controller
public class HomeController {
	
	
	@RequestMapping("/home2.do")
	protected ModelAndView home2(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("home2");
		
		return mav;
	}
	
	
	@RequestMapping("/board_save.do")
    protected ModelAndView board_save (HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("editor/test");
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1024 * 100);
		
		
		String strSaveDir = request.getServletContext().getRealPath("/");
		//String strSaveDir = "/files/test/";
		
		factory.setRepository(new File(strSaveDir));
		
		ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
		servletFileUpload.setHeaderEncoding("utf-8");
		servletFileUpload.setSizeMax(1024 * 1024 * 200);
		
		String savePath = request.getRealPath(strSaveDir); 
		
		java.util.List fileList = null;
		
		try {
			fileList = servletFileUpload.parseRequest(request);
		} catch (Exception ex) {
			System.out.println("ex : " + ex.getMessage());
		}
		
		String nm = "";
		
		for (int i = 0; i < fileList.size(); i++) {
			FileItem fileItem = (FileItem) fileList.get(i);
			if (fileItem.isFormField()) {
				if (fileItem.getFieldName().equals("userName")) {
					nm = fileItem.getString();
				}
			}
		}
		
		System.out.println("nm : " + nm );
		
		ArrayList<File> attachFileList = new ArrayList<File>();
		
		File targetDir = null;
		
		for (int i = 0; i < fileList.size(); i++) {
			FileItem fileItem = (FileItem) fileList.get(i);
			if (!fileItem.isFormField()) {
				
				int idx = fileItem.getName().lastIndexOf("\\");
				if (idx == -1) {
					idx = fileItem.getName().lastIndexOf("/");
				}					
				String fileNameAttach = fileItem.getName().substring(idx + 1);
				
				System.out.println("FieldName : " + fileItem.getFieldName());
				
				if (fileItem.getSize() > 0) {
					
					System.out.println("size : " + fileItem.getSize()/1024 );
					
					System.out.println("fileNameAttach : " + fileNameAttach);
					
					String strSaveDir2 = "";
					strSaveDir2 = strSaveDir + "files/test/";
					targetDir = new File(strSaveDir2);
					if(!targetDir.isDirectory()){
						targetDir.mkdirs();
					}
					
					File uploadedFile = new File(strSaveDir2, fileNameAttach);
					if ( uploadedFile.exists()){
						for(int k=0; true; k++){
							String[] filePart = getFileNamePart(fileNameAttach);
							
							uploadedFile = new File(strSaveDir2, filePart[0] + "_" + k + "." + filePart[1]);
							
							System.out.println("uploadedFile : " + uploadedFile);
							
							if(!uploadedFile.exists()){ 
								fileNameAttach = filePart[0] + "_" + k + "." + filePart[1];
								break;
							}
						}
					}				
					
					attachFileList.add(uploadedFile);
					fileItem.write(uploadedFile);							  
					uploadedFile = null;
					
				} 
			}
		}
		/*try{
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}*/
		
		return mav;
    }
	
	@RequestMapping("/file_delete")
	protected void file_delete (HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/xml; charset=utf-8");
		PrintWriter out = null;
		out = new PrintWriter(response.getWriter()); 
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1024 * 100);
		
		String strSaveDir = request.getServletContext().getRealPath("/");
		
		
		String nm = (String)request.getParameter("file_nm");
		
		System.out.println("nm : " + nm);
		
		try {
			
			String strSaveDir2 = "";
			strSaveDir2 = strSaveDir + "files/test/"+nm;
			
			
			File f = new File(strSaveDir2);
			 f.delete(); 
			
		} catch (Exception ex) {

		
		}
		
		

					/*String strSaveDir2 = "";
					strSaveDir2 = strSaveDir + "files/"+eduProcNo+"/practice/";
					targetDir = new File(strSaveDir2);
					if(!targetDir.isDirectory()){
						targetDir.mkdirs();
					}
					
					
					File uploadedFile = new File(strSaveDir2, fileNameAttach);
					if ( uploadedFile.exists()){
						for(int k=0; true; k++){
							String[] filePart = getFileNamePart(fileNameAttach);
							
							uploadedFile = new File(strSaveDir2, filePart[0] + "_" + k + "." + filePart[1]);
							if(!uploadedFile.exists()){ 
								fileNameAttach = filePart[0] + "_" + k + "." + filePart[1];
								break;
							}
						}
					}		*/				
					
					/*attachFileList.add(uploadedFile);
					fileItem.write(uploadedFile);							  
					uploadedFile = null;*/
					
					
		out.print("ok");
		out.flush();
		out.close();
	}
	
	
	@RequestMapping("/editor.do")
	protected ModelAndView editor(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("editor");
		
		return mav;
	}
	@RequestMapping("/editor2.do")
	protected ModelAndView editor2(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("editor2");
		
		return mav;
	}
	@SuppressWarnings("null")
	@RequestMapping("/editor_test.do")
	protected ModelAndView editor_test(HttpServletRequest req, HttpSession session, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView("editor/test");
		
		ArrayList<String> arr = new ArrayList<String>();
		
		arr.add("java");
		arr.add("excel");
		arr.add("r");
		
		mav.addObject("demo", arr);
		return mav;
	}

	@RequestMapping("/create_user.do")
	protected ModelAndView create_user(HttpServletRequest req, HttpSession session, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView("user/create_user");
		
		return mav;
	}
	
	@RequestMapping("/save.do")
	protected ModelAndView save(HttpServletRequest req, HttpSession session, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView("editor/test");
		
		
		String demo1 = req.getParameter("demo1");
    	String demo2 = req.getParameter("demo2");

    	System.out.println("demo1 : " + demo1);
    	System.out.println("demo2 : " + demo2);
    	
    	
    	try{
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return mav;
	}
	
	
	private String[] getFileNamePart(String fileName) {
		String[] filePart = new String[2];
        int index = fileName.lastIndexOf(".");
        if (index != -1) {
            filePart[0] = fileName.substring(0, index);
            filePart[1]  = fileName.substring(index + 1);
        } else {
        	filePart[0] = fileName;
        	filePart[1] = "";
        }
        
		return filePart;
	}
	
}
