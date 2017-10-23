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
            <h1>강의</h1>
        </div>
        <div class="row snz-page-nav lec-page-nav">
            <span class="snz-nav-item current"><a href="#">전체</a></span>
            <span class="snz-nav-item"><a href="#">내강의</a></span>
        </div>
    </div>
</div><div class="container-fluid snz-page-content-container">
    <div class="row snz-page-content snz-page-write">

        <div class="snz-write-section lec-write-section">

            <div class="write-title">
                <h1>강의 등록</h1>
            </div>

            <div class="write-select-info">
                <form action="">
                    <div class="enter-category">
                        <label for="">강의년도</label>
                        <div class="dropdown">
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                                <span class="selected-item">2017</span>
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2017</a></li>
                            </ul>
                        </div>

                        <label for="">학년</label>
                        <div class="dropdown">
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-expanded="false">
                                <span class="selected-item">학년</span>
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1학년</a></li>
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2학년</a></li>
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">3학년</a></li>
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">4학년</a></li>
                            </ul>
                        </div>

                        <label for="">학기</label>
                        <div class="dropdown">
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu3" data-toggle="dropdown" aria-expanded="false">
                                <span class="selected-item">학기</span>
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu3">
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1학기</a></li>
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2학기</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="enter-title">
                        <label for="">강의명</label>
                        <input type="text" placeholder="강의명을 입력하세요.">
                    </div>
                    <div class="enter-title">
                        <label for="">교과과정</label>
                        <input type="text" placeholder="교과과정을 입력하세요.">
                    </div>
            </div>
            <div class="write-form">
                <div class="enter-title enter-schedule">
                    <label for="">강의계획서</label>
                </div>
                <div class="enter-action">
                    <div class="enter-action-div">
                        <span><img src="../../assets/img/page/editor/shape-775.png" alt=""></span>
                        <span><img src="../../assets/img/page/editor/shape-776.png" alt=""></span>
                    </div>
                    <div class="enter-action-div">
                        <span><img src="../../assets/img/page/editor/shape-778.png" alt=""></span>
                        <span><img src="../../assets/img/page/editor/shape-779.png" alt=""></span>
                        <span><img src="../../assets/img/page/editor/shape-780.png" alt=""></span>
                        <span><img src="../../assets/img/page/editor/shape-781.png" alt=""></span>
                        <span><img src="../../assets/img/page/editor/shape-782.png" alt=""></span>
                    </div>
                    <div class="enter-action-div">
                        <span><img src="../../assets/img/page/editor/shape-783.png" alt=""></span>
                        <span><img src="../../assets/img/page/editor/shape-784.png" alt=""></span>
                        <span><img src="../../assets/img/page/editor/vector-smart-object.png" alt=""></span>
                        <span><img src="../../assets/img/page/editor/vector-smart-object%20(1).png" alt=""></span>
                    </div>
                    <div class="enter-action-div">
                        <span><img src="../../assets/img/page/editor/shape-785.png" alt=""></span>
                        <span><img src="../../assets/img/page/editor/shape-786.png" alt=""></span>
                    </div>
                </div>
                <div class="enter-content">
                    <textarea name="" id="" cols="30" rows="10" placeholder="내용을 입력해주세요."></textarea>
                </div>

                <div class="enter-btns">
                    <input type="button" class="btn btn-primary" value="등록">
                    <input type="button" class="btn btn-default" value="취소">
                </div>
            </div>
            </form>

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