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

	public String select_lec_title(LectureVo lvo) throws Exception;

	public ArrayList<LectureVo> select_lec_group(LectureVo lvo) throws Exception;

	public ArrayList<LectureVo> select_lec_board(LectureVo lvo) throws Exception;

	public void likeDel(LectureVo lvo) throws Exception;

	public void likeSet(LectureVo lvo) throws Exception;

	public void likeMinus(LectureVo lvo) throws Exception;

	public void likePlus(LectureVo lvo) throws Exception;

	public int info_insert(LectureVo lvo) throws Exception;

	public void info_file_insert(LectureVo lvo) throws Exception;

	public void update_view_count(LectureVo lvo) throws Exception;

	public LectureVo lec_board_detail(LectureVo lvo) throws Exception;

	public ArrayList<LectureVo> info_file_list(int lec_board_no) throws Exception;

	public ArrayList<LectureVo> info_repl_list(int lec_board_no) throws Exception;

	public void info_repl_insert(LectureVo lvo) throws Exception;

	public void info_file_delete(LectureVo lvo) throws Exception;

	public int info_update(LectureVo lvo) throws Exception;

	public ArrayList<LectureVo> select_lec_group_student(LectureVo lvo) throws Exception;

	public void stu_group_update(LectureVo lvo) throws Exception;

	public int select_max_group_no(LectureVo lvo) throws Exception;

	public void insert_group_no(LectureVo lvo) throws Exception;

	public int select_group_belong_cnt(LectureVo lvo) throws Exception;

	public void delete_group_no(LectureVo lvo) throws Exception;

	
}//.class
