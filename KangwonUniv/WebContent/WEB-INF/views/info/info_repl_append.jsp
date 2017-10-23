<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="cmt-section-title">
	<h4>${fn:length(list)} Comments</h4>
</div>
<div class="cmt-section-textarea clearfix">
    <div class="cmt-section-textarea-left">
        <span class="item-author-img"><img src="common/img/page/shape-634-copy.png" alt=""/></span>
    </div>
    <div class="cmt-section-textarea-right">
    	<textarea name="repl_cntn" id="repl_cntn" cols="30" rows="5"></textarea>
        <input type="text" class="snz-submit btn btn-primary" value="등록" onclick="javascript:reply_save()"/>
    </div>
    <div class="cmt-section-added-section">
		<c:forEach items="${list}" var="r" varStatus="g">
			<span class="cmt-added-item clearfix">
    			<div class="cmt-added-item-left">
        			<span class="item-author-img"><img src="common/img/page/layer-710.png" alt=""/></span>
    			</div>
    			<div class="cmt-added-item-right">
        			<span class="item-author-name">${r.repl_reg_id }</span>
					<span class="item-author-date">${r.repl_reg_dt }</span>
					<div class="item-author-comment">${r.repl_cntn }</div>
    			</div>
			</span>
		</c:forEach>
    </div>
</div>