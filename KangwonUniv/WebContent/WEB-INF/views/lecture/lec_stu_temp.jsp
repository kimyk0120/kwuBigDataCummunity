<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
           
<c:set value="선택" var="initGroup"></c:set>
<c:forEach items="${studentList}" var="sl" varStatus="stat" >
<tr>
    <td class="body-no"><span class="ques-8-table-no">${stat.index+1}</span></td>
    <td class="body-name"><span class="ques-8-table-img"><img src="../../assets/img/page/layer-710.png" alt=""></span><span class="ques-8-table-name">${sl.id}</span></td>
    <td class="body-count body-rname"><span class="ques-8-table-count">${sl.name}</span></td>
    <td class="body-org">
         <div class="dropdown" style="text-align: center;">  
            <button class="btn btn-default dropdown-toggle dropdownMenu2" type="button"  data-toggle="dropdown" aria-expanded="false">
                <span class="selected-item">
                	<c:forEach items="${grouplist}" var="gl">
                			<c:if test="${gl.group_no eq sl.group_no}">
                				<c:set value="${gl.group_no}조" var="initGroup"></c:set>
                			</c:if>
                	</c:forEach>	
                	${initGroup}
                </span>
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
            	<c:forEach items="${grouplist}" var="gl">
                 <li role="presentation" class="groupArrBtn" >
                 	<input type="hidden" name="stuId" value="${sl.id}">
                 	<a role="menuitem" tabindex="-1" data-gourpno="${gl.group_no}" data-value-declared>${gl.group_no}조</a>
                	</li>
            	</c:forEach>
            </ul>
        </div>
    </td>
</tr>
</c:forEach>
           