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
			var m = "<c:out value="${msg}"/>";
			
			if(m != "") {
				alert(m);
			}
			
		});
	
		function go_join() {
			location.href = "join.do";
		}
		
		function go_main() {
			location.href = "main.do";
		}
		
		function go_login() {

			if($('#id').val() == "") {
				alert("아이디를 입력하세요.");
				$('#id').focus();
				return;
			} else if($('#password').val() == "") {
				alert("비밀번호를 입력하세요");
				$('#password').focus();
				return;
	    	}  else {
				document.mainform.action = "login_check.do";
				document.mainform.submit();
			}
		}
	
	</script>

</head>
<body>

<form id="mainform" name="mainform" action="" method="post">
<div class="container-fluid snz-member-container"><div class="row snz-login">
    <div class="snz-member-outer">
        <div class="snz-member-close">
            <a href="javascript:go_main()"><img src="./common/img/member/x.png" alt="" /></a>
        </div>
        <div class="snz-member-title">Login</div>
        <div class="snz-member-img"><img src="./common/img/member/users-2-copy.png" alt=""/></div>
        <div class="snz-member-form">
                <div class="input-group">
                    <label for="">아이디 : </label>
                    <input type="text" placeholder="아이디를 입력해주세요." class="snz-id-input" id="id" name="id"/>
                </div>
                <div class="input-group">
                    <label for="">비밀번호 : </label>
                    <input type="password" placeholder="●●●●●●●●" class="snz-password-input" id="password" name="password"/>
                </div>
                <div class="input-group snz-submit">
                    <a href="javascript:go_login();"><input type="button" class="btn btn-primary" value="로그인" /></a>
                </div>
        </div>
        <div class="snz-member-foot-link">
            <a href="javascript:go_join()">회원가입</a>
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
</body>
</html>