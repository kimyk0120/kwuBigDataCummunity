<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
    <link rel="stylesheet" href="../../assets/lib/bootstrap-3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/style.css">
</head>
<body>

<jsp:include page="../main/top_menu.jsp"  />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
<input type="hidden" value="${pageNum}" id="pageNum">
<input type="hidden" value="${lec_no}" id="lec_no">

<!-- menu -->
<div class="container-fluid snz-page-container">
    <div class="container snz-page-container-inner">
        <div class="row snz-page-title">
            <h1>강의 > ${lecTitle} <input type="button" class="btn btn-primary" value="수강생관리" id="stuEditBtn"></h1>
        	
        </div>
            
        <div class="row snz-page-nav clearfix">
            <div class="snz-nav-item-outer">
                <div class="snz-nav-item-inner">
                    <span class="snz-nav-item current" data-val="all" data-value-declared><a>전체</a></span>
                    <span class="snz-nav-item" data-val="A" data-value-declared><a>과제</a></span>
                    <span class="snz-nav-item" data-val="B" data-value-declared><a>수업</a></span>
                    <span class="snz-nav-item" data-val="C" data-value-declared><a>기타</a></span>
                    
                    <c:forEach items="${grouplist}" var="gl">
	                    <span class="snz-nav-item" data-val="${gl.group_no}" data-gourpno="${gl.group_no}" data-value-declared><a>${gl.group_no}조</a></span>
                    </c:forEach>
                    
                </div>
            </div>
            <div class="snz-subnav-search">
                <span>정렬</span>
                <div class="navbar-form navbar-right" role="search"> <!-- <form> 태그를 <div> 태그로 변경 -->
                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                            <span class="selected-item">최신순</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation" class="sortMenu"><a role="menuitem" tabindex="-1">최신순</a></li>
                            <li role="presentation" class="sortMenu"><a role="menuitem" tabindex="-1">인기순</a></li>
                        </ul>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search" id="srchInput">
                    </div>
                    <a ><img src="../../assets/img/page/shape-2.png" alt="" id="lecBoardSrchBtn"></a> 
                </div>

            </div>
        </div>
    </div>
</div>
<!-- content -->
<div class="container-fluid snz-page-content-container">
    <div class="row snz-page-content snz-info-list-content" >
        <div class="snz-add-btn">
            <a ><img src="../../assets/img/page/shape-1223-copy.png" alt="" id="lecBoardRegBtn"></a>
        </div>
		
		<!-- list -->
		<div id="listAppend">
		
		<c:forEach items="${boardList}" var="bl" begin="0" varStatus="stat">
	        <div class="listUnit info-list-item clearfix" data-lecBoardNo="${bl.lec_board_no}" data-value-declared>
	            <div class="info-list-item-inner clearfix">
	                <div class="item-number">
	                    <span class="rank-image ${bl.likeYn eq 'Y' ? 'active' : ''}"></span>
	                    <span>${bl.like_cnt}</span>
	                </div>
	                <div class="item-desc">
	                    <div class="item-title">
	                        <a class="boardDetailBtn"><span>${bl.title}</span></a>
	                        <span class="item-desc-inner-cate-up">
	                        <c:choose>
								<c:when test="${bl.lec_board_prt eq 'A' }">과제</c:when>	                        
	                        	<c:when test="${bl.lec_board_prt eq 'B' }">수업</c:when>
	                        	<c:when test="${bl.lec_board_prt eq 'C' }">기타</c:when>
	                        	<c:otherwise>${bl.lec_board_prt}조</c:otherwise>
	                        </c:choose>
                        	</span>
	                    </div>
	                    <div class="item-tags">
	                    	<c:set var="tg" value="${fn:split(bl.tag,',')}" />
	                    	<c:forEach var="t" items="${tg}">
								<span>${t}</span>
							</c:forEach>
	                    </div>
	                    <div class="item-info">
	                        <span><img src="../../assets/img/page/view-icon.png" alt=""></span>
	                        <span class="item-view">${bl.cnt} View</span> <span class="item-bullet">&#8226;</span> <span class="item-date">${bl.reg_dt}</span>
	                    </div>
	                </div>
	                <div class="item-author">
	                    <span class="item-author-name">${bl.reg_id}</span>
	                    <span class="item-author-img"><img src="../../assets/img/page/layer-710.png" alt=""></span>
	                </div>
	            </div>
	        </div>
        </c:forEach>
        
        </div>
        <!-- .list -->
		
        <!-- 더보기 버튼 영역 -->
		<div class="ques-8-table-more" style="margin:0" ><div class="more-trigger"><a>더보기</a></div></div>
    </div>
</div>

