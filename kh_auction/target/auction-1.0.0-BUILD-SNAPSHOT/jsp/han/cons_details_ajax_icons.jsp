<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 
<div class="post-bottom overflow">
이거 바로 다음임
 -->
<table style="width:100%;">
	<tr>
		<th>감정 신청</th>
		<th>감정 결과</th>
		<th>위탁 신청</th>
	</tr>
	<c:choose>
	   	<c:when test="${cons.cons_result1 eq 'yet'}">
	    	<tr>
	    		<td><a href="#"><i class="fa fa-circle-o-notch fa-spin" style="color:#ff9800"></i> 검토중</a></td>
	    		<td><a href="#"><i class="fa fa-history" style="color:#ff9800"></i>진행 대기중</a></td>
	    		<td><a href="#"><i class="fa fa-history" style="color:#ff9800"></i>진행 대기중</a></td>
	    	</tr>
	   	</c:when>
	   	<c:when test="${cons.cons_result1 eq 'deny'}">
	   		<tr>
	    		<td><a href="#"><i class="fa fa-minus-square" style="color:red;"></i> 감정 불가</a></td>
	    		<td><a href="#"><i class="fa fa-history" style="color:#ff9800"></i>진행 대기중</a></td>
	    		<td><a href="#"><i class="fa fa-history" style="color:#ff9800"></i>진행 대기중</a></td>
	    	</tr>
	   	</c:when>
	   	<c:otherwise>
	   		<tr>
	   			<td><a href="#"><i class="fa fa-check-square-o" style="color:green;"></i> 감정 승인</a></td>
	   			<c:choose>
			   		<c:when test="${cons.cons_result2 =='yet'}">
			     		<td><a href="#"><i class="fa fa-circle-o-notch fa-spin" style="color:#ff9800"></i> 감정중</a></td>
			      		<td><a href="#"><i class="fa fa-history" style="color:#ff9800"></i>진행 대기중</a></td>
			      	</c:when>
	      			<c:when test="${cons.cons_result2 =='deny'}">
				      	<td><a href="#"><i class="fa fa-diamond" style="color:blue;"></i> 감정 완료</a></td>
				      	<td><a href="#"><i class="fa fa-minus-square" style="color:red;"></i> 위탁 불가</a></td>
				    </c:when>
	      			<c:otherwise>
				      	<td><a href="#"><i class="fa fa-diamond" style="color:blue;"></i> 감정 완료</a></td>
				      	<c:if test="${cons.cons_commit == 'yet'}">
				      		<td><a href="#"><i class="fa fa-circle-o-notch fa-spin" style="color:#ff9800"></i> 승인 대기중</a></td>
				      	</c:if>
				      	<c:if test="${cons.cons_commit == 'no'}">
				      		<td><a href="#"><i class="fa fa-minus-square" style="color:red;"></i> 위탁 불가</a></td>
				      	</c:if>
				      	<c:if test="${cons.cons_commit == 'yes'}">
	      					<td><a href="#"><i class="fa fa-star" style="color:#f5dc00;"></i> 위탁 완료</a></td>
	      				</c:if>
	      			</c:otherwise>
		    	</c:choose>
	    	</tr>
	   	</c:otherwise>
	</c:choose>
	<tr>
	   	<td><a href="#"><i class="fa fa-calendar-o" style="margin-right:55px;"></i><c:out value="${not empty cons.cons_result1_date ? cons.cons_result1_date:'-'}"/></a></td>
	   	<td><a href="#"><i class="fa fa-calendar-o" style="margin-right:55px;"></i><c:out value="${not empty cons.cons_result2_date ? cons.cons_result1_date:'-'}"/></a></td>
	   	<td></td>
	</tr>
</table>