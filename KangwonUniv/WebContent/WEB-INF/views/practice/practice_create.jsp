<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
	<meta http-equiv="X-UA-Compatible" content="requiresActiveX=true" />
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
	
	<script type="text/javascript" src="common/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="common/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="common/js/dropzone.js"></script>
	
    <title></title>
    <link rel="stylesheet" href="common/lib/bootstrap-3.3.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="common/css/style.css"/>
    <link rel="stylesheet" href="common/css/jquery.tag-editor.css" />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
    
    <script type="text/javascript" src="common/js/HuskyEZCreator.js" charset="utf-8"></script>
    <jsp:useBean id="now" class="java.util.Date" />
    
    <script type="text/javascript">
     
    	$(document).ready(function(){ 
    		var subj = "<c:out value="${srch.prt}"/>";
    		$('#prt'+subj).addClass('current');
    		
    		var uploadFile = $('.fileBox #uploadBtn1');
    		uploadFile.on('change', function(){
    			if(window.FileReader){
    				var filename = $(this)[0].files[0].name;
    			} else {
    				var filename = $(this).val().split('/').pop().split('\\').pop();
    			}
    			$(this).siblings('#fileName1').val(filename);
    		});
    		
    	}); 

    	
	    function prt_click(no,nm) {
	    	
	    	document.getElementById("prt_nm").innerHTML=nm;
	    	$('#prt').val(no);
	    	
	    }
	    
	function board_save() {
	    	
			var ttl = $('#title').val();
			
			oEditors.getById["cntn"].exec("UPDATE_CONTENTS_FIELD", []);
			
			var sn = $('#cntn').val();
			
			if(sub == "") {
				alert("카테고리를 선택하세요.");
				return;
			} else if(ttl == "") {
				alert("제목을 입력하세요");
				return;
			} else if(sn == "") {
				alert("내용을 입력하세요");
				return;
			} else {
				if(confirm("저장하시겠습니까?")) {
					document.mainform2.action = "info_save.do";
					document.mainform2.submit();
				}
			}
	    	
	    }
	    
	    function file_add() {
	    	var no = $('#file_cnt').val();
	    	no = 1 + Number(no);
	    	alert("no : " + no);
	    	var fileAdd= "<label for=\"\"></label><div class=\"fileBox\"><input type=\"text\" class=\"fileName\" id=\"fileName"+no+"\"  readonly=\"readonly\" /><label for=\"uploadBtn"+no+"\" class=\"btn_file\">찾아보기</label><input type=\"file\" id=\"uploadBtn"+no+"\" name=\"uploadBtn"+no+"\" class=\"uploadBtn\" /></div>";
	    	fileAdd = fileAdd + "<script type=\"text/javascript\">$(function() {var uploadFile = $('.fileBox #uploadBtn"+no+"'); uploadFile.on('change', function(){ if(window.FileReader){	var filename = $(this)[0].files[0].name; } else { var filename = $(this).val().split('/').pop().split('\\\\').pop(); }$(this).siblings('#fileName"+no+"').val(filename);});});";
	    	$("div#file_box").append(fileAdd);
	    	$('#file_cnt').val(no);
	    }
	    
	    function file_del() { 
	    	var no = $('#file_cnt').val();
	    	if ( no < 2 ) {
	    		alert("마지막 파일은 삭제 불가능합니다.");
	    	} else {
		    	no = Number(no)-1;
		    	$("div#file_box div:last").remove();
		    	$("div#file_box label:last").remove();
		    	$('#file_cnt').val(no);
	    	}
	    }
	    
	    function go_prt(no) {
	    	
	    	$('#prt').val(no);
	    	document.mainform.action = "practice_list.do";
			document.mainform.submit();
	    	
	    }
    
	</script>    
	
	<style type="text/css">
    
    .fileBox {display:inline-block;width:85%;margin-bottom:5px}
    .fileBox .fileName {display:inline-block;width:75%;height:30px;padding-left:10px;margin-right:5px;line-height:30px;border:1px solid #aaa;background-color:#fff;vertical-align:middle}
	.fileBox .btn_file {display:inline-block;width:100px;height:30px;font-size:0.8em;line-height:30px;text-align:center;vertical-align:middle;background-color:#e1e8ee}
	.fileBox input[type="file"] {position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);border:0}

    </style>
	    
</head>
<body>

<jsp:include page="../main/top_menu.jsp"  />

<form id="mainform2" name="mainform2" method="post" enctype="multipart/form-data">
<input type="hidden" id="subject" name="subject" />
<input type="hidden" id="file_cnt" name="file_cnt" value="1"/>

<div class="container-fluid snz-page-container">
    <div class="container snz-page-container-inner">
        <div class="row snz-page-title">
            <h1>실전문제</h1>
        </div>
        <div class="row snz-page-nav ques-page-nav">
            <div id="div-prt">
	            <span class="snz-nav-item" id="prt1"><a href="javascript:go_prt('1')">진행중</a></span>
	            <span class="snz-nav-item" id="prt2"><a href="javascript:go_prt('2')">전체</a></span>
	            <span class="snz-nav-item" id="prt3"><a href="javascript:go_prt('3')">참가중</a></span>
	            <span class="snz-nav-item" id="prt4"><a href="javascript:go_prt('4')">출제</a></span>
	        </div>
        </div>
    </div>
</div>

<div class="container-fluid snz-page-content-container">
    <div class="row snz-page-content snz-page-write">

        <div class="snz-write-section snz-ques-write-section">


            <div class="write-title">
                <h1>문제 등록</h1>
            </div>

            <div class="write-select-info">
            	
                    <div class="enter-category enter-date">
                        <label for="">일정</label>
                        <input type="text" id="datepicker1" name="start_dt" value="${now_ym }"/>
                        <input type="text" id="datepicker2" name="end_dt" value="${next_ym }"/>
                    </div>
                    <div class="enter-title">
                        <label for="">제목</label>
                        <input type="text" placeholder="제목을 입력하세요." value="빅데이터 소개 영상"/>
                    </div>
            </div>
            <div class="write-form">
                <div class="enter-action">
                    <div class="enter-action-div">
                        <span><img src="common/img/page/editor/shape-775.png" alt=""/></span>
                        <span><img src="common/img/page/editor/shape-776.png" alt=""/></span>
                    </div>
                    <div class="enter-action-div">
                        <span><img src="common/img/page/editor/shape-778.png" alt=""/></span>
                        <span><img src="common/img/page/editor/shape-779.png" alt=""/></span>
                        <span><img src="common/img/page/editor/shape-780.png" alt=""/></span>
                        <span><img src="common/img/page/editor/shape-781.png" alt=""/></span>
                        <span><img src="common/img/page/editor/shape-782.png" alt=""/></span>
                    </div>
                    <div class="enter-action-div">
                        <span><img src="common/img/page/editor/shape-783.png" alt=""/></span>
                        <span><img src="common/img/page/editor/shape-784.png" alt=""/></span>
                        <span><img src="common/img/page/editor/vector-smart-object.png" alt=""/></span>
                        <span><img src="common/img/page/editor/vector-smart-object%20(1).png" alt=""/></span>
                    </div>
                    <div class="enter-action-div">
                        <span><img src="common/img/page/editor/shape-785.png" alt=""/></span>
                        <span><img src="common/img/page/editor/shape-786.png" alt=""/></span>
                    </div>
                </div>
                <div class="enter-content">
                    <textarea name="" id="" cols="30" rows="10" placeholder="내용을 입력해주세요.">2015년 스마트 과학관 콘텐츠 구축사업의 빅데이터 분야 동영상 콘텐츠 입니다.
참고하세요~

http://youtu.be/vyRC1bUAwFE</textarea>
                </div>
                <div class="enter-attachment">
                    <label for="">자료</label>
                    <input type="text" placeholder="파일을 등록하세요." value="2017 Big data videopredictions.zip"/>
                    <span><a href="#"><img src="common/img/page/x.png" alt=""/></a></span>
                    <span class="attachment-btn">
                        <span class="search-btn"><a href="#"><img src="common/img/page/editor/search-file.png" alt=""/></a></span>
                        <span class="add-btn"><a href="#"><img src="common/img/page/editor/copy.png" alt=""/></a></span>
                    </span>
                </div>
                <div class="enter-desc">
                    <label for="">자료 설명</label>
                    <textarea name="" id="" cols="30" rows="4">파일 변수는 x, y 이고 성별은 m, f 이다. 연령 데이터와 주소 데이터를 참고한다.
승리일 경우 0, 패배일 경우 1, 무승부는 2 이다.</textarea>
                </div>
                <div class="enter-tag">
                    <label for="">태그</label>
                    <input type="text" placeholder="태그(콤마(,)로 구분)" value="PYTHON, 파이썬, 예측, SOCCER, 프리미어리그" />
                </div>
                <div class="enter-btns">
                    <input type="button" class="btn btn-primary" value="등록" />
                    <input type="button" class="btn btn-default" value="취소" />
                </div>
            </div>

        </div>

    </div>
</div>
</div>

</form>
<div class="snz-modal-layer"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="common/lib/bootstrap-3.3.2/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/f0cba26d23.js"></script>
<script src="common/js/script.js"></script>

</body>
</html>