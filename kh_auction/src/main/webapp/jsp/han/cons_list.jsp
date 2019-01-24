<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Blog 2 Columns + Right Sidebar | Triangle</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="resources/css/lightbox.css" rel="stylesheet"> 
    <link href="resources/css/animate.min.css" rel="stylesheet"> 
	<link href="resources/_jin/main2.css" rel="stylesheet">
	<link href="resources/css/responsive.css" rel="stylesheet">

    <!--[if lt IE 9]>
	    <script src="resources/js/html5shiv.js"></script>
	    <script src="resources/js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="resources/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="resources/images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
	<jsp:include page="../../header.jsp"/>
    <!--/#header-->


    <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <span class="title" style="font-size:30px;">위탁게시판</span>
                            <div style="display:block; text-align:center;">
	                            <button style="width:300px; height:100px;
	                            		background-color:#0089ff;
	                            		font-size:30px; margin-right:80px;
	                            		border:0;font-weight:bold;color:white;
	                            		border-radius:20px;" onclick="location.href='cons_write.hh';">위탁 신청하기</button>
                       		</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
    <!--/#action-->
    
    
    
    <section id="blog" class="padding-top">
        <div class="container">
            <div class="row">
                <div class="col-md-10">
                <c:choose>
                	<c:when test="${user_grade == 'master' or user_grade=='admin'}">
	                	<ul id="tab1" class="nav nav-tabs">
						    <li class="active"><a href="#" data-toggle="tab">전체 보기</a></li>
						    <li><a href="#" data-toggle="tab">감정 검토중</a></li>
						    <li><a href="#" data-toggle="tab">감정 진행중</a></li>
						    <li><a href="#" data-toggle="tab">위탁절차 진행중</a></li>
						    <li><a href="#" data-toggle="tab">위탁신청 완료</a></li>
			    		</ul>
		    		</c:when>
		    		<c:otherwise>
			    		<ul id="tab1" class="nav nav-tabs">
						    <li class="active"><a href="#" data-toggle="tab">전체 보기</a></li>
						    <li><a href="#" data-toggle="tab">나의 위탁신청</a></li>
			    		</ul>
		    		</c:otherwise>
		    	</c:choose>
		    		<br>
                    <div class="row">
                    <!-- 리스트 내용 시작 -->
                    
                    <!-- 
                    <td><a href="jsp/main/#"><i class="fa fa-circle-o-notch fa-spin" style="color:#ff9800"></i> 검토중</a></td>
                    
                    <td><a href="jsp/main/#"><i class="fa fa-minus-square" style="color:red;"></i> 감정 불가</a></td>
                    <td><a href="jsp/main/#"><i class="fa fa-check-square-o" style="color:green;"></i> 감정 승인</a></td>
                    
                    <td><a href="jsp/main/#"><i class="fa fa-circle-o-notch fa-spin" style="color:#ff9800"></i> 감정중</a></td>
					<td><a href="jsp/main/#"><i class="fa fa-diamond" style="color:blue;"></i> 감정 완료</a></td>
					
                    <td><a href="jsp/main/#"><i class="fa fa-history" style="color:#ff9800"></i>진행 대기중</a></td>
                    
                    <td><a href="jsp/main/#"><i class="fa fa-minus-square" style="color:red;"></i> 위탁 불가</a></td>
                    <td><a href="jsp/main/#"><i class="fa fa-star" style="color:#f5dc00;"></i> 위탁 완료</a></td>
                     -->
                    
                    
                    <!-- 단일 빈 -->
                    <c:forEach var="bean" items="${cons_list}">
                         <div class="col-md-6 col-sm-12 blog-padding-right">
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
			                                    	<c:if test="${bean.cons_commit == 'no'}">
			                                    		<td><a href="#"><i class="fa fa-minus-square" style="color:red;"></i> 위탁 불가</a></td>
			                                    	</c:if>
			                                    	<c:if test="${bean.cons_commit == 'yes'}">
			                                    		<td><a href="#"><i class="fa fa-star" style="color:#f5dc00;"></i> 위탁 완료</a></td>
			                                    	</c:if>
			                                    </c:otherwise>
	                                    	</c:choose>
	                                    	</tr>
                                    	</c:otherwise>
                                    </c:choose>
                                    	<tr>
	                                    	<td><a href="#"><i class="fa fa-calendar-o" style="margin-right:55px;"></i><c:out value="${bean.cons_result1_date != null ? bean.cons_result1_date:'-'}"/></a></td>
	                                    	<td><a href="#"><i class="fa fa-calendar-o" style="margin-right:55px;"></i><c:out value="${bean.cons_result2_date != null ? bean.cons_result1_date:'-'}"/></a></td>
	                                    	<td><a href="#"><i class="fa fa-comments"></i> ${bean.comments_count} Comments</a></td>
	                                    </tr>
                                    </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <!-- 단일 빈 종료 -->
                    
                    </div><!-- 리스트 내용 끝 -->
                    
                    <!-- 페이징 -->
                    <div class="blog-pagination">
                        <ul class="pagination">
                          <li><a href="#">left</a></li>
                          <li class="active"><a href="#">1</a></li>
                          <c:forEach var="pco" begin="2" end="${pages}">
	                          <li><a href="#">${pco}</a></li>
                          </c:forEach>
                          <li><a href="jsp/main/#">right</a></li>
                        </ul>
                    </div>
                 </div>
            </div>
        </div>
    </section>
    <!--/#blog-->

    <jsp:include page="../../footer.jsp"/>
    <!--/#footer-->

    <script type="text/javascript" src="resources/js/jquery.js"></script>
    <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resources/js/lightbox.min.js"></script>
    <script type="text/javascript" src="resources/js/wow.min.js"></script>
    <script type="text/javascript" src="resources/js/main.js"></script>
</body>
</html>
