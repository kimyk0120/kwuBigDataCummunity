<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:forEach var="c" items="${list}" varStatus="g">
	 <div class="info-list-item clearfix">
	     <div class="info-list-item-inner clearfix">
	         <div class="item-number">
	             <img src="common/img/page/default.png" alt=""/>
	             <span>${c.like_cnt }</span>
	         </div>
	         <div class="item-desc">
	             <div class="item-title">
	                 <a href="javascript:info_detail('${c.board_no}')"><h4>${c.title }</h4></a>
	                 <span class="item-desc-inner-cate-up">${c.subject_nm }</span>
	             </div>
	             <div class="item-tags">
	                 <c:set var="tg" value="${fn:split(c.tag,',')}" />
						<c:forEach var="t" items="${tg}" varStatus="g">
							<span>${t}</span>
						</c:forEach> 
	             </div>
	             <div class="item-info">
	                 <span><img src="common/img/page/view-icon.png" alt=""/></span>
	                 <span class="item-view">${c.cnt} View</span> <span class="item-bullet">&bullet;</span> <span class="item-date">${c.reg_dt }</span>
	                 <span class="item-desc-inner-cate-down">${c.subject_nm }</span>
	             </div>
	         </div>
	         <div class="item-author">
	             <span class="item-author-name">${c.reg_id }</span>
	             <span class="item-author-img"><img src="common/img/page/layer-710.png" alt=""/></span>
	         </div>
	     </div>
	 </div>
</c:forEach>