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

	<script type="text/javascript">
		$(document).ready(function(){
	    	var prt = "<c:out value="${srch.prt}"/>";
			$('#prt'+prt).addClass('current');
	    });
		
		function list_add() {
    		
    		var pageSize = "<c:out value="${pageSize}"/>";
    		var page = Number($('#pageNum').val())+1;
    		
    		var pg = parseInt(Number( ( $('#count').val())-1) / pageSize)+1;
    		
    		if (page > pg) {
    			alert("마지막 페이지입니다.");
    		} else {
	    		$.ajax({
					data:{"odr" : $('#order_prt').val(), "srch_nm" : $('#srch_nm').val(), "prt" :  $('#prt').val(), "pageNum" : page, "count" : $('#count').val()},
					method:"POST",
					url:"practice_list_append.ajax",
				    cache: true
				}).done(function(result){
					$("div#act_list").append(result);
					$('#pageNum').val(page);
				});
    		}
    	}
    	
		function go_prt(no) {
    		
    		$.ajax({
					data:{"odr" : $('#order_prt').val(), "srch_nm" : $('#srch_nm').val(), "prt" :  no, "pageNum" : "1", "count" : $('#count').val()},
					method:"POST",
					url:"practice_list_append.ajax",
				    cache: true
				}).done(function(result){
					$("div#act_list").html(result);
					
					$('.snz-nav-item').removeClass('current');
					$('#prt'+no).addClass('current');
					$('#prt').val(no);
					
			});
    	}
		
		function order_change(no, nm) {
			$.ajax({
				data:{"odr" : no, "srch_nm" : $('#srch_nm').val(), "prt" :  $('#prt').val(), "pageNum" : "1", "count" : $('#count').val()},
				method:"POST",
				url:"practice_list_append.ajax",
			    cache: true
			}).done(function(result){
				$("div#act_list").html(result);
				$("#order_nm").html(nm);
				$('#order_prt').val(no);
				$('#pageNum').val(1);
				
			});
    	}
		
		function go_srch() {
			var srch_info = $('#srch_info').val();
			$.ajax({
				data:{"odr" : $('#order_prt').val(), "srch_nm" : srch_info, "prt" :  $('#prt').val(), "pageNum" : "1", "count" : $('#count').val()},
				method:"POST",
				url:"practice_list_append.ajax",
			    cache: true
			}).done(function(result){
				$("div#act_list").html(result);
				$('#pageNum').val(1);
				$('#srch_nm').val(srch_info)
			});
			
		}
		
		function checkEnterKey(){
			if(event.keyCode==13){go_srch();}
		}
		
		function practice_create() {
			document.mainform.action = "practice_create.do";
			document.mainform.submit();
		}
		
	</script>


</head>
<body>
<jsp:include page="../main/top_menu.jsp"  />

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
            <div class="snz-subnav-search">
                <span>정렬</span>
                <div class="navbar-form navbar-right" role="search">
                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                            <span class="selected-item" id="order_nm">최신순</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:order_change('1','최신순')">최신순</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:order_change('1','이름순')">이름순</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:order_change('1','참여 인기순')">참여 인기순</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:order_change('1','마감순')">마감순</a></li>
                        </ul>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search Competitions" id="srch_info" name ="srch_info" onKeyDown="javascript:checkEnterKey()"/>
                    </div>
                    <a href="javascript:go_srch()"><img src="common/assets/img/page/shape-2.png" alt=""/></a>
                </div>
            </div>
        </div>
    </div>
</div>

<form id="mainform" name="mainform" action="" method="post">
<input type="hidden" id="pageNum" name="pageNum" value="${1}"/>
<input type="hidden" id="count" name="count" value="${count}" />
<input type="hidden" id="order_prt" name="order_prt" value="${srch.order_prt}" />
<input type="hidden" id="srch_nm" name="srch_nm" value="${srch.srch_nm}" />
<input type="hidden" id="prt" name="prt" value="${srch.prt}" />
<input type="hidden" id="p_no" name="p_no" />


	<div class="container-fluid snz-page-content-container">
	    <div class="row snz-page-content">
	        <div class="snz-add-btn">
	            <a href="javascript:practice_create()"><img src="common/img/page/shape-1223-copy.png" alt="" /></a>
	        </div>
	        
	        <div id="act_list">
				<c:forEach var="c" items="${list}" varStatus="g">
	        		<div class="info-list-item clearfix">
			            <div class="info-list-item-inner clearfix">
			                <div class="item-number">
			                    <span class="rank-image"></span>
			                    <span>${c.like_cnt }</span>
	        				</div>
	        			<div class="item-desc">
		                    <div class="item-title">
		                        <a href="javascript:practice_detail('${c.prct_no}')"><h4>${c.title }</h4></a>
		                    </div>
		                    <div class="item-tags">
		                        <c:set var="tg" value="${fn:split(c.tag,',')}" />
								<c:forEach var="t" items="${tg}" varStatus="g">
									<span>${t}</span>
								</c:forEach> 
		                    </div>
		                    <div class="item-info">
		                        <span><img src="common/img/page/competitors-icon.png" alt=""/></span>
		                        <span class="item-view">${c.join_cnt } 참여</span> <span class="item-bullet">&bullet;</span> <span class="item-date">${c.reg_dt }</span>
		                        <div class="item-d-date">
		                            <span class="d-date-icon"><img src="common/img/page/clock.png" alt="" /></span>
		                            <span class="d-date-text">${c.start_dt } ~ ${c.end_dt }</span>
		                        </div>
		                    </div>
		                </div>
		                <div class="item-author">
		                    <span class="item-author-name">${c.reg_id }</span>
		                    <span class="item-author-img"><img src="common/img/page/layer-710.png" alt=""/></span>
		                </div>
		            </div>
		        </div>
		    </c:forEach>
         </div>
         
         <div class="ques-8-table-more" style="margin:0">
            <div class="more-trigger"><a href="javascript:list_add()">더보기</a></div>
         </div>
         
	</div>
</div>
<div class="snz-modal-layer"></div>  
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="common/lib/bootstrap-3.3.2/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/f0cba26d23.js"></script>
<script src="common/js/script.js"></script>
</body>
</html>