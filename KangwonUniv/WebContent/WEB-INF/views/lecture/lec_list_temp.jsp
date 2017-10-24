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

<jsp:include page="../main/top_menu.jsp"  />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 

<div class="container-fluid snz-page-container">
    <div class="container snz-page-container-inner">
        <div class="row snz-page-title">
            <h1>강의</h1>
        </div>
        <div class="row snz-page-nav lec-page-nav">
            <span class="snz-nav-item current"><a>전체</a></span>
            <span class="snz-nav-item"><a>내강의</a></span>

            <div class="snz-subnav-search">
                <form class="navbar-form navbar-right" role="search">
                    <span>강의년도</span>
                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
                            <span class="selected-item">${sysYear}</span>
                            <span class="caret lec-caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="dropdownMenu1List">                        	
                        	<c:forEach var="i" begin="0" end="4" varStatus="stat" step="1">                        	
                            	<li role="presentation" class="lecYear"><a role="menuitem" tabindex="-1" >${sysYear-i}</a></li>
                        	</c:forEach>                            
                        </ul>
                    </div>
                    <span>학기</span>
                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-expanded="false">
                            <span class="selected-item">1학기</span>                            
                            <span class="caret lec-caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2" id="dropdownMenu2List">
                            <li role="presentation" class="lecSemester"><a role="menuitem" tabindex="-1" >1학기</a></li>
                            <li role="presentation" class="lecSemester"><a role="menuitem" tabindex="-1" >2학기</a></li>
                        </ul>
                    </div>

                    <a id="lecListSrch"><img src="../../assets/img/page/shape-2.png" alt=""></a> <!-- submit 제거 -->
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
			
			<!-- 강의 리스트 -->
			<c:forEach items="${list}" var="ll" varStatus="status">			
			<tr>				
                <td class="only-desktop-display"><span class="">${ll.year}</span></td>
                <td class="only-desktop-display"><span class="">${ll.grade}학년</span></td>
                <td class="only-desktop-display"><span class="">${ll.term}학기</span></td>
                <td class="only-desktop-display"><span class="">${ll.lec_title}</span></td>
                <td class="body-lecture-title"><span class="only-desktop-display">${ll.lec_cors}</span></td>                    
                <td class="only-desktop-display"><span><a href="#"><img src="../../assets/img/page/shape-718.png" alt=""></a></span></td>
                <td class="body-lecture-number only-desktop-display"><span>${ll.stdtcnt}명</span></td>
                <td>
                
                	<c:choose>
                		<c:when test="${ll.attndYn eq null or ll.attndYn eq ''}">
                			<span class="only-desktop-display">미수강</span>
                		</c:when>
                		<c:otherwise>
                			<span class="body-attend only-desktop-display">수강중</span>
                		</c:otherwise>
                	</c:choose>
                </td>
            </tr>
			</c:forEach>
			
			
			
			<!-- ex tr -->
           <!--  <tr>
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
            </tr> -->
            <!-- .ex tr -->

            </tbody>
        </table>
        
        <!-- 더보기 버튼 영역 -->
		<div class="ques-8-table-more" style="margin:0">
		            <div class="more-trigger"><a>더보기</a></div>
		            <!-- <div class="rest-count"><span>15 / 137</span></div> -->
        </div>		
    </div>
</div>
<!-- </div> -->

<div class="snz-modal-layer"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="../../assets/lib/bootstrap-3.3.2/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/f0cba26d23.js"></script>
<script src="../../assets/js/script.js"></script>
<script type="text/javascript">
	
	// 전체 강의, 내강의 선택 css
	$(".snz-nav-item").on("click",function(){					
		if(!$(this).hasClass("current")){
			$(".snz-nav-item").removeClass("current");
			$(this).addClass("current");
		}
	})
	
	// 검색 년도 선택시 변경 css
	$(".lecYear").on("click",function(){
		var selectYear = $(this).children("a").text();
		//console.log("selectYear : " + selectYear);
		$("#dropdownMenu1 span.selected-item").html(selectYear);
	})
	
	// 학기 선택시 변경 css
	$(".lecSemester").on("click",function(){
		var selectSemester = $(this).children("a").text();
		//console.log("selectSemester : " + selectSemester);
		$("#dropdownMenu2 span.selected-item").html(selectSemester);
	})
	
	// 검색 버튼 선택 
	$("#lecListSrch").on("click",function(){
		var selectYear = $("#dropdownMenu1 span.selected-item").text();
		var selectSemester = $("#dropdownMenu2 span.selected-item").text();
		
		if(selectSemester == "1학기"){ selectSemester = "1"; }else{ selectSemester = "2"; }
		
		console.log("selectYear : " + selectYear);
		console.log("selectSemester : " + selectSemester);
	})
	
	// 더보기 버튼 선택시
	$(".ques-8-table-more").on("click",function(){
		testMsg("더보기 버튼 선택");
				
	})
	
		
	function testMsg(msg){
		console.log("msg : " + msg);
	}
	
</script>
</body>
</html>