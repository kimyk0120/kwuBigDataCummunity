package com.sweetk.kwu.lecture.vo;

public class LectureVo {
	
	//LEC_NO, ID, LEC_TITLE, LEC_CORS, LEC_PLAN, START_DT, END_DT, YEAR, GRADE, TERM, REG_ID, REG_DT, DEL_YN
	
	// paging
	int pageSize = 10;
	int currentPage = 0;
	
	// lecture fields
	private int lec_no;
	private String id = ""; // 강사 아이디
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
	
	
	@Override
	public String toString() {
		return "LectureVo [pageSize=" + pageSize + ", currentPage=" + currentPage + ", lec_no=" + lec_no + ", id=" + id
				+ ", lec_title=" + lec_title + ", lec_cors=" + lec_cors + ", lec_plan=" + lec_plan + ", start_dt="
				+ start_dt + ", end_dt=" + end_dt + ", year=" + year + ", grade=" + grade + ", term=" + term
				+ ", reg_id=" + reg_id + ", reg_dt=" + reg_dt + ", del_yn=" + del_yn + ", stdtcnt=" + stdtcnt
				+ ", attndYn=" + attndYn + ", loginId=" + loginId + ", selectSemester=" + selectSemester
				+ ", selectYear=" + selectYear + "]";
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
		
}//.class
