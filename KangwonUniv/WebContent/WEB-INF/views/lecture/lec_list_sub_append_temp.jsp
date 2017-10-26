<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:forEach items="${boardList}" var="bl" begin="0" varStatus="stat">
	        <div class="listUnit info-list-item clearfix" data-lecBoardNo="${bl.lec_board_no}" data-value-declared>
	            <div class="info-list-item-inner clearfix">
	                <div class="item-number">
	                    <span class="rank-image ${bl.likeYn eq 'Y' ? 'active' : ''}"></span>
	                    <span>${bl.like_cnt}</span>
	                </div>
	                <div class="item-desc">
	                    <div class="item-title">
	                        <a class="boardDetailBtn"><span>${bl.title}</span></a>
	                        <span class="item-desc-inner-cate-up">
	                        <c:choose>
								<c:when test="${bl.lec_board_prt eq 'A' }">과제</c:when>	                        
	                        	<c:when test="${bl.lec_board_prt eq 'B' }">수업</c:when>
	                        	<c:when test="${bl.lec_board_prt eq 'C' }">기타</c:when>
	                        	<c:otherwise>${bl.lec_board_prt}조</c:otherwise>
	                        </c:choose>
                        	</span>
	                    </div>
	                    <div class="item-tags">
	                    	<c:set var="tg" value="${fn:split(bl.tag,',')}" />
	                    	<c:forEach var="t" items="${tg}">
								<span>${t}</span>
							</c:forEach>
	                    </div>
	                    <div class="item-info">
	                        <span><img src="../../assets/img/page/view-icon.png" alt=""></span>
	                        <span class="item-view">${bl.cnt} View</span> <span class="item-bullet">&#8226;</span> <span class="item-date">${bl.reg_dt}</span>
	                    </div>
	                </div>
	                <div class="item-author">
	                    <span class="item-author-name">${bl.reg_id}</span>
	                    <span class="item-author-img"><img src="../../assets/img/page/layer-710.png" alt=""></span>
	                </div>
	            </div>
	        </div>
      </c:forEach>
