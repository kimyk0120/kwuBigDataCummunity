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

<div class="container-fluid snz-page-container">
    <div class="container snz-page-container-inner">
        <div class="row snz-page-title">
            <h1>강의</h1>
        </div>
        <div class="row snz-page-nav lec-page-nav">
            <span class="snz-nav-item current"><a>전체</a></span>
            <span class="snz-nav-item"><a>내강의</a></span>

            <div class="snz-subnav-search">
                <form class="navbar-form navbar-right" role="search">
                    <span>강의년도</span>
                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                            <span class="selected-item">${sysYear}</span>
                            <span class="caret lec-caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="dropdownMenu1List">                        	
                        	<c:forEach var="i" begin="0" end="4" varStatus="stat" step="1">                        	
                            	<li role="presentation" class="lecYear"><a role="menuitem" tabindex="-1" >${sysYear-i}</a></li>
                        	</c:forEach>                            
                        </ul>
                    </div>
                    <span>학기</span>
                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-expanded="false">
                            <span class="selected-item">1학기</span>                            
                            <span class="caret lec-caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2" id="dropdownMenu2List">
                            <li role="presentation" class="lecSemester"><a role="menuitem" tabindex="-1" >1학기</a></li>
                            <li role="presentation" class="lecSemester"><a role="menuitem" tabindex="-1" >2학기</a></li>
                        </ul>
                    </div>
                    <a id="lecListSrch"><img src="../../assets/img/page/shape-2.png" alt=""></a> <!-- submit 제거 -->
                </form>
            </div>

        </div>
    </div>
</div>

<div class="container-fluid snz-page-content-container">
    <div class="row snz-page-content snz-page-lec-section snz-page-lec-list-section">
        <div class="snz-add-btn">
            <a id="lecCreate"><img src="../../assets/img/page/shape-1223-copy.png" alt=""></a>
        </div>
        <table class="table ques-8-table lec-table">
            <thead>
            <tr class="only-desktop-display">
                <th>강의년도</th>
                <th>학년</th>
                <th>학기</th>
                <th>교과과정</th>
                <th>강의명</th>
                <th>강의계획서</th>
                <th>수강인원</th>
                <th>수강여부</th>
            </tr>
            </thead>
            <tbody>
			
			<!-- 강의 리스트 -->
			<c:forEach items="${list}" var="ll" varStatus="status">			
			<tr data-lecNo="${ll.lec_no}" data-value-declared class="lecUnit">						
                <td class="only-desktop-display"><span class="">${ll.year}</span></td>
                <td class="only-desktop-display"><span class="">${ll.grade}학년</span></td>
                <td class="only-desktop-display"><span class="">${ll.term}학기</span></td>
                <td class="only-desktop-display"><span class="">${ll.lec_title}</span></td>
                <td class="body-lecture-title"><span class="only-desktop-display">${ll.lec_cors}</span></td>                    
                <td class="only-desktop-display">
                	<span>
                		<a>
                			<img src="../../assets/img/page/shape-718.png" alt="" class="lecPlanBtn">
                		</a>
                	</span>
               	</td>
                <td class="body-lecture-number only-desktop-display"><span>${ll.stdtcnt}명</span></td>
                <td>              
                	<span class="only-desktop-display ${ll.attndYn == '수강중' ? 'body-attend' : ''}" >${ll.attndYn}</span>           			
                </td>
            </tr>
			</c:forEach>

            </tbody>
        </table>
        
        <!-- 더보기 버튼 영역 -->
		<div class="ques-8-table-more" style="margin:0">
		            <div class="more-trigger"><a>더보기</a></div>
		            <!-- <div class="rest-count"><span>15 / 137</span></div> -->
        </div>		
    </div>
</div>
<!-- </div> -->
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">강의계획서</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
            Body
      </div>
      <!-- Footer -->
       <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<div class="snz-modal-layer"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="../../assets/lib/bootstrap-3.3.2/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/f0cba26d23.js"></script>
