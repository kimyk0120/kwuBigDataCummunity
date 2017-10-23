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

</head>
<body>

<jsp:include page="main/top_menu.jsp"  />

<div class="container-fluid snz-main-container"><div class="row snz-main">

    <div class="row snz-main-section snz-main-title">
        <h1>Learn Data Science, Share Knowledge</h1>
        <p>여러분도 미래의 데이터 사이언티스트가 될 수 있습니다.</p>
    </div>

    <div class="row snz-main-section snz-main-cards">
        <span class="main-card01">
            <div class="snz-cards-img"><img src="./common/img/main/shape-702.png" alt=""/></div>
            <h3>정보창고</h3>
            <div class="snz-cards-desc card01">
                빅데이터 분석을 위한 <br>
                동영상, 컨퍼런스 및 세미나 등
                다양한 학습자료를 제공합니다.
            </div>
            <div class="snz-cards-desc-mo card01">
                학습자료 제공
            </div>
            <a href="./info_list.do" class="snz-cards-link">View</a>
        </span>
        <span class="main-card02">
            <div class="snz-cards-img"><img src="./common/img/main/shape-701.png" alt=""/></div>
            <h3>튜토리얼</h3>
            <div class="snz-cards-desc card02">
                빅데이터 분석 방법에 대한
                소스 코드 및 분석 결과 값을
                공유합니다.
            </div>
            <div class="snz-cards-desc-mo card01">
                코드 분석 공유
            </div>
            <a href="#" class="snz-cards-link">View</a>
        </span>
        <span class="main-card03">
            <div class="snz-cards-img"><img src="./common/img/main/shape-1220.png" alt=""/></div>
            <h3>실전문제</h3>
            <div class="snz-cards-desc card03">
                빅데이터 분석 공모에
                응모하여 문제를 해결하고
                상금을 획득합니다.
            </div>
            <div class="snz-cards-desc-mo card02">
                분석 공모 응모
            </div>
            <a href="/page/ques_list" class="snz-cards-link">View</a>
        </span>
        <span class="main-card04">
            <div class="snz-cards-img"><img src="./common/img/main/shape-699.png" alt=""/></div>
            <h3>강의</h3>
            <div class="snz-cards-desc card03">
                강원대학교 학생들을 위한
                강의 신청 및 수업 활동 기능을
                제공합니다.
            </div>
            <div class="snz-cards-desc-mo card04">
                강의 신청
            </div>
            <a href="/page/lec_list" class="snz-cards-link">View</a>
        </span>
    </div>

</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./common/lib/bootstrap-3.3.2/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/f0cba26d23.js"></script>
<script src="./common/js/script.js"></script>
</body>
</html>