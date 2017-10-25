package com.sweetk.kwu.lecture.mapper;

import java.util.ArrayList;

import com.sweetk.kwu.lecture.vo.LectureVo;

public interface LectureMapper {

	public int lecture_list_count() throws Exception;	

	public ArrayList<LectureVo> lecture_list(LectureVo lvo) throws Exception;

	public ArrayList<LectureVo> myLecture_list(LectureVo lvo) throws Exception;

	public int lec_create(LectureVo lvo) throws Exception;

	public void insert_lec_group(LectureVo lvo) throws Exception;

	public String select_lec_plan(LectureVo lvo) throws Exception; 
	
}
