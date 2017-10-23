<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>

<script type="text/javascript">

	function go_menu(no) {
		
		//$('#mainMenu'+no).addClass('current');
		
		if(no == "1") {
			location.href = "info_list.do";
		} else if(no == "3") {
			location.href = "practice_list.do";
		} 
		
		
	}
	
	function user_edit() {
		
	}
	
	function go_main() {
		location.href = "main.do";
	}
	
	function go_login() {
		location.href = "login.do";
	}
	
	

</script>
</head>
<body>

<nav class="navbar navbar-default">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="javascript:go_main()">Service name</a>
            <button type="button" class="navbar-toggle collapsed nav-search-mo nav-search-mo-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
                <!-- <a type="submit" class=""><img src="./common/img/main/shape-2.png" alt=""/></a> -->
                <c:set value="<%=session.getAttribute(\"UserImg\") %>" var="img" />
                 	<c:set value="${fn:length(img)}" var="chk" />
                 	<c:choose>
                 	<c:when test="${chk gt 0}">
                 		<a href="javascript:user_edit()"><img src="./files/user/${img}" alt="" style="height:60px;width:60px"/></a>
                 	</c:when>
                 	<c:otherwise>
                 		<a href="javascript:go_login()"><img src="./common/img/common/shape-1.png" alt=""/></a>
                 	</c:otherwise>
                 	</c:choose>
            </button>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <div class="nav navbar-nav snz-header-link-center">
                <div class="snz-header-link-center-inner">
                    <span class="snz-center-link only-mobile-display"><a href="#"><img src="./common/img/common/user.png" alt=""><span class="hello-user-text">Hello, <i>GruData</i></span></a></span>
                    <span class="snz-center-link" id="mainMenu1"><a href="javascript:go_menu('1')">정보창고</a></span> <span class="snz-center-bullet">
                    <img src="./common/img/common/ellipse-2-copy-2.png" alt=""/></span>
                    <span class="snz-center-link" id="mainMenu2"><a href="#">튜토리얼</a></span> <span class="snz-center-bullet">
                    <img src="./common/img/common/ellipse-2-copy-2.png" alt=""/></span>
                    <span class="snz-center-link" id="mainMenu3"><a href="javascript:go_menu('3')">실전문제</a></span> <span class="snz-center-bullet">
                    <img src="./common/img/common/ellipse-2-copy-2.png" alt=""/></span>
                    <span class="snz-center-link" id="mainMenu4"><a href="lecList.do">강의</a></span>
                    <span class="snz-center-link only-mobile-display"><a href="#"><img src="./common/img/common/logout.png" alt=""/> Logout</a></span>
                </div>
            </div>

            <div class="navbar-form navbar-right" role="search">
                <div class="form-group">
                    <span>
                    	<c:set value="<%=session.getAttribute(\"UserImg\") %>" var="img" />
                    	<c:set value="${fn:length(img)}" var="chk" />
                    	<c:choose>
                    	<c:when test="${chk gt 0}">
                    		<a href="javascript:user_edit()"><img src="./files/user/${img}" alt="" style="height:28px;width:28px"/></a>
                    	</c:when>
                    	<c:otherwise>
                    		<a href="javascript:go_login()"><img src="./common/img/common/shape-1.png" alt=""/></a>
                    	</c:otherwise>
                    	</c:choose>
                    </span>
                    <div class="form-group">
                    	<input type="text" class="form-control" placeholder="SEARCH" />
                    </div>
                </div>
                <a type="submit"><img src="./common/img/main/shape-2.png" alt=""/></a>
            </div>
        </div><!-- /.navbar-collapse -->
        <div class="collapse navbar-collapse nav-search-mo-outer-toggle" id="bs-example-navbar-collapse-2">
            <a type="submit" class="nav-search-mo nav-search-mo-inner-toggle"><img src="./common/img/main/shape-2.png" alt=""/></a>
            <input type="text" class="form-control" placeholder="Search" />
        </div>
    </div><!-- /.container-fluid -->
</nav>

</body>
</html>