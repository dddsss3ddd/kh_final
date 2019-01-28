<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

                    
                    <!-- 페이징 -->
<!-- 
                    <div class="blog-pagination">
                        <ul class="pagination">
 -->
                         <li><a href="#" class="selectpage go_left">left</a></li>
                         <c:forEach var="pco" begin="${s_page}" end="${e_page}">
	                         <li><a href="#" class='selectpage <c:if test="${pco==page}">active</c:if><c:if test="${pco!=page}">to_page</c:if>'>${pco}</a></li>
                         </c:forEach>
                         <li><a href="#" class="selectpage go_right">right</a></li>