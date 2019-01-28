<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 단일 빈 -->
                    <c:set var="contr" value="1"/>
                    <table style="width:100%">
                    <c:forEach var="bean" items="${cons_list}">
                    <c:if test="${contr%2==1}"><tr></c:if>
                    <td>
                         <div class="col-md-12 col-sm-12 blog-padding-right">
                            <div class="single-blog two-column">
                                <div class="post-thumb">
                                    <a href="cons_detail.hh?cons_no=${bean.cons_no}"><img src="${bean.cons_img1}" class="img-responsive" alt="${cons_title}"></a>
                                </div>
                                <div class="post-content overflow">
                                    <h2 class="post-title bold"><a href="cons_detail.hh?cons_no=${bean.cons_no}"><c:out value="${bean.cons_title}"/></a></h2>
                                    <h3 class="post-author"><a href="#">Posted by <c:out value="${bean.cons_id}"/></a></h3>
                                    <div style="height:90px; overflow:hidden;">
                                    	<c:if test="${fn:length(bean.cons_content) le 100}">
                                    		<c:out value="${bean.cons_content}"/>
                                    	</c:if>
                                    	<c:if test="${fn:length(bean.cons_content) gt 100}">
                                    		<c:out value="${fn:substring(bean.cons_content,0,96)}"/><c:out value="[...]"/>
                                    	</c:if>
                                    </div>
                                    <a href="cons_detail.hh?cons_no=${bean.cons_no}" class="read-more">View More</a>
                                    <div class="post-bottom overflow">
                                    <table style="width:100%;">
                                    <c:choose>
                                    	<c:when test="${bean.cons_result1 eq 'yet'}">
	                                    	<tr>
	                                    		<td><a href="#"><i class="fa fa-circle-o-notch fa-spin" style="color:#ff9800"></i> 검토중</a></td>
	                                    		<td><a href="#"><i class="fa fa-history" style="color:#ff9800"></i>진행 대기중</a></td>
	                                    		<td><a href="#"><i class="fa fa-history" style="color:#ff9800"></i>진행 대기중</a></td>
	                                    	</tr>
                                    	</c:when>
                                    	<c:when test="${bean.cons_result1 eq 'deny'}">
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
                                    			<c:when test="${bean.cons_result2 =='yet'}">
		                                    		<td><a href="#"><i class="fa fa-circle-o-notch fa-spin" style="color:#ff9800"></i> 감정중</a></td>
			                                    	<td><a href="#"><i class="fa fa-history" style="color:#ff9800"></i>진행 대기중</a></td>
			                                    </c:when>
			                                    <c:when test="${bean.cons_result2 =='deny'}">
			                                    	<td><a href="#"><i class="fa fa-diamond" style="color:blue;"></i> 감정 완료</a></td>
			                                    	<td><a href="#"><i class="fa fa-minus-square" style="color:red;"></i> 위탁 불가</a></td>
			                                    </c:when>
			                                    <c:otherwise>
			                                    	<td><a href="#"><i class="fa fa-diamond" style="color:blue;"></i> 감정 완료</a></td>
			                                    	<c:if test="${bean.cons_commit == 'yet'}">
			                                    		<td><a href="#"><i class="fa fa-circle-o-notch fa-spin" style="color:#ff9800"></i> 승인 대기중</a></td>
			                                    	</c:if>
			                                    	<c:if test="${bean.cons_commit == 'deny'}">
			                                    		<td><a href="#"><i class="fa fa-minus-square" style="color:red;"></i> 위탁 불가</a></td>
			                                    	</c:if>
			                                    	<c:if test="${bean.cons_commit == 'accept'}">
			                                    		<td><a href="#"><i class="fa fa-star" style="color:#f5dc00;"></i> 위탁 완료</a></td>
			                                    	</c:if>
			                                    </c:otherwise>
	                                    	</c:choose>
	                                    	</tr>
                                    	</c:otherwise>
                                    </c:choose>
                                    	<tr>
	                                    	<td><a href="#"><i class="fa fa-calendar-o" ></i><c:out value="${bean.cons_result1_date != null ? bean.cons_result1_date:'-'}"/></a></td>
	                                    	<td><a href="#"><i class="fa fa-calendar-o" ></i><c:out value="${bean.cons_result2_date != null ? bean.cons_result1_date:'-'}"/></a></td>
	                                    	<td><a href="#"><i class="fa fa-comments"></i> ${bean.comments_count} Comments</a></td>
	                                    </tr>
                                    </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </td>
                        <c:set var="contr" value="${contr+1}"/>
                        <c:if test="${contr%2==1}"></tr></c:if>
                    </c:forEach>
                    </table>
                    <!-- 단일 빈 종료 -->
