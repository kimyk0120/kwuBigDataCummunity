package com.sweetk.kwu.lecture.mapper;

import java.util.ArrayList;

import com.sweetk.kwu.lecture.vo.LectureVo;

public interface LectureMapper {

	public int lecture_list_count();	

	public ArrayList<LectureVo> lecture_list(LectureVo lvo);

	public ArrayList<LectureVo> myLecture_list(LectureVo lvo);
	
}
