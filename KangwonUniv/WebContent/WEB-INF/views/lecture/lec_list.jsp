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

            <div class="snz-subnav-search">
                <form class="navbar-form navbar-right" role="search">
                    <span>강의년도</span>
                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                            <span class="selected-item">2017</span>
                            <span class="caret lec-caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="dropdownMenu1List">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2017</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2016</a></li>
                        </ul>
                    </div>
                    <span>학기</span>
                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-expanded="false">
                            <span class="selected-item">1학기</span>
                            <span class="caret lec-caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2" id="dropdownMenu2List">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">1학기</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">2학기</a></li>
                        </ul>
                    </div>

                    <a href="#"><img src="../../assets/img/page/shape-2.png" alt=""></a> <!-- submit 제거 -->
                </form>
            </div>

        </div>
    </div>
</div><div class="container-fluid snz-page-content-container">

    <div class="row snz-page-content snz-page-lec-section snz-page-lec-list-section">
        <div class="snz-add-btn">
            <a href="#"><img src="../../assets/img/page/shape-1223-copy.png" alt=""></a>
        </div>
        <table class="table ques-8-table lec-table">
            <thead>
            <tr class="only-desktop-display">
                <th>강의년도</th>
                <th>학년</th>
                <th>학기</th>
                <th>교과과정</th>
                <th>강의명</th>
                <th>강의계획서</th>
                <th>수강인원</th>
                <th>수강여부</th>
            </tr>
            </thead>
            <tbody>

            <tr>
                <td class="only-desktop-display"><span class="">2016</span></td>
                <td class="only-desktop-display"><span class="">2학년</span></td>
                <td class="only-desktop-display"><span class="">1학기</span></td>
                <td class="only-desktop-display"><span class="">데이터 분석 전공</span></td>
                <td class="body-lecture-title">
                    <span class="only-desktop-display">컴퓨터 개론 및 실습</span>
                    <div class="lec-mobile-layout">
                        <div class="lec-mobile-layout-top">
                            <span class="">컴퓨터 개론 및 실습</span>
                            <span class="body-attend lec-mobile-attend-o">수강중</span>
                        </div>
                        <div class="lec-mobile-layout-bottom">
                            <span class="">2017</span>
                            <span class="">2학년</span>
                            <span class="">1학기</span>
                            <span class="">ㆍ</span>
                            <span class="">데이터 분석 전공</span>
                            <span class="lec-mobile-number">
                            <span>15명</span>
                        </span>
                        </div>
                    </div>
                </td>
                <td class="only-desktop-display"><span><a href="#"><img src="../../assets/img/page/shape-718.png" alt=""></a></span></td>
                <td class="body-lecture-number only-desktop-display"><span>15명</span></td>
                <td><span class="body-attend only-desktop-display">수강중</span></td>
            </tr>

            <tr>
                <td class="only-desktop-display"><span class="">2017</span></td>
                <td class="only-desktop-display"><span class="">1학년</span></td>
                <td class="only-desktop-display"><span class="">1학기</span></td>
                <td class="only-desktop-display"><span class="">데이터 분석 전공</span></td>
                <td class="body-lecture-title">
                    <span class="only-desktop-display">확률 및 통계</span>
                    <div class="lec-mobile-layout">
                        <div class="lec-mobile-layout-top">
                            <span class="">확률 및 통계</span>
                            <span class="body-attend lec-mobile-attend-x">미수강</span>
                        </div>
                        <div class="lec-mobile-layout-bottom">
                            <span class="">2017</span>
                            <span class="">1학년</span>
                            <span class="">1학기</span>
                            <span class="">ㆍ</span>
                            <span class="">데이터 분석 전공</span>
                            <span class="lec-mobile-number">
                                <span>30명</span>
                            </span>
                        </div>
                    </div>
                </td>
                <td class="only-desktop-display"><span><a href="#"><img src="../../assets/img/page/shape-718.png" alt=""></a></span></td>
                <td class="body-lecture-number only-desktop-display"><span>30명</span></td>
                <td><span class="only-desktop-display">미수강</span></td>
            </tr>

            <tr>
                <td class="only-desktop-display"><span class="">2015</span></td>
                <td class="only-desktop-display"><span class="">1학년</span></td>
                <td class="only-desktop-display"><span class="">1학기</span></td>
                <td class="only-desktop-display"><span class="">데이터 분석 전공</span></td>
                <td class="body-lecture-title">
                    <span class="only-desktop-display">경영학원로</span>
                    <div class="lec-mobile-layout">
                        <div class="lec-mobile-layout-top">
                            <span class="">경영학원로</span>
                            <span class="body-attend lec-mobile-attend-x">미수강</span>
                        </div>
                        <div class="lec-mobile-layout-bottom">
                            <span class="">2015</span>
                            <span class="">1학년</span>
                            <span class="">1학기</span>
                            <span class="">ㆍ</span>
                            <span class="">데이터 분석 전공</span>
                            <span class="lec-mobile-number">
                                <span>25명</span>
                            </span>
                        </div>
                    </div>
                </td>
                <td class="only-desktop-display"><span><img src="../../assets/img/page/shape-718.png" alt=""></span></td>
                <td class="body-lecture-number only-desktop-display"><span>25명</span></td>
                <td><span class="only-desktop-display">미수강</span></td>
            </tr>

            <tr>
                <td class="only-desktop-display"><span class="">2017</span></td>
                <td class="only-desktop-display"><span class="">3학년</span></td>
                <td class="only-desktop-display"><span class="">1학기</span></td>
                <td class="only-desktop-display"><span class="">데이터 분석 전공</span></td>
                <td class="body-lecture-title">
                    <span class="only-desktop-display">자료 구조</span>
                    <div class="lec-mobile-layout">
                        <div class="lec-mobile-layout-top">
                            <span class="">자료 구조</span>
                            <span class="body-attend lec-mobile-attend-x">미수강</span>
                        </div>
                        <div class="lec-mobile-layout-bottom">
                            <span class="">2017</span>
                            <span class="">3학년</span>
                            <span class="">1학기</span>
                            <span class="">ㆍ</span>
                            <span class="">데이터 분석 전공</span>
                            <span class="lec-mobile-number">
                                <span>15명</span>
                            </span>
                        </div>
                    </div>
                </td>
                <td class="only-desktop-display"><span><img src="../../assets/img/page/shape-718.png" alt=""></span></td>
                <td class="body-lecture-number only-desktop-display"><span>15명</span></td>
                <td><span class="only-desktop-display">미수강</span></td>
            </tr>

            <tr>
                <td class="only-desktop-display"><span class="">2016</span></td>
                <td class="only-desktop-display"><span class="">2학년</span></td>
                <td class="only-desktop-display"><span class="">1학기</span></td>
                <td class="only-desktop-display"><span class="">데이터 분석 전공</span></td>
                <td class="body-lecture-title">
                    <span class="only-desktop-display">컴퓨터 개론 및 실습</span>
                    <div class="lec-mobile-layout">
                        <div class="lec-mobile-layout-top">
                            <span class="">컴퓨터 개론 및 실습</span>
                            <span class="body-attend">수강중</span>
                        </div>
                        <div class="lec-mobile-layout-bottom">
                            <span class="">2016</span>
                            <span class="">2학년</span>
                            <span class="">1학기</span>
                            <span class="">ㆍ</span>
                            <span class="">데이터 분석 전공</span>
                            <span class="lec-mobile-number">
                                <span>15명</span>
                            </span>
                        </div>
                    </div>
                </td>
                <td class="only-desktop-display"><span><img src="../../assets/img/page/shape-718.png" alt=""></span></td>
                <td class="body-lecture-number only-desktop-display"><span>15명</span></td>
                <td><span class="body-attend only-desktop-display">수강중</span></td>
            </tr>

            <tr>
                <td class="only-desktop-display"><span class="">2016</span></td>
                <td class="only-desktop-display"><span class="">2학년</span></td>
                <td class="only-desktop-display"><span class="">1학기</span></td>
                <td class="only-desktop-display"><span class="">데이터 분석 전공</span></td>
                <td class="body-lecture-title">
                    <span class="only-desktop-display">컴퓨터 개론 및 실습</span>
                    <div class="lec-mobile-layout">
                        <div class="lec-mobile-layout-top">
                            <span class="">컴퓨터 개론 및 실습</span>
                            <span class="body-attend">수강중</span>
                        </div>
                        <div class="lec-mobile-layout-bottom">
                            <span class="">2016</span>
                            <span class="">2학년</span>
                            <span class="">1학기</span>
                            <span class="">ㆍ</span>
                            <span class="">데이터 분석 전공</span>
                            <span class="lec-mobile-number">
                                <span>30명</span>
                            </span>
                        </div>
                    </div>
                </td>
                <td class="only-desktop-display"><span><img src="../../assets/img/page/shape-718.png" alt=""></span></td>
                <td class="body-lecture-number only-desktop-display"><span>30명</span></td>
                <td><span class="body-attend only-desktop-display">수강중</span></td>
            </tr>

            <tr>
                <td class="only-desktop-display"><span class="">2016</span></td>
                <td class="only-desktop-display"><span class="">2학년</span></td>
                <td class="only-desktop-display"><span class="">1학기</span></td>
                <td class="only-desktop-display"><span class="">데이터 분석 전공</span></td>
                <td class="body-lecture-title">
                    <span class="only-desktop-display">컴퓨터 개론 및 실습</span>
                    <div class="lec-mobile-layout">
                        <div class="lec-mobile-layout-top">
                            <span class="">컴퓨터 개론 및 실습</span>
                            <span class="body-attend">수강중</span>
                        </div>
                        <div class="lec-mobile-layout-bottom">
                            <span class="">2016</span>
                            <span class="">2학년</span>
                            <span class="">1학기</span>
                            <span class="">ㆍ</span>
                            <span class="">데이터 분석 전공</span>
                            <span class="lec-mobile-number">
                                <span>25명</span>
                            </span>
                        </div>
                    </div>
                </td>
                <td class="only-desktop-display"><span><img src="../../assets/img/page/shape-718.png" alt=""></span></td>
                <td class="body-lecture-number only-desktop-display"><span>25명</span></td>
                <td><span class="body-attend only-desktop-display">수강중</span></td>
            </tr>

            <tr>
                <td class="only-desktop-display"><span class="">2017</span></td>
                <td class="only-desktop-display"><span class="">3학년</span></td>
                <td class="only-desktop-display"><span class="">1학기</span></td>
                <td class="only-desktop-display"><span class="">데이터 분석 전공</span></td>
                <td class="body-lecture-title">
                    <span class="only-desktop-display">컴퓨터 개론 및 실습</span>
                    <div class="lec-mobile-layout">
                        <div class="lec-mobile-layout-top">
                            <span class="">컴퓨터 개론 및 실습</span>
                            <span class="body-attend lec-mobile-attend-x">미수강</span>
                        </div>
                        <div class="lec-mobile-layout-bottom">
                            <span class="">2017</span>
                            <span class="">3학년</span>
                            <span class="">1학기</span>
                            <span class="">ㆍ</span>
                            <span class="">데이터 분석 전공</span>
                            <span class="lec-mobile-number">
                                <span>30명</span>
                            </span>
                        </div>
                    </div>
                </td>
                <td class="only-desktop-display"><span><img src="../../assets/img/page/shape-718.png" alt=""></span></td>
                <td class="body-lecture-number only-desktop-display"><span>30명</span></td>
                <td><span class="only-desktop-display">미수강</span></td>
            </tr>

            <tr>
                <td class="only-desktop-display"><span class="">2015</span></td>
                <td class="only-desktop-display"><span class="">1학년</span></td>
                <td class="only-desktop-display"><span class="">1학기</span></td>
                <td class="only-desktop-display"><span class="">데이터 분석 전공</span></td>
                <td class="body-lecture-title">
                    <span class="only-desktop-display">컴퓨터 개론 및 실습</span>
                    <div class="lec-mobile-layout">
                        <div class="lec-mobile-layout-top">
                            <span class="">컴퓨터 개론 및 실습</span>
                            <span class="body-attend">수강중</span>
                        </div>
                        <div class="lec-mobile-layout-bottom">
                            <span class="">2015</span>
                            <span class="">1학년</span>
                            <span class="">1학기</span>
                            <span class="">ㆍ</span>
                            <span class="">데이터 분석 전공</span>
                            <span class="lec-mobile-number">
                                <span>30명</span>
                            </span>
                        </div>
                    </div>
                </td>
                <td class="only-desktop-display"><span><img src="../../assets/img/page/shape-718.png" alt=""></span></td>
                <td class="body-lecture-number only-desktop-display"><span>30명</span></td>
                <td><span class="body-attend only-desktop-display">수강중</span></td>
            </tr>

            <tr>
                <td class="only-desktop-display"><span class="">2016</span></td>
                <td class="only-desktop-display"><span class="">2학년</span></td>
                <td class="only-desktop-display"><span class="">1학기</span></td>
                <td class="only-desktop-display"><span class="">데이터 분석 전공</span></td>
                <td class="body-lecture-title">
                    <span class="only-desktop-display">컴퓨터 개론 및 실습</span>
                    <div class="lec-mobile-layout">
                        <div class="lec-mobile-layout-top">
                            <span class="">컴퓨터 개론 및 실습</span>
                            <span class="body-attend">수강중</span>
                        </div>
                        <div class="lec-mobile-layout-bottom">
                            <span class="">2016</span>
                            <span class="">2학년</span>
                            <span class="">1학기</span>
                            <span class="">ㆍ</span>
                            <span class="">데이터 분석 전공</span>
                            <span class="lec-mobile-number">
                                <span>15명</span>
                            </span>
                        </div>
                    </div>
                </td>
                <td class="only-desktop-display"><span><img src="../../assets/img/page/shape-718.png" alt=""></span></td>
                <td class="body-lecture-number only-desktop-display"><span>15명</span></td>
                <td><span class="body-attend only-desktop-display">수강중</span></td>
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