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
    
    <script type="text/javascript" src="common/js/HuskyEZCreator.js" charset="utf-8"></script>
    
    <script type="text/javascript">
    
    $(document).ready(function(){ 
    	
    	var subj = "<c:out value="${srch.subject}"/>";
    	
		$('#cate'+subj).addClass('current');
    	
    });
    
    function cate_click(no,nm) {
    	
    	document.getElementById("cate_nm").innerHTML=nm;
    	$('#subject').val(no);
    	
    }
    
    function board_save() {
    	
		var sub = $('#subject').val();
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
    
    function reply_save() {
    	
    	var repl = $('#repl_cntn').val();
    	
    	if(repl.trim().length < 5) {
    		
    		alert("5글자 이상 입력하셔야 합니다.");
    	} else {
    	
			$.ajax({
					data:{"b_no" : $('#b_no').val(), "repl_cntn" : $('#repl_cntn').val()},
					method:"POST",
					url:"info_repl_save.ajax",
				    cache: true
				}).done(function(result){
					$("div#div-reply").html(result);
			});
    	}
	}
    
    function go_cate(no) {
    	
    	$('#subject').val(no);
    	document.mainform.action = "info_list.do";
		document.mainform.submit();
    	
    }
    
    function board_edit() {
    	
    	document.mainform.action = "info_edit.do";
		document.mainform.submit();
    	
    }
    
    </script>
   
</head>
<body>

	<jsp:include page="../main/top_menu.jsp"  />
	
	<div class="container-fluid snz-page-container display-none-mobile">
    <div class="container snz-page-container-inner">
        <div class="row snz-page-title">
            <h1>정보창고</h1>
        </div>
        <div class="row snz-page-nav">
            <span class="snz-nav-item" id="cate"><a href="javascript:go_cate('')">전체</a></span>
            <span class="snz-nav-item" id="cate1"><a href="javascript:go_cate('1')">Python</a></span>
            <span class="snz-nav-item" id="cate2"><a href="javascript:go_cate('2')">R</a></span>
            <span class="snz-nav-item" id="cate3"><a href="javascript:go_cate('3')">SAS</a></span>
            <span class="snz-nav-item" id="cate4"><a href="javascript:go_cate('4')">SPSS</a></span>
            <span class="snz-nav-item only-desktop-display" id="cate5"><a href="javascript:go_cate('5')">EXCEL</a></span>
            <span class="snz-nav-item only-desktop-display" id="cate6"><a href="javascript:go_cate('6')">기타</a></span>
        </div>
    </div>
</div>

<form id="mainform" name="mainform" action="" method="post">
<input type="hidden" id="b_no" name="b_no" value="${info.board_no }"/>
<input type="hidden" id="subject" name="subject" value="${srch.subject }"/>

<div class="container-fluid snz-page-content-container">
    <div class="row snz-page-content snz-page-detail">

        <div class="snz-detail-title-header clearfix">
            <div class="snz-detail-title-section">
                <div class="snz-detail-title clearfix">
                    <h1>${info.title }</h1>
                    <span class="item-desc-inner-cate-up">${info.subject_nm }</span>
                    <div class="detail-rank detail-rank-down">
                        <img src="common/img/page/selected.png" alt=""/>
                        <span class="">${info.like_cnt }</span>
                    </div>
                </div>
                <div class="detail-tags">
                	<%-- <c:forEach items="${tags}" var="t" varStatus="status">
                		<span>${t}</span>
                    </c:forEach> --%>
                    <c:set var="tg" value="${fn:split(info.tag,',')}" />
						<c:forEach var="t" items="${tg}" varStatus="g">
							<span>${t}</span>
						</c:forEach> 
                </div>
            </div>
            <div class="snz-detail-info-section">
                <div class="detail-rank detail-rank-up">
                    <img src="common/img/page/selected.png" alt=""/>
                    <span class="">${info.like_cnt }</span>
                </div>
                <div class="item-info">
                    <span><img src="common/img/page/view-icon.png" alt=""/></span>
                    <span class="item-view">${info.cnt} View</span> <span class="item-bullet">&bullet;</span> <span class="item-date">${info.reg_dt }</span>
                    <span class="item-desc-inner-cate-down">${info.board_prt}</span>
                </div>
            </div>
        </div>

        <div class="snz-detail-content-section">
            <div class="detail-attachment">
                <div class="attachment-title">
                    <div class="attachment-dropdown dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <img src="common/img/page/shape-1223.png" alt=""/> <span class="attachment-text">첨부파일(${fn:length(f_list)})</span>
                    </div>
                    <ul class="dropdown-menu" role="menu">
                    	<c:forEach items="${f_list}" var="f" varStatus="g">
                    		<li><a href="javascript:file_down('${f.file_no }')">${f.org_file_nm}<span><img src="common/img/page/download-1.png" alt=""/></span></a></li> 
                        </c:forEach>
                    </ul>
                </div>
            </div>

            <article class="detail-section-inner">
                ${info.cntn }
            </article>
	
            <div class="detail-author-info item-author" >
                <span class="item-author-name">${info.reg_id }</span>
                <span class="item-author-img"><img src="common/img/page/layer-710.png" alt=""/></span>
            </div>
            <div class="enter-btns" style="float:left;margin-top:5px">
                <input type="button" class="btn btn-primary" value="수정" onclick="javascript:board_edit()"/>
            </div>
        </div>

        <div class="snz-detail-cmt-section">
        	<div id="div-reply">
	            <div class="cmt-section-title">
	                <h4>${fn:length(r_list)} Comments</h4>
	            </div>
	            <div class="cmt-section-textarea clearfix">
	                <div class="cmt-section-textarea-left">
	                    <span class="item-author-img"><img src="common/img/page/shape-634-copy.png" alt=""/></span>
	                </div>
	                <div class="cmt-section-textarea-right">
	                        <textarea name="repl_cntn" id="repl_cntn" cols="30" rows="5"></textarea>
	                        <input type="text" class="snz-submit btn btn-primary" value="등록" onclick="javascript:reply_save()"/>
	                </div>
	                <div class="cmt-section-added-section">
						<c:forEach items="${r_list}" var="r" varStatus="g">
		                    <span class="cmt-added-item clearfix">
		                        <div class="cmt-added-item-left">
		                            <span class="item-author-img"><img src="common/img/page/layer-710.png" alt=""/></span>
		                        </div>
		                        <div class="cmt-added-item-right">
		                            <span class="item-author-name">${r.repl_reg_id }</span>
		                            <span class="item-author-date">${r.repl_reg_dt }</span>
		                            <div class="item-author-comment">${r.repl_cntn }</div>
		                        </div>
		                    </span>
	                    </c:forEach>
	                </div>
	            </div>
            </div>
        </div>

    </div>
</div>
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="common/lib/bootstrap-3.3.2/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/f0cba26d23.js"></script>
<script src="common/js/script.js"></script>

</body>
</html>