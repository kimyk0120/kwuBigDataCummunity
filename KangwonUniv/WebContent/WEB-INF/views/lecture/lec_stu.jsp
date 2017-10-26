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

<div class="container-fluid snz-page-container">
    <div class="container snz-page-container-inner">
        <div class="row snz-page-title">
            <h1>강의 > ${lecTitle} > 수강생</h1>
        </div>
        <div class="row snz-page-nav lec-page-nav">
            <div class="snz-nav-item-outer">
                <div class="snz-nav-item-inner">
                    <span class="snz-nav-item current"><a href="#">전체</a></span>
                    <span class="snz-nav-item"><a href="#">과제</a></span>
                    <span class="snz-nav-item"><a href="#">수업</a></span>
                    <span class="snz-nav-item"><a href="#">기타</a></span>
                    <c:forEach items="${grouplist}" var="gl">
	                    <span class="snz-nav-item" data-gourpno="${gl.group_no}" data-value-declared><a>${gl.group_no}조</a></span>
                    </c:forEach>
                </div>
            </div>
            <div class="snz-subnav-search snz-lec-subnav-search">
                 <div class="dropdown lec-select-dropdown">
                     <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                         <span class="selected-item">조선택</span>
                         <span class="caret"></span>
                     </button>
                     <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                     <li role="presentation" class="groupSortingBtn"><a role="menuitem" tabindex="-1"  data-gourpno="" data-value-declared>전체</a></li>
                     <c:forEach items="${grouplist}" var="gl">
                         <li role="presentation" class="groupSortingBtn">
                         	<a role="menuitem" tabindex="-1"  data-gourpno="${gl.group_no}" data-value-declared>${gl.group_no}조</a>
                       	</li>
                     </c:forEach>
                     </ul>
                 </div>
            </div>
        </div>
    </div>
