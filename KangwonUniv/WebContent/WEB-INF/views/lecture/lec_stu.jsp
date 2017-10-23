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
                <a href="#"><img src="../../assets/img/main/shape-2.png" alt=""></a>
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
            <h1>강의 > 확률 및 통계 > 수강생</h1>
        </div>
        <div class="row snz-page-nav lec-page-nav">
            <div class="snz-nav-item-outer">
                <div class="snz-nav-item-inner">
                    <span class="snz-nav-item current"><a href="#">전체</a></span>
                    <span class="snz-nav-item"><a href="#">과제</a></span>
                    <span class="snz-nav-item"><a href="#">수업</a></span>
                    <span class="snz-nav-item"><a href="#">기타</a></span>
                </div>
            </div>
            <div class="snz-subnav-search snz-lec-subnav-search">
                <span class="snz-nav-item lec-nav-dropdown">
                    <div class="dropdown lec-select-dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                            <span class="selected-item">조선택</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">3조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">4조</a></li>
                        </ul>
                    </div>
                </span>
            </div>
        </div>
    </div>
</div><div class="container-fluid snz-page-content-container">

    <div class="row snz-page-content snz-page-ques-8-section snz-page-stu-list-section">
        <div class="snz-add-btn">
            <a href="#"><img src="../../assets/img/page/shape-1224-copy.png" alt=""></a>
        </div>
        <div class="stu-top-btns">
            <a href="#"><img src="../../assets/img/page/org-add.png" alt=""></a>
            <a href="#"><img src="../../assets/img/page/org-del.png" alt=""></a>
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
            <tbody>
            <tr>
                <td class="body-no"><span class="ques-8-table-no">1</span></td>
                <td class="body-name"><span class="ques-8-table-img"><img src="../../assets/img/page/layer-710.png" alt=""></span><span class="ques-8-table-name">RealMan</span></td>
                <td class="body-count body-rname"><span class="ques-8-table-count">전혜영</span></td>
                <td class="body-org">
                    <span class="ques-8-table-regdate">
                        <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                            <span class="selected-item">선택</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">3조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">4조</a></li>
                        </ul>
                    </div>
                    </span>
                </td>
            </tr>

            <tr>
                <td class="body-no"><span class="ques-8-table-no">2</span></td>
                <td class="body-name"><span class="ques-8-table-img"><img src="../../assets/img/page/shape-634-copy.png" alt=""></span><span class="ques-8-table-name">GruData</span></td>
                <td class="body-count body-rname"><span class="ques-8-table-count">김승희</span></td>
                <td class="body-org">
                    <span class="ques-8-table-regdate">
                        <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                            <span class="selected-item">선택</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">3조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">4조</a></li>
                        </ul>
                    </div>
                    </span>
                </td>
            </tr>

            <tr>
                <td class="body-no"><span class="ques-8-table-no">3</span></td>
                <td class="body-name"><span class="ques-8-table-img"><img src="../../assets/img/page/shape-634-copy.png" alt=""></span><span class="ques-8-table-name">Unknowing</span></td>
                <td class="body-count body-rname"><span class="ques-8-table-count">장윤정</span></td>
                <td class="body-org">
                    <span class="ques-8-table-regdate">
                        <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                            <span class="selected-item">선택</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">3조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">4조</a></li>
                        </ul>
                    </div>
                    </span>
                </td>
            </tr>

            <tr>
                <td class="body-no"><span class="ques-8-table-no">4</span></td>
                <td class="body-name"><span class="ques-8-table-img"><img src="../../assets/img/page/user-copy.png" alt=""></span><span class="ques-8-table-name">NewMn</span></td>
                <td class="body-count body-rname"><span class="ques-8-table-count">박혜민</span></td>
                <td class="body-org">
                    <span class="ques-8-table-regdate">
                        <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                            <span class="selected-item">선택</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">3조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">4조</a></li>
                        </ul>
                    </div>
                    </span>
                </td>
            </tr>

            <tr>
                <td class="body-no"><span class="ques-8-table-no">5</span></td>
                <td class="body-name"><span class="ques-8-table-img"><img src="../../assets/img/page/layer-2374.png" alt=""></span><span class="ques-8-table-name">RealMan</span></td>
                <td class="body-count body-rname"><span class="ques-8-table-count">홍길동</span></td>
                <td class="body-org">
                    <span class="ques-8-table-regdate">
                        <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                            <span class="selected-item">선택</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">3조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">4조</a></li>
                        </ul>
                    </div>
                    </span>
                </td>
            </tr>

            <tr>
                <td class="body-no"><span class="ques-8-table-no">6</span></td>
                <td class="body-name"><span class="ques-8-table-img"><img src="../../assets/img/page/user-copy-3.png" alt=""></span><span class="ques-8-table-name">Gobig</span></td>
                <td class="body-count body-rname"><span class="ques-8-table-count">김현빈</span></td>
                <td class="body-org">
                    <span class="ques-8-table-regdate">
                        <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                            <span class="selected-item">선택</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">3조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">4조</a></li>
                        </ul>
                    </div>
                    </span>
                </td>
            </tr>

            <tr>
                <td class="body-no"><span class="ques-8-table-no">7</span></td>
                <td class="body-name"><span class="ques-8-table-img"><img src="../../assets/img/page/shape-634-copy.png" alt=""></span><span class="ques-8-table-name">PrinceDT</span></td>
                <td class="body-count body-rname"><span class="ques-8-table-count">윤지성</span></td>
                <td class="body-org">
                    <span class="ques-8-table-regdate">
                        <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                            <span class="selected-item">선택</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">3조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">4조</a></li>
                        </ul>
                    </div>
                    </span>
                </td>
            </tr>

            <tr>
                <td class="body-no"><span class="ques-8-table-no">8</span></td>
                <td class="body-name"><span class="ques-8-table-img"><img src="../../assets/img/page/shape-634-copy.png" alt=""></span><span class="ques-8-table-name">RealMan</span></td>
                <td class="body-count body-rname"><span class="ques-8-table-count">이마크</span></td>
                <td class="body-org">
                    <span class="ques-8-table-regdate">
                        <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                            <span class="selected-item">선택</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">3조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">4조</a></li>
                        </ul>
                    </div>
                    </span>
                </td>
            </tr>

            <tr>
                <td class="body-no"><span class="ques-8-table-no">9</span></td>
                <td class="body-name"><span class="ques-8-table-img"><img src="../../assets/img/page/shape-634-copy.png" alt=""></span><span class="ques-8-table-name">data_factory</span></td>
                <td class="body-count body-rname"><span class="ques-8-table-count">김길동</span></td>
                <td class="body-org">
                    <span class="ques-8-table-regdate">
                        <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                            <span class="selected-item">선택</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">3조</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">4조</a></li>
                        </ul>
                    </div>
                    </span>
                </td>
            </tr>

            </tbody>
        </table>

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