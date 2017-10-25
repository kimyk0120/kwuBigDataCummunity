<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 강의 리스트 -->
<c:forEach items="${list}" var="ll" varStatus="status">			
<tr data-lecNo="${ll.lec_no}" data-value-declared class="lecUnit">
    <td class="only-desktop-display"><span class="">${ll.year}</span></td>
    <td class="only-desktop-display"><span class="">${ll.grade}학년</span></td>
    <td class="only-desktop-display"><span class="">${ll.term}학기</span></td>
    <td class="only-desktop-display"><span class="">${ll.lec_title}</span></td>
    <td class="body-lecture-title"><span class="only-desktop-display">${ll.lec_cors}</span></td>                    
    <td class="only-desktop-display">
    	<span>
    		<a>
    			<img src="../../assets/img/page/shape-718.png" alt="" class="lecPlanBtn">
    		</a>
    	</span>
   	</td>
    <td class="body-lecture-number only-desktop-display"><span>${ll.stdtcnt}명</span></td>
    <td>                
    	<span class="only-desktop-display ${ll.attndYn == '수강중' ? 'body-attend' : ''}" >${ll.attndYn}</span>
    </td>
</tr>
</c:forEach>