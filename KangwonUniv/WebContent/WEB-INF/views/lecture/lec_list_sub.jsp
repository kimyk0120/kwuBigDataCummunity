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
<nav class="navbar navbar-default">
    <div class="container snz-page-header-container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed nav-collapse-mo" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="nav-collapse-mo-inner"></span>
            </button>
            <a class="navbar-brand" href="/">Service name</a>
            <button type="button" class="navbar-toggle collapsed nav-search-mo nav-search-mo-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
                <a type="submit" class="nav-search-mo-inner"></a>
            </button>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <div class="nav navbar-nav snz-header-link-center">
                <div class="snz-header-link-center-inner">
                    <span class="snz-center-link only-mobile-display"><a href="#"><img src="../../assets/img/common/user.png" alt=""><span class="hello-user-text">Hello, <i>GruData</i></span></a></span>
                    <span class="snz-center-link"><a href="/page/info_list">정보창고</a></span> <span class="snz-center-bullet"><img
                                src="../../assets/img/common/ellipse-2-copy-2.png" alt=""></span>
                    <span class="snz-center-link"><a href="#">튜토리얼</a></span> <span class="snz-center-bullet"><img
                                src="../../assets/img/common/ellipse-2-copy-2.png" alt=""></span>
                    <span class="snz-center-link"><a href="/page/ques_list">실전문제</a></span> <span class="snz-center-bullet"><img
                                src="../../assets/img/common/ellipse-2-copy-2.png" alt=""></span>
                    <span class="snz-center-link"><a href="/page/lec_list">강의</a></span>
                    <span class="snz-center-link only-mobile-display"><a href="#"><img src="../../assets/img/common/logout.png" alt=""> Logout</a></span>
                </div>
            </div>

            <form class="navbar-form navbar-right" role="search">
                <div class="form-group">
                    <span><img src="../../assets/img/common/shape-1.png" alt=""></span>
                    <input type="text" class="form-control" placeholder="SEARCH">
                </div>
                <a type="submit"><img src="../../assets/img/main/shape-2.png" alt=""></a>
            </form>
        </div><!-- /.navbar-collapse -->
        <div class="collapse navbar-collapse nav-search-mo-outer-toggle" id="bs-example-navbar-collapse-2">
            <a type="submit" class="nav-search-mo nav-search-mo-inner-toggle"><img src="../../assets/img/common/search-inner.png" alt=""></a>
            <input type="text" class="form-control" placeholder="Search">
        </div>
    </div><!-- /.container-fluid -->
</nav>

<div class="container-fluid snz-page-container">
    <div class="container snz-page-container-inner">
        <div class="row snz-page-title">
            <h1>정보창고</h1>
        </div>
        <div class="row snz-page-nav clearfix">
            <div class="snz-nav-item-outer">
                <div class="snz-nav-item-inner">
                    <span class="snz-nav-item current"><a href="#">전체</a></span>
                    <span class="snz-nav-item"><a href="#">Python</a></span>
                    <span class="snz-nav-item"><a href="#">R</a></span>
                    <span class="snz-nav-item"><a href="#">SAS</a></span>
                    <span class="snz-nav-item"><a href="#">SPSS</a></span>
                    <span class="snz-nav-item"><a href="#">EXCEL</a></span>
                    <span class="snz-nav-item"><a href="#">기타</a></span>
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
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">최신순</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">이름순</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">참여 인기순</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">마감순</a></li>
                        </ul>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <a href="#"><img src="../../assets/img/page/shape-2.png" alt=""></a> <!-- submit 제거 -->
                </div>

            </div>
        </div>
    </div>
