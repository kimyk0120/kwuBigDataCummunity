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
	    	var subj = "<c:out value="${srch.subject}"/>";
			$('#cate'+subj).addClass('current');
	    });
    
    	function info_write() {
    		
    		location.href = "info_create.do";
    	}
    	
    	function info_detail(no) {
    		$('#b_no').val(no);
    		document.mainform.action = "info_detail.do";
			document.mainform.submit();
    	}
    	
    	function list_add() {
    		
    		var pageSize = "<c:out value="${pageSize}"/>";
    		var page = Number($('#pageNum').val())+1;
    		
    		var pg = parseInt(Number( ( $('#count').val())-1) / pageSize)+1;
    		
    		if (page > pg) {
    			alert("마지막 페이지입니다.");
    		} else {
	    		$.ajax({
					data:{"odr" : $('#order_prt').val(), "srch_nm" : $('#srch_nm').val(), "subject" :  $('#subject').val(), "pageNum" : page, "count" : $('#count').val()},
					method:"POST",
					url:"info_list_append.ajax",
				    cache: true
				}).done(function(result){
					$("div#act_list").append(result);
					$('#pageNum').val(page);
				});
    		}
    	}
    	
		function go_cate(no) {
    		
    		$.ajax({
					data:{"odr" : $('#order_prt').val(), "srch_nm" : $('#srch_nm').val(), "subject" :  no, "pageNum" : "1", "count" : $('#count').val()},
					method:"POST",
					url:"info_list_append.ajax",
				    cache: true
				}).done(function(result){
					$("div#act_list").html(result);
					
					$('.snz-nav-item').removeClass('current');
					$('#cate'+no).addClass('current');
					$('#subject').val(no);
					
			});
    	}
		
		function order_change(no, nm) {
			$.ajax({
				data:{"odr" : no, "srch_nm" : $('#srch_nm').val(), "subject" :  $('#subject').val(), "pageNum" : "1", "count" : $('#count').val()},
				method:"POST",
				url:"info_list_append.ajax",
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
				data:{"odr" : $('#order_prt').val(), "srch_nm" : srch_info, "subject" :  $('#subject').val(), "pageNum" : "1", "count" : $('#count').val()},
				method:"POST",
				url:"info_list_append.ajax",
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
    
    </script>

</head>
<body>

<jsp:include page="../main/top_menu.jsp"  />

	<div class="container-fluid snz-page-container">
	
	    <div class="container snz-page-container-inner">
	        <div class="row snz-page-title">
	            <h1>정보창고</h1>
	        </div>
	        <div class="row snz-page-nav clearfix">
	            <div class="snz-nav-item-outer">
	                <div class="snz-nav-item-inner" id="div-cate">
			            <span class="snz-nav-item" id="cate"><a href="javascript:go_cate('')">전체</a></span>
			            <span class="snz-nav-item" id="cate1"><a href="javascript:go_cate('1')">Python</a></span>
			            <span class="snz-nav-item" id="cate2"><a href="javascript:go_cate('2')">R</a></span>
			            <span class="snz-nav-item" id="cate3"><a href="javascript:go_cate('3')">SAS</a></span>
			            <span class="snz-nav-item" id="cate4"><a href="javascript:go_cate('4')">SPSS</a></span>
			            <span class="snz-nav-item only-desktop-display" id="cate5"><a href="javascript:go_cate('5')">EXCEL</a></span>
			            <span class="snz-nav-item only-desktop-display" id="cate6"><a href="javascript:go_cate('6')">기타</a></span>
			        </div>
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
	                            <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:order_change('2','조회수순')">조회수순</a></li>
	                            <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:order_change('3','인기순')">인기순</a></li>
	                        </ul>
	                    </div>
	                    <div class="form-group">
	                        <input type="text" class="form-control" placeholder="Search" id="srch_info" name ="srch_info" onKeyDown="javascript:checkEnterKey()"/>
	                    </div>
	                    <a href="javascript:go_srch()"><img src="common/img/page/shape-2.png" alt=""/></a>
	            	</div>
	        	</div>
	    	</div>
		</div>
		
<form id="mainform" name="mainform" action="" method="post">
<input type="hidden" id="pageNum" name="pageNum" value="${1}"/>
<input type="hidden" id="count" name="count" value="${count}" />
<input type="hidden" id="order_prt" name="order_prt" value="${srch.order_prt}" />
<input type="hidden" id="srch_nm" name="srch_nm" value="${srch.srch_nm}" />
<input type="hidden" id="subject" name="subject" value="${srch.subject}" />
<input type="hidden" id="b_no" name="b_no" />
		<div class="container-fluid snz-page-content-container">
	    	<div class="row snz-page-content snz-info-list-content">
		        <div class="snz-add-btn">
		            <a href="javascript:info_write()"><img src="common/img/page/shape-1223-copy.png" alt=""/></a>
		        </div>
				<div id="act_list">
					<c:forEach var="c" items="${list}" varStatus="g">
				        <div class="info-list-item clearfix">
				            <div class="info-list-item-inner clearfix">
				                <div class="item-number">
				                    <img src="common/img/page/default.png" alt=""/>
				                    <span>${c.like_cnt }</span>
				                </div>
				                <div class="item-desc">
				                    <div class="item-title">
				                        <a href="javascript:info_detail('${c.board_no}')"><h4>${c.title }</h4></a>
				                        <span class="item-desc-inner-cate-up">${c.subject_nm }</span>
				                    </div>
				                    <div class="item-tags">
				                        <c:set var="tg" value="${fn:split(c.tag,',')}" />
											<c:forEach var="t" items="${tg}" varStatus="g">
												<span>${t}</span>
											     <%-- <c:if test="${g.count == 2}">${telNum}</c:if>
											       <c:if test="${g.last}">-${telNum}</c:if> --%>
											</c:forEach> 
			
				                    </div>
				                    <div class="item-info">
				                        <span><img src="common/img/page/view-icon.png" alt=""/></span>
				                        <span class="item-view">${c.cnt} View</span> <span class="item-bullet">&bullet;</span> <span class="item-date">${c.reg_dt }</span>
				                        <span class="item-desc-inner-cate-down">${c.subject_nm }</span>
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
		            <!-- <div class="rest-count"><span>15 / 137</span></div> -->
		        </div>
	    	</div>
		</div>
</form>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="common/lib/bootstrap-3.3.2/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/f0cba26d23.js"></script>
<script src="common/js/script.js"></script>
</body>
</html>