<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
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
    <link rel="stylesheet" href="../../assets/css/style.css" />
    <link rel="stylesheet" href="common/css/jquery.tag-editor.css" />
    
    <script type="text/javascript" src="common/js/HuskyEZCreator.js" charset="utf-8"></script>
    
    <script type="text/javascript">
     
    	$(document).ready(function(){ 
    		var subj = "<c:out value="${srch.subject}"/>";
    		$('#cate'+subj).addClass('current');
    		
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

    	
	    function cate_click(no,nm) {
	    	
	    	document.getElementById("cate_nm").innerHTML=nm;
	    	$('#subject').val(no);
	    	
	    }
	    
	    function board_save() {
	    	var lec_no = $("#lec_no").val();
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
					document.mainform2.action = "lec_board_save.do?lec_no="+lec_no;
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
    
    </script>
</head>
<body>

	<jsp:include page="../main/top_menu.jsp"  />

<form id="mainform2" name="mainform2" method="post" enctype="multipart/form-data">
<input type="hidden" id="subject" name="subject" />
<input type="hidden" id="file_cnt" name="file_cnt" value="1"/>
<input type="hidden" id="lec_no"  value="${lec_no}"/>

	<div class="container-fluid snz-page-content-container">
    	<div class="row snz-page-content snz-page-write">

        <div class="snz-write-section">

            <div class="write-title">
                <h1>글 등록</h1>
            </div>

            <div class="write-select-info">
                
                    <div class="enter-category">
                        <label for="">카테고리</label>
                        <div class="dropdown">
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                                <span class="selected-item" id="cate_nm">카테고리</span>
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:cate_click('A','과제')">과제</a></li>
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:cate_click('B','수업')">수업</a></li>
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:cate_click('C','기타')">기타</a></li>
                                
                                <c:forEach items="${grouplist}" var="gl">
	                                <li role="presentation">
	                                	<a role="menuitem" tabindex="-1" href="javascript:cate_click('${gl.group_no}','${gl.group_no}조')">${gl.group_no}조</a>
                                	</li>
                  			  	</c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="enter-title">
                        <label for="">제목</label>
                        <input type="text" id="title" name="title" placeholder="제목을 입력하세요."/>
                    </div>
            </div>
            <div class="write-form">
                <div class="enter-action">
            		<label for="" style="margin-bottom:10px">내용</label>
                </div>
                
                <div class="enter-content">
                    <textarea name="cntn" id="cntn" cols="30" rows="10" style="width:95%;min-width:260px; height:412px; display:none;" placeholder="내용을 입력해주세요"></textarea>
                </div>
                <div class="enter-attachment">
                	<div id="file_box">
	                    <label for="">첨부파일</label>
						<div class="fileBox">
							<input type="text" class="fileName" id="fileName1" readonly="readonly" />
							<label for="uploadBtn1" class="btn_file">찾아보기</label>
							<input type="file" id="uploadBtn1" name="uploadBtn1" class="uploadBtn" />
							<span class="add-btn"><a href="javascript:file_add()"><img src="common/img/page/editor/copy.png" alt="파일추가"/></a></span>
							<span class="add-btn"><a href="javascript:file_del()"><img src="common/img/page/editor/del.png" alt="파일삭제"/></a></span>
						</div>
					</div>
                </div>
                <div class="enter-tag" >
                    <label for="" style="display:inline-block;">태그</label>
                    <textarea id="tags" name="tags"></textarea>
                </div>
                <div class="enter-btns">
                    <a href="javascript:board_save()"><input type="button" class="btn btn-primary" value="등록"/></a>
                    <input type="button" class="btn btn-default" value="취소"/>
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
<script src="common/js/jquery.caret.min.js"></script>
 <script src="common/js/jquery.tag-editor.js"></script>


<script>
        // jQuery UI autocomplete extension - suggest labels may contain HTML tags
        // github.com/scottgonzalez/jquery-ui-extensions/blob/master/src/autocomplete/jquery.ui.autocomplete.html.js
        (function($){var proto=$.ui.autocomplete.prototype,initSource=proto._initSource;function filter(array,term){var matcher=new RegExp($.ui.autocomplete.escapeRegex(term),"i");return $.grep(array,function(value){return matcher.test($("<div>").html(value.label||value.value||value).text());});}$.extend(proto,{_initSource:function(){if(this.options.html&&$.isArray(this.options.source)){this.source=function(request,response){response(filter(this.options.source,request.term));};}else{initSource.call(this);}},_renderItem:function(ul,item){return $("<li></li>").data("item.autocomplete",item).append($("<a></a>")[this.options.html?"html":"text"](item.label)).appendTo(ul);}});})(jQuery);

         $(function() {
        	
            $('#tags').tagEditor({ 
            	delimiter: ', ', 
            	placeholder: '태그(콤마(,)로 구분)' }).css('display', 'block').attr('readonly', true);
        }); 
         
</script>

<script type="text/javascript">
var oEditors = [];

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

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

</script>

</body>
</html>