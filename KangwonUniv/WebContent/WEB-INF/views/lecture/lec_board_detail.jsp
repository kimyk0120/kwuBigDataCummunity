<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>게시글 상세</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
<meta http-equiv="X-UA-Compatible" content="requiresActiveX=true" />
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />

<script type="text/javascript" src="common/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="common/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="common/js/dropzone.js"></script>
<script type="text/javascript" src="common/js/HuskyEZCreator.js" charset="utf-8"></script>

<link rel="stylesheet" href="common/lib/bootstrap-3.3.2/css/bootstrap.min.css" />
<link rel="stylesheet" href="common/css/style.css"/>
<link rel="stylesheet" href="common/css/jquery.tag-editor.css" />

<script type="text/javascript">
    
//코멘트 등록 
function reply_save() {
  	var repl = $("#repl_cntn").val();
  	if(repl.trim().length < 5) {
  		alert("5글자 이상 입력하셔야 합니다.");
  	} else {
  		var lec_no = $("#lec_no").val();
  		var  lec_board_no = $("#lec_board_no").val();
		$.ajax({
				data:{"lec_no" : lec_no,"lec_board_no":lec_board_no, "repl_cntn" : $('#repl_cntn').val()},
				method:"POST",
				url:"lec_board_repl_save.ajax",
			    cache: true
			}).done(function(result){
				$("div#div-reply").html(result);
		});
  	}
}

// 수정 선택시
function board_edit() {
	var lec_no = $("#lec_no").val();
	var lec_board_no = $("#lec_board_no").val();
  	document.mainform.action = "lec_board_edit.do?lec_no="+lec_no+"&lec_board_no="+lec_board_no;
	document.mainform.submit();
}
    
</script>
</head>
<body>

<jsp:include page="../main/top_menu.jsp"  />


<form id="mainform" name="mainform" action="" method="post">
<input type="hidden" id="lec_no" name="lec_no" value="${lec_no}"/>
<input type="hidden" id="lec_board_no" name="lec_board_no" value="${lec_board_no}"/>

<div class="container-fluid snz-page-content-container">
    <div class="row snz-page-content snz-page-detail">

        <div class="snz-detail-title-header clearfix">
            <div class="snz-detail-title-section">
                <div class="snz-detail-title clearfix">
                    <h1>
                    	${info.title }
                    </h1>
                    <span class="item-desc-inner-cate-up">
                    	<c:choose>
                    		<c:when test="${info.lec_board_prt eq 'A'}">과제</c:when>
                    		<c:when test="${info.lec_board_prt eq 'B'}">수업</c:when>
                    		<c:when test="${info.lec_board_prt eq 'C'}">기타</c:when>
                    		<c:otherwise>${info.lec_board_prt}조</c:otherwise>
                    	</c:choose>
                   	</span>
                    <div class="detail-rank detail-rank-down">
                        <img src="common/img/page/selected.png" alt=""/>
                        <span class="">
                        	${info.like_cnt} 
                       	</span>
                    </div>
                </div>
                <div class="detail-tags">
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
                    <span class="item-desc-inner-cate-down">
                    	<%-- ${info.board_prt} --%>
                   	</span>
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
                    		<li><a href="javascript:file_down('${f.lec_board_file_no }')">${f.file_nm}<span><img src="common/img/page/download-1.png" alt=""/></span></a></li> 
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