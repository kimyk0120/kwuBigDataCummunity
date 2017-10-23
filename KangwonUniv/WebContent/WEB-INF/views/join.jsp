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
	
	<script type="text/javascript" src="./common/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="./common/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="./common/js/dropzone.js"></script>
	
    <title></title>
    <link rel="stylesheet" href="./common/lib/bootstrap-3.3.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./common/css/style.css"/>

	<script type="text/javascript">
	
		$(document).ready(function(){ 
			
			$(function(){
				  $('#file-input').change(function(){
				    var input = this;
				    var url = $(this).val();
				    var ext = url.substring(url.lastIndexOf('.') + 1).toLowerCase();
				    if (input.files && input.files[0]&& (ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg")) 
				     {
				        var reader = new FileReader();
	
				        reader.onload = function (e) {
				           $('#pre-img').attr('src', e.target.result);
				           $('#pre-img').css('height', '100px');
				           $('#pre-img').css('width', '100px');
				        }
				       reader.readAsDataURL(input.files[0]);
				    }
				    else
				    {
				      $('#pre-img').attr('src', './common/img/member/users-2-copy.png');
				    }
				  });
	
			});
		}); 
			
		function go_login() {
			location.href = "login.do";
		}

		function go_join() {

			var pwdResult = _chkpasswd($('#password').val());
			
			var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;  
			
			if($('#name').val() == "") {
				alert("이름을 입력하세요.");
				return;
			} else if($('#email').val() == "") {
				alert("이메일을 입력하세요");
				$('#email').focus();
				return;
			} else if(regex.test($('#email').val()) === false) {  
			    alert("잘못된 이메일 형식입니다.");  
			    $('#rprt_email').focus();
			    return;  
			} else if(pwdResult == 2){
	    		alert("비밀번호의 길이는 8~20까지 입니다.");
	    		$('#password').focus();
	    		return;
	    	}  else {
				if(confirm("저장하시겠습니까?")) {
					document.mainform2.action = "join_save.do";
					document.mainform2.submit();
				}
			}
		}
		
		function _chkpasswd(pw1){
	
			/* 비밀번호 확인과 동일해야함 */
			/* 비밀번호의 길이는 8~20 */
			if(pw1.length < 8 || pw1.length > 20) {
				return 2;
			}
			
			return 0;
		}
		
	</script>
	
	<style type="text/css">
	    .image-upload > input { display: none; }
    </style>
    
</head>
<body>

<form id="mainform2" name="mainform2" method="post" enctype="multipart/form-data">
<div class="container-fluid snz-member-container"><div class="row snz-login snz-join">
    <div class="snz-member-outer">
        <div class="snz-member-close">
            <a href="javascript:go_login()"><img src="./common/img/member/x.png" alt=""/></a>
        </div>
        <div class="snz-member-title">Join us</div>
        <div class="snz-member-img">
            <img id="pre-img" src="./common/img/member/users-2-copy.png" alt="" />
            <div class="filebox preview-image">
            	<div class="image-upload">
            		<label for="file-input">
	            		<span style="cursor:pointer"><img src="./common/img/member/camera-copy.png" alt=""/></span>
	            	</label>
	            	<input id="file-input" type="file" name="file-input" onchange="readURL(this)" />
				</div>
            </div>
        </div>
        <div class="snz-member-form">
            <div class="input-group">
                <label for="">이름 : </label>
                <input type="text" placeholder="이름을 입력해주세요." class="snz-id-input" id="name" name="name"/>
            </div>
            <div class="input-group">
                <label for="">이메일 : </label>
                <input type="email" placeholder="email@sample.com" class="snz-id-input" id="email" name="email"/>
            </div>
            <div class="input-group">
                <label for="">비밀번호 : </label>
                <input type="password" placeholder="●●●●●●●●" class="snz-password-input" id="password" name="password"/>
            </div>
            <div class="snz-member-check">
                <input type="checkbox" id="chk" name="chk" value="Y"/>
                <label for="chk"><span></span><a href="#">개인정보 수집 및 이용</a>에 동의합니다.</label>
            </div>
            <div class="input-group snz-submit">
                <input type="text" class="btn btn-primary snz-join-submit" value="회원가입" onclick="javascript:go_join()"/>
            </div>
        </div>
    </div>
</div></div>
</form>

<div class="snz-modal-layer"></div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./common/lib/bootstrap-3.3.2/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/f0cba26d23.js"></script>
<script src="./common/js/script.js"></script>
<script src="common/js/jquery.caret.min.js"></script>

</body>
</html>