</div><div class="container-fluid snz-page-content-container">

    <div class="row snz-page-content snz-page-ques-8-section snz-page-stu-list-section">
        <div class="snz-add-btn">
            <a>
            	<label for="excelFileUp">
	            	<img src="../../assets/img/page/shape-1224-copy.png" alt="" id="excelFileUploadBtn">
            	</label>
            	<input type="file" name="excelFileUp" id="excelFileUp" style="display: none;" value="" >
            </a>
        </div>
        <div class="stu-top-btns">
            <a ><img src="../../assets/img/page/org-add.png" alt="" id="groupAddBtn"></a>
            <a ><img src="../../assets/img/page/org-del.png" alt="" id="groupDelBtn"></a>
        </div>
        <table class="table ques-8-table">
            <thead>
            <tr>
                <th>No.</th>
                <th>아이디</th>
                <th class="head-center">성명</th>
                <th class="head-center">조편성</th>
            </tr>
            </thead>
            <tbody id="stuListBody">
           
            <!-- list unit -->
            <c:set value="선택" var="initGroup"></c:set>
            <c:forEach items="${studentList}" var="sl" varStatus="stat" >
            <tr>
                <td class="body-no"><span class="ques-8-table-no">${stat.index+1}</span></td>
                <td class="body-name"><span class="ques-8-table-img"><img src="../../assets/img/page/layer-710.png" alt=""></span><span class="ques-8-table-name">${sl.id}</span></td>
                <td class="body-count body-rname"><span class="ques-8-table-count">${sl.name}</span></td>
                <td class="body-org">
                     <div class="dropdown" style="text-align: center;">  
                        <button class="btn btn-default dropdown-toggle dropdownMenu2" type="button"  data-toggle="dropdown" aria-expanded="false">
                            <span class="selected-item">
                            	<c:forEach items="${grouplist}" var="gl">
                            			<c:if test="${gl.group_no eq sl.group_no}">
                            				<c:set value="${gl.group_no}조" var="initGroup"></c:set>
                            			</c:if>
                            	</c:forEach>	
                            	${initGroup}
                            </span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
                        	<c:forEach items="${grouplist}" var="gl">
	                            <li role="presentation" class="groupArrBtn" >
	                            	<input type="hidden" name="stuId" value="${sl.id}">
	                            	<a role="menuitem" tabindex="-1" data-gourpno="${gl.group_no}" data-value-declared>${gl.group_no}조</a>
                            	</li>
                        	</c:forEach>
                        </ul>
                    </div>
                </td>
            </tr>
            </c:forEach>
            <!-- .list Unit -->
            
            </tbody>
        </table>
    </div>
    
    <form id="excelFileForm" action="test.do" method="post" encType="multipart/form-data"></form>
		
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
	var sortOrder2 = "";
	var arrOrder = "";
	var selectId  = "";
	var form = $('form')[0];
 	var formData = new FormData(form);
	
	// 검색 조 드롭다운 선택시 
	$(".groupSortingBtn").on("click",function(){
		
		sortOrder2 = $(this).children("a").text();
		$("#dropdownMenu1 > .selected-item").html(sortOrder2);
		sortOrder2 = sortOrder2.replace(/[^0-9]/g,"");
		
		$.get("lec_stu.ajax",{"lec_no":lec_no,"sortOrder2":sortOrder2},function(result){
			$("#stuListBody").html(result);						
		});
	});
	
	
	// 조편성 드롭다운 선택시 - 조편성 업데이트
	$(document).on("click",".groupArrBtn",function(){
		arrOrder =  $(this).children("a").text();
		$(this).parents("td.body-org").find(".dropdownMenu2 > .selected-item").html(arrOrder);
		arrOrder = arrOrder.replace(/[^0-9]/g,"");
		stuId = $(this).children("input[name=stuId]").val();
		
		$.get("stu_group_update.ajax",{"lec_no":lec_no,"arrOrder":arrOrder,"id":stuId},function(result){});
		
	});
	
	
	// 게시판 검색분류 선택 - 상위 게시판으로 이동
	$(".snz-nav-item").on("click",function(){	
		flag =  $(this).children("a").text();		
		if(!$(this).hasClass("current")){
			$(".snz-nav-item").removeClass("current");
			$(this).addClass("current");
		}
		setData();
		goSublist();			
	});
	
	
	// 조추가 선택시 
	$("#groupAddBtn").on("click",function(){
		//console.log("groupAddBt");
		$.get("lec_group_add.ajax",{"lec_no":lec_no},function(result){
			 if(result == 1){
				 location.reload();
			 }else if(result == -1){
				 alert("5개 이상 추가할 수 없습니다. ");
			 }
		});
	});
	
	
	
	// 조삭제 선택시 
	$("#groupDelBtn").on("click",function(){
		$.get("lec_group_del.ajax",{"lec_no":lec_no},function(result){
			 if(result == 1){
				 location.reload();
			 }else if(result == -1){
				 alert("조가 1개 이하이거나 소속된 수강생이 있습니다.");
			 }
		});
	});
	
	
	// 파일 추가시 
	$("input[name=excelFileUp]").on("change",function(){
		var files = $(this).prop('files');
		var file = files[0];
		console.log(file);
		formData.append("excelFile",file);
		console.log(formData);
		
		$.ajax({
	        url: "excelFileUpload.ajax?lec_no="+lec_no,
	        processData: false,
	        contentType: false,
	        data: formData,
	        type: 'POST',
	        success: function(result){
	        	 alert("등록이 완료되었습니다.");
	        	 location.reload();
	        },
	        error:function(){
	        	alert("error");
	        }
	    });
		
	});
	
		
	
	//func
	function goSublist(){
		location.href = "lec_list_sub.do?lec_no="+lec_no+"&sortOrder1="+sortOrder1;
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
				
		data = {"lec_no":lec_no,"sortOrder1":sortOrder1};
	}
</script>
</body>
</html>





<!-- end -->