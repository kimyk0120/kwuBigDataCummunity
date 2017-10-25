package com.sweetk.kwu.lecture.vo;

public class LectureVo {
	
	//LEC_NO, ID, LEC_TITLE, LEC_CORS, LEC_PLAN, START_DT, END_DT, YEAR, GRADE, TERM, REG_ID, REG_DT, DEL_YN
	//LEC_BOARD_NO, LEC_NO, LEC_BOARD_PRT, TITLE, CNTN, TAG, LIKE_CNT, CNT, REG_ID, REG_DT, DEL_YN
	
	
	int pageSize = 10;
	int subPageSize = 5;
	int currentPage = 0;
	
	private String sortOrder1 = "";
	private String sortOrder2 = "";
	private String sortOrder3 = "";
	
	private String likeYn = "";
	
	private int lec_board_no;
	private String lec_board_prt = "";
	private String title = "";
	private String tag = "";
	private int like_cnt;
	private int cnt;

	private int lec_no;
	private String id = ""; 
	private String lec_title = "";
	private String lec_cors = "";
	private String lec_plan = "";
	private String start_dt = "";
	private String end_dt = "";
	private String year = "";
	private String grade = "";
	private String term = "";
	private String reg_id = "";
	private String reg_dt = "";
	private String del_yn = "";
	
	private int stdtcnt;
	private String attndYn = "";	
	private String loginId = "";
	
	private String selectSemester = "";
	private String selectYear = "";
	private String isMine = "";
	private String selectGrade = "";
	
	private String lecTitle = "";
	private String lecProc = "";
	private String cntn = "";
	
	private int group_no;
	
	
	private String file_nm = "";
	private String org_file_nm = "";

	

	// getter , setter
	
	
	
	public String getLikeYn() {
		return likeYn;
	}



	public String getFile_nm() {
		return file_nm;
	}



	public void setFile_nm(String file_nm) {
		this.file_nm = file_nm;
	}



	public String getOrg_file_nm() {
		return org_file_nm;
	}



	public void setOrg_file_nm(String org_file_nm) {
		this.org_file_nm = org_file_nm;
	}



	public String getSortOrder3() {
		return sortOrder3;
	}



	public void setSortOrder3(String sortOrder3) {
		this.sortOrder3 = sortOrder3;
	}



	public String getSortOrder1() {
		return sortOrder1;
	}



	public void setSortOrder1(String sortOrder1) {
		this.sortOrder1 = sortOrder1;
	}



	public String getSortOrder2() {
		return sortOrder2;
	}



	public void setSortOrder2(String sortOrder2) {
		this.sortOrder2 = sortOrder2;
	}



	public int getSubPageSize() {
		return subPageSize;
	}



	public void setSubPageSize(int subPageSize) {
		this.subPageSize = subPageSize;
	}



	public void setLikeYn(String likeYn) {
		this.likeYn = likeYn;
	}



	public int getLec_board_no() {
		return lec_board_no;
	}



	public void setLec_board_no(int lec_board_no) {
		this.lec_board_no = lec_board_no;
	}



	public String getLec_board_prt() {
		return lec_board_prt;
	}



	public void setLec_board_prt(String lec_board_prt) {
		this.lec_board_prt = lec_board_prt;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getTag() {
		return tag;
	}



	public void setTag(String tag) {
		this.tag = tag;
	}



	public int getLike_cnt() {
		return like_cnt;
	}



	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}



	public int getCnt() {
		return cnt;
	}



	public void setCnt(int cnt) {
		this.cnt = cnt;
	}



	public int getGroup_no() {
		return group_no;
	}



	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}



	public String getCntn() {
		return cntn;
	}



	public void setCntn(String cntn) {
		this.cntn = cntn;
	}



	public String getLecTitle() {
		return lecTitle;
	}



	public void setLecTitle(String lecTitle) {
		this.lecTitle = lecTitle;
	}



	public String getLecProc() {
		return lecProc;
	}



	public void setLecProc(String lecProc) {
		this.lecProc = lecProc;
	}



	public String getSelectGrade() {
		return selectGrade;
	}



	public void setSelectGrade(String selectGrade) {
		this.selectGrade = selectGrade;
	}



	public String getIsMine() {
		return isMine;
	}

	public void setIsMine(String isMine) {
		this.isMine = isMine;
	}

	public String getSelectSemester() {
		return selectSemester;
	}
	public void setSelectSemester(String selectSemester) {
		this.selectSemester = selectSemester;
	}
	public String getSelectYear() {
		return selectYear;
	}
	public void setSelectYear(String selectYear) {
		this.selectYear = selectYear;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getAttndYn() {
		return attndYn;
	}
	public void setAttndYn(String attndYn) {
		this.attndYn = attndYn;
	}
	public int getStdtcnt() {
		return stdtcnt;
	}
	public void setStdtcnt(int stdtcnt) {
		this.stdtcnt = stdtcnt;
	}
	public int getLec_no() {
		return lec_no;
	}
	public void setLec_no(int lec_no) {
		this.lec_no = lec_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLec_title() {
		return lec_title;
	}
	public void setLec_title(String lec_title) {
		this.lec_title = lec_title;
	}
	public String getLec_cors() {
		return lec_cors;
	}
	public void setLec_cors(String lec_cors) {
		this.lec_cors = lec_cors;
	}
	public String getLec_plan() {
		return lec_plan;
	}
	public void setLec_plan(String lec_plan) {
		this.lec_plan = lec_plan;
	}
	public String getStart_dt() {
		return start_dt;
	}
	public void setStart_dt(String start_dt) {
		this.start_dt = start_dt;
	}
	public String getEnd_dt() {
		return end_dt;
	}
	public void setEnd_dt(String end_dt) {
		this.end_dt = end_dt;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}



	@Override
	public String toString() {
		return "LectureVo [pageSize=" + pageSize + ", subPageSize=" + subPageSize + ", currentPage=" + currentPage
				+ ", sortOrder1=" + sortOrder1 + ", sortOrder2=" + sortOrder2 + ", likeYn=" + likeYn + ", lec_board_no="
				+ lec_board_no + ", lec_board_prt=" + lec_board_prt + ", title=" + title + ", tag=" + tag
				+ ", like_cnt=" + like_cnt + ", cnt=" + cnt + ", lec_no=" + lec_no + ", id=" + id + ", lec_title="
				+ lec_title + ", lec_cors=" + lec_cors + ", lec_plan=" + lec_plan + ", start_dt=" + start_dt
				+ ", end_dt=" + end_dt + ", year=" + year + ", grade=" + grade + ", term=" + term + ", reg_id=" + reg_id
				+ ", reg_dt=" + reg_dt + ", del_yn=" + del_yn + ", stdtcnt=" + stdtcnt + ", attndYn=" + attndYn
				+ ", loginId=" + loginId + ", selectSemester=" + selectSemester + ", selectYear=" + selectYear
				+ ", isMine=" + isMine + ", selectGrade=" + selectGrade + ", lecTitle=" + lecTitle + ", lecProc="
				+ lecProc + ", cntn=" + cntn + ", group_no=" + group_no + "]";
	}



	
		
	
	
	
	
}//.class