<div class="snz-modal-layer"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="../../assets/lib/bootstrap-3.3.2/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/f0cba26d23.js"></script>
<script src="../../assets/js/script.js"></script>
<script type="text/javascript">

	var lec_no = $("#lec_no").val();
	var pageNum = $("#pageNum").val();
	var flag = "전체";
	var data;	
	var lecBoardNo;
	var sortFlag;
	var sortOrder1 = "all";
	var sortOrder2 = "1";
	var sortOrder3 = "";
	
	var initSortOrder = '${initSortOrder}';
	
	if(!!initSortOrder){
		$(".snz-nav-item").each(function(index){
			$(this).removeClass("current");
			if(initSortOrder == $(this).attr("data-val")){
				$(this).addClass("current");
			}
		});
	};
	
	// 검색분류 선택 css
	$(".snz-nav-item").on("click",function(){	
		flag =  $(this).children("a").text();		
		if(!$(this).hasClass("current")){
			$(".snz-nav-item").removeClass("current");
			$(this).addClass("current");
		}
		pageReset();
		setData();
		listAjaxToHtml();			
	});
	
	// 정렬기준 드롭다운 선택시 css
	$(".sortMenu").on("click",function(){
		var selectSortMenu= $(this).children("a").text();
		if(selectSortMenu=="최신순"){
			sortOrder2 = "1";
		}else{
			sortOrder2 = "2";
		}
		//console.log("selectSortMenu : " + selectSortMenu);
		$("#dropdownMenu1 span.selected-item").html(selectSortMenu);
	});
	
	// 라이크 선택시
	$(document).on("click",".rank-image",function(){
		
		var thisEl = $(this);
		//console.log(thisEl);
		
		lecBoardNo = $(this).parents(".listUnit").attr("data-lecBoardNo");
		//console.log(lecBoardNo);
		
		var likeCnt = $(this).next("span").text();
		var likeNum = Number(likeCnt);
		
		var flag;
		// 라이크 해제
		
		if($(this).hasClass("active")){
			flag = "N";	
			likeNum -= 1;
			$(this).removeClass("active");
		}else{
			flag = "Y";
			likeNum += 1;
			$(this).addClass("active");
		}	
		
		 $(this).next("span").text(likeNum);
		 
		$.get("likeSet.ajax",{"lec_board_no":lecBoardNo,"flag":flag},function(){}); 
	});
	
	// 더보기 버튼 선택시
	$(".ques-8-table-more").on("click",function(){
		//testMsg("더보기 버튼 선택");
		pageNum ++;
		$("#pageNum").val(pageNum);
		setData();
		
		$.ajax({
			url: "lec_list_sub.ajax",
			type: "GET",
			data : data,
			success:function(result){
				//console.log(result);
				$("#listAppend").append(result);
			}
		})//.ajax 
	})//.더보기
	
	
	// 검색 버튼 선택시
	$("#lecBoardSrchBtn").on("click",function(){
		likeFlag = true;
		sortOrder3 = $("#srchInput").val();
		pageReset();
		setData();
		listAjaxToHtml();			
	})
	
	
	// 글등록 버튼 선택 - 글 등록 페이지로 이동
	$("#lecBoardRegBtn").on("click",function(){
		location.href = "lec_board_create.do?lec_no="+lec_no;
	});
	
	
	// 게시글 상세 - 상세 페이지로 이동
	$(document).on("click",".boardDetailBtn",function(){
		//lec_no
		lecBoardNo = $(this).parents(".listUnit").attr("data-lecBoardNo");
		console.log("lec_no : " + lec_no);
		console.log("lecBoardNo : " + lecBoardNo);
		
		location.href = "lec_board_detail.do?lec_no="+lec_no+"&lec_board_no="+lecBoardNo; 
	});
	
	// 수강생 관리 버튼 선택
	$("#stuEditBtn").on("click",function(){
		location.href = "lec_stu.do?lec_no="+lec_no;
	});
	
	
	//func
	function listAjaxToHtml(){
		$.ajax({
			url: "lec_list_sub.ajax",
			type: "GET",
			data : data,
			success:function(result){
				//console.log(result);
				$("#listAppend").html(result);
			}
		});
	};
	
	function setData(){
		
		if(flag=='전체'){
			sortOrder1 = 'all';
		}else if(flag=='과제'){
			sortOrder1 = 'A';
		}else if(flag=='수업'){
			sortOrder1 = 'B';
		}else if(flag=='기타'){
			sortOrder1 = 'C';
		}else{
			sortOrder1 = flag.replace(/[^0-9]/g,"");
		}
				
		data = {"pageNum":pageNum,"lec_no":lec_no,"sortOrder1":sortOrder1,"sortOrder2":sortOrder2,"sortOrder3":sortOrder3};
	}
	
	function pageReset(){
		$("#pageNum").val("0");
		pageNum = $("#pageNum").val();
	}
	
</script>
</body>
</html>










<!--  -->

