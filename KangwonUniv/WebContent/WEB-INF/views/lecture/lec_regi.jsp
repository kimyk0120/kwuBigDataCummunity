<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>강의등록</title>
    <link rel="stylesheet" href="../../assets/lib/bootstrap-3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/style.css">    
</head>
<body>

<jsp:include page="../main/top_menu.jsp"  />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>

<div class="container-fluid snz-page-content-container">
    <div class="row snz-page-content snz-page-write">
        <div class="snz-write-section lec-write-section">
            <div class="write-title">
                <h1>강의 등록</h1>
            </div>

            <div class="write-select-info">
                    <div class="enter-category">
                        <label for="">강의년도</label>
                        <div class="dropdown">
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                                <span class="selected-item">${sysYear}</span>
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="dropdownMenu1List">
                                <c:forEach var="i" begin="0" end="2" varStatus="stat" step="1">                        	
                            		<li role="presentation" class="lecYear"><a role="menuitem" tabindex="-1" >${sysYear+i}</a></li>
                        		</c:forEach>
                            </ul>
                        </div>

                        <label for="">학년</label>
                        <div class="dropdown">
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-expanded="false">
                                <span class="selected-item">학년</span>
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
                                <li role="presentation" class="lecGrade"><a role="menuitem" tabindex="-1" >1학년</a></li>
                                <li role="presentation" class="lecGrade"><a role="menuitem" tabindex="-1" >2학년</a></li>
                                <li role="presentation" class="lecGrade"><a role="menuitem" tabindex="-1" >3학년</a></li>
                                <li role="presentation" class="lecGrade"><a role="menuitem" tabindex="-1" >4학년</a></li>
                            </ul>
                        </div>

                        <label for="">학기</label>
                        <div class="dropdown">
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu3" data-toggle="dropdown" aria-expanded="false">
                                <span class="selected-item">학기</span>
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu3">
                                <li role="presentation" class="lecSemester"><a role="menuitem" tabindex="-1" >1학기</a></li>
                                <li role="presentation" class="lecSemester"><a role="menuitem" tabindex="-1" >2학기</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="enter-title">
                        <label for="">강의명</label>
                        <input type="text" placeholder="강의명을 입력하세요." id="lecTitle">
                    </div>
                    <div class="enter-title">
                        <label for="">교과과정</label>
                        <input type="text" placeholder="교과과정을 입력하세요." id="lecProc">
                    </div>
            </div>
            <div class="write-form">
                <div class="enter-title enter-schedule">
                    <label for="">강의계획서</label>
                </div>

				<div class="enter-content">
                    <textarea name="cntn" id="cntn" cols="30" rows="10" style="width:95%;min-width:260px; height:412px; display:none;" placeholder="내용을 입력해주세요"></textarea>
                </div>
				
                <div class="enter-btns">
                    <input type="button" class="btn btn-primary" value="등록" id="lecRegOk">
                    <input type="button" class="btn btn-default" value="취소" id="lecRegCancel" onclick="javascript:location.href='lecList.do'">
                </div>
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
<script src="common/js/jquery.caret.min.js"></script>
<script type="text/javascript" src="common/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">

// init
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "cntn",
	sSkinURI: "common/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});


var selectYear = new Date().getFullYear();
var selectGrade ="";
var selectSemester ="";
var lecTitle ="";
var lecProc = "";
var lecPlan = "";
var start_dt = "";
var end_dt = "";

// 강의년도 선택 css
$(".lecYear").on("click",function(){
	selectYear = $(this).children("a").text();
	//console.log("selectYear : " + selectYear);
	$("#dropdownMenu1 span.selected-item").html(selectYear);
})

// 학년 선택 css
$(".lecGrade").on("click",function(){
	selectGrade = $(this).children("a").text();
	//console.log("selectYear : " + selectYear);
	$("#dropdownMenu2 span.selected-item").html(selectGrade);
})

// 학기 선택 css
$(".lecSemester").on("click",function(){
	selectSemester = $(this).children("a").text();
	//console.log("selectYear : " + selectYear);
	$("#dropdownMenu3 span.selected-item").html(selectSemester);
})


// 등록 버튼 선택시 
$("#lecRegOk").on("click",function(){
	
	selectGrade = removeStr(selectGrade);
	selectSemester = removeStr(selectSemester);
	lecTitle = $("#lecTitle").val();
	lecProc = $("#lecProc").val();	
	
	oEditors.getById["cntn"].exec("UPDATE_CONTENTS_FIELD", []);	
	lecPlan = $('#cntn').val();
	
	var postYear = String(selectYear);
	var postsub = postYear.substr(2,2);
	if(selectSemester=='1'){
		start_dt = postsub + "-" + "01-01";
		end_dt = postsub + "-" + "06-30";
	}else{
		start_dt = postsub + "-" + "06-01";
		end_dt = postsub + "-" + "12-31";
	}
	
	if(selectGrade==""){
		alert("학년을 선택해 주세요");
		return false;
	}
	
	if(selectSemester==""){
		alert("학기를 선택해 주세요");
		return false;
	}
	
	if(lecTitle==""){
		alert("강의명을 입력해 주세요");
		return false;
	}
	
	if(lecProc==""){
		alert("교과과정을 입력해 주세요");
		return false;
	}
	
	if(lecProc==""){
		alert("교과과정을 입력해 주세요");
		return false;
	}
	
	/* console.log("selectYear :" + selectYear );
	console.log("selectGrade :" + selectGrade );
	console.log("selectSemester :" + selectSemester );
	console.log("lecTitle :" + lecTitle );
	console.log("lecProc :" + lecProc );
	console.log("lecPlan :" + lecPlan );
	console.log("start_dt :" + start_dt );
	console.log("end_dt :" + end_dt ); */
	
	var data = {
				  "lec_title":lecTitle,
				  "lec_cors":lecProc,
				  "lec_plan":lecPlan,
				  "start_dt":start_dt,
				  "end_dt":end_dt,
				  "year":selectYear,
				  "grade":selectGrade,
				  "term":selectSemester
			    };
	
	$.post("lecCreate.ajax",data,function(result){
		//console.log(result);
		location.href="lecList.do";
	})	
})//. 등록 버튼 선택


//func
function removeStr(str){	
	var replacedStr = str.replace(/[^0-9]/g,"");
	return replacedStr;
}


</script>
</body>
</html>