<script src="../../assets/js/script.js"></script>
<script type="text/javascript">

	var pageNum = $("#pageNum").val();
	var selectYear;
	var selectSemester;
	var flag = "전체";
	var data;
	var lecNO;
	//console.log("pageNum : " + pageNum);
	
	// 전체 강의, 내강의 선택 css, ajax
	$(".snz-nav-item").on("click",function(){	
		flag =  $(this).children("a").text();		
		
		if(!$(this).hasClass("current")){
			$(".snz-nav-item").removeClass("current");
			$(this).addClass("current");
		}
		pageReset();			
		setSearchYearSemester();
		setData();
		listAjaxHtml();
			
			
	})//.전체 강의, 내강의 선택 css, ajax
	
	// 검색 년도 선택시 변경 css
	$(".lecYear").on("click",function(){
		var selectYear = $(this).children("a").text();
		//console.log("selectYear : " + selectYear);
		$("#dropdownMenu1 span.selected-item").html(selectYear);
	})
	
	// 학기 선택시 변경 css
	$(".lecSemester").on("click",function(){
		var selectSemester = $(this).children("a").text();
		//console.log("selectSemester : " + selectSemester);
		$("#dropdownMenu2 span.selected-item").html(selectSemester);
	})
	
	// 검색 버튼 선택 
	$("#lecListSrch").on("click",function(){
		pageReset();
		setSearchYearSemester();
		setData();
		listAjaxHtml();		
	})
	
	// 더보기 버튼 선택시
	$(".ques-8-table-more").on("click",function(){
		//testMsg("더보기 버튼 선택");
		pageNum ++;
		$("#pageNum").val(pageNum);
		setSearchYearSemester();
		setData();
		
		$.ajax({
			url: "lecList.ajax",
			type: "GET",
			data : data,
			success:function(result){
				$(".table.ques-8-table.lec-table > tbody").append(result);
			}
		})//.ajax 
	})//.더보기
	
	
	// 강의 등록 버튼 선택 - 강의 등록 페이지로 이동
	$("#lecCreate").on("click",function(){location.href="lecCreate.do";})
	
	
	// 강의 계획서 선택시 - 모달 출력
	$(document).on("click",".lecPlanBtn",function(){
		lecNO = $(this).parents("tr").attr("data-lecNo");
		//console.log(lecNO);
		
		$.ajax({
			url: "lecPlan.ajax",
			type: "GET",
			data : {"lec_no":lecNO},
			success:function(result){
				$("div.modal-body").html(result);
				$("div.modal").modal(); 
			}
		})//.ajax
	})
	
	
	// 강의 선택시 - 강의 하위 리스트로 이동
	$(document).on("click",".lecUnit > td:not(:nth-child(6))",function(){
		console.log("test");
		lecNO =  $(this).parents("tr").attr("data-lecNo");
		location.href = "lec_list_sub.do?lec_no="+lecNO; 
	})
	
		
	// func
	function listAjaxHtml(){
		$.ajax({
			url: "lecList.ajax",
			type: "GET",
			data : data,
			success:function(result){
				$(".table.ques-8-table.lec-table > tbody").html(result);
			}
		})//.ajax
	}
	
	function setData(){
		if(flag == "전체"){			
			data = {"pageNum":pageNum,"selectYear":selectYear,"selectSemester":selectSemester};
		}else{ // 내강의
			data = {"pageNum":pageNum,"selectYear":selectYear,"selectSemester":selectSemester,"isMine":"Y"};
		}
	}
	
	function testMsg(msg){
		console.log("msg : " + msg);
	}
	
	function setSearchYearSemester(){
		selectYear = $("#dropdownMenu1 span.selected-item").html();
		selectSemester = $("#dropdownMenu2 span.selected-item").html();
		selectSemester = selectSemester.replace(/[^0-9]/g,"");
		console.log( this.selectYear + ", " + this.selectSemester );
	}
	
	function pageReset(){
		$("#pageNum").val("0");
		pageNum = $("#pageNum").val();
	}
	
</script>
</body>
</html>