</div><div class="container-fluid snz-page-content-container">
    <div class="row snz-page-content snz-info-list-content">
        <div class="snz-add-btn">
            <a href="#"><img src="../../assets/img/page/shape-1223-copy.png" alt=""></a>
        </div>

        <div class="info-list-item clearfix">
            <div class="info-list-item-inner clearfix">
                <div class="item-number">
                    <span class="rank-image"></span>
                    <span>12</span>
                </div>
                <div class="item-desc">
                    <div class="item-title">
                        <a href="/page/info_detail"><h4>프리미어리그 경기 결과 예측</h4></a>
                        <span class="item-desc-inner-cate-up">R</span>
                    </div>
                    <div class="item-tags">
                        <span>R</span>
                        <span>텍스트 분석</span>
                        <span>예측 분석 모델링</span>
                        <span>데이터 파싱</span>
                        <span>군집분석</span>
                    </div>
                    <div class="item-info">
                        <span><img src="../../assets/img/page/view-icon.png" alt=""></span>
                        <span class="item-view">101 View</span> <span class="item-bullet">&bullet;</span> <span class="item-date">2017.08.31</span>
                        <span class="item-desc-inner-cate-down">R</span>
                    </div>
                </div>
                <div class="item-author">
                    <span class="item-author-name">Mark Lee</span>
                    <span class="item-author-img"><img src="../../assets/img/page/layer-710.png" alt=""></span>
                </div>
            </div>
        </div>

        <div class="info-list-item clearfix">
            <div class="info-list-item-inner clearfix">
                <div class="item-number">
                    <span class="rank-image"></span>
                    <span>234</span>
                </div>
                <div class="item-desc">
                    <div class="item-title">
                        <a href="/page/info_detail"><h4>코드 중심의 파이썬 클러스터링 예제</h4></a>
                        <span class="item-desc-inner-cate-up">Python</span>
                    </div>
                    <div class="item-tags">
                        <span>PYTHON</span>
                        <span>파이썬</span>
                        <span>클러스터링</span>
                        <span>비지도 학습</span>
                        <span>군집화</span>
                    </div>
                    <div class="item-info">
                        <span><img src="../../assets/img/page/view-icon.png" alt=""></span>
                        <span class="item-view">90 View</span> <span class="item-bullet">&bullet;</span> <span class="item-date">2017.08.26</span>
                        <span class="item-desc-inner-cate-down">Python</span>
                    </div>
                </div>
                <div class="item-author">
                    <span class="item-author-name">RealMn</span>
                    <span class="item-author-img"><img src="../../assets/img/page/shape-634-copy.png" alt=""></span>
                </div>
            </div>
        </div>

        <div class="info-list-item clearfix">
            <div class="info-list-item-inner clearfix">
                <div class="item-number">
                    <span class="rank-image"></span>
                    <span>8</span>
                </div>
                <div class="item-desc">
                    <div class="item-title">
                        <a href="/page/info_detail"><h4>범죄 예방을 위한 ‘범죄 예측 프로그램 제작’</h4></a>
                        <span class="item-desc-inner-cate-up">R</span>
                    </div>
                    <div class="item-tags">
                        <span>R</span>
                        <span>예측</span>
                        <span>위험도 도출</span>
                        <span>범죄</span>
                    </div>
                    <div class="item-info">
                        <span><img src="../../assets/img/page/view-icon.png" alt=""></span>
                        <span class="item-view">88 View</span> <span class="item-bullet">&bullet;</span> <span class="item-date">2017.08.28</span>
                        <span class="item-desc-inner-cate-down">R</span>
                    </div>
                </div>
                <div class="item-author">
                    <span class="item-author-name">GruData</span>
                    <span class="item-author-img"><img src="../../assets/img/page/user-copy-2.png" alt=""></span>
                </div>
            </div>
        </div>

        <div class="info-list-item clearfix">
            <div class="info-list-item-inner clearfix">
                <div class="item-number">
                    <span class="rank-image"></span>
                    <span>8</span>
                </div>
                <div class="item-desc">
                    <div class="item-title">
                        <a href="/page/info_detail"><h4>R - 텍스트 분석</h4></a>
                        <span class="item-desc-inner-cate-up">R</span>
                    </div>
                    <div class="item-tags">
                        <span>R</span>
                        <span>텍스트 분석</span>
                        <span>예측 분석 모델링</span>
                        <span>데이터 파싱</span>
                        <span>군집 분석</span>
                    </div>
                    <div class="item-info">
                        <span><img src="../../assets/img/page/view-icon.png" alt=""></span>
                        <span class="item-view">123 View</span> <span class="item-bullet">&bullet;</span> <span class="item-date">2017.06.15</span>
                        <span class="item-desc-inner-cate-down">R</span>
                    </div>
                </div>
                <div class="item-author">
                    <span class="item-author-name">NewMn</span>
                    <span class="item-author-img"><img src="../../assets/img/page/shape-634-copy.png" alt=""></span>
                </div>
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
</body>
</html>