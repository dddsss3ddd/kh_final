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
    <title>Blog Details | Triangle</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="resources/css/lightbox.css" rel="stylesheet"> 
    <link href="resources/css/animate.min.css" rel="stylesheet"> 
	<link href="resources/css/main.css" rel="stylesheet">
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
    <script type="text/javascript">var switchTo5x=true;</script>
    <script type="text/javascript" src="resources/_jin/buttons.js"></script>
    <script type="text/javascript">stLight.options({publisher: "7e8eb33b-fbe0-4915-9b93-09490e3d10df", doNotHash: false, doNotCopy: false, hashAddressBar: false});</script>
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
                            <h1 class="title">위탁신청 : <c:out value="${cons.cons_no}"/> 제목 : 
                            <c:out value="${cons.cons_title}"/></h1>
                            <c:if test="${user_id == cons.cons_id or user_grade=='master' or user_grade=='admin' }">
                            	<p>작성자 : <c:out value="${cons.cons_id}"/></p>
                            </c:if>
                        </div>                                                                                
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#page-breadcrumb-->

    <section id="blog-details" class="padding-top">
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-7">
                    <div class="row">
                         <div class="col-md-12 col-sm-12">
                            <div class="single-blog blog-details two-column">
                                <div class="post-thumb">
                                    <img src="${fn:split(cons.cons_img2,',')[0]}" class="img-responsive" alt="" id="large_img" style="margin:0px auto;">
                                </div>
                                <div style="overflow-x:scroll; height:120px;white-space:nowrap;" id="small_imgs">
                                	<c:forEach var="imgs" items="${fn:split(cons.cons_img2,',')}">	
                                		<img src="${imgs}" style="width:100px;height:100px;">
	                                </c:forEach>
                                </div>
                                <div class="post-content overflow">
                                    <p>
                                    ${cons.cons_content}
                                    </p>
                                    <div class="post-bottom overflow">
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
	                                    	<td><a href="#"><i class="fa fa-calendar-o" style="margin-right:55px;"></i><c:out value="${cons.cons_result1_date != null ? cons.cons_result1_date:'-'}"/></a></td>
	                                    	<td><a href="#"><i class="fa fa-calendar-o" style="margin-right:55px;"></i><c:out value="${cons.cons_result2_date != null ? cons.cons_result1_date:'-'}"/></a></td>
	                                    	<td></td>
	                                    </tr>
                                    	</table>
                                    </div>
                                    <div class="blog-share">
                                    	<c:if test="${time_compare != 'can_not_mod'}">
                                        	<button class="btn btn-lg btn-warning">내용 수정하기</button>
                                        </c:if>
                                    </div>
                                    <br><br>
                                    <div class="response-area">
                                    <h2 class="bold">Comments</h2>
                                    <ul class="media-list">
                                        <li class="media">
                                            <div class="post-comment">
                                                <a class="pull-left" href="#">
                                                    <img class="media-object" src="resources/images/blogdetails/2.png" alt="사용자 이미지">
                                                </a>
                                                <div class="media-body">
                                                    <span><i class="fa fa-user"></i>Posted by <a href="jsp/main/#">아이디 여기</a></span>
                                                    <p>댓글 내용이 여기로</p>
                                                    <ul class="nav navbar-nav post-nav">
                                                        <li><a href="#"><i class="fa fa-clock-o"></i>댓글 등록일</a></li>
                                                        <li><a href="jsp/main/#"><i class="fa fa-reply"></i>Reply</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="parrent">
                                                <ul class="media-list">
                                                    <li class="post-comment reply">
                                                        <a class="pull-left" href="#">
                                                            <img class="media-object" src="resources/images/blogdetails/3.png" alt="사용자 이미지">
                                                        </a>
                                                        <div class="media-body">
                                                            <span><i class="fa fa-user"></i>Posted by <a href="jsp/main/#">댓글 래벨은 1단계로만</a></span>
                                                            <p>이미지를 올리게 할 것인가 말 것인가?, 이미지는 그림자 이미지로 한다. </p>
                                                            <ul class="nav navbar-nav post-nav">
                                                                <li><a href="jsp/main/#"><i class="fa fa-clock-o"></i>February 11,2014</a></li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="media">
                                            <div class="post-comment">
                                                <a class="pull-left" href="#">
                                                    <img class="media-object" src="resources/images/blogdetails/4.png" alt="">
                                                </a>
                                                <div class="media-body">
                                                    <span><i class="fa fa-user"></i>Posted by <a href="jsp/main/#">아이디</a></span>
                                                    <p>여기는 두번째 댓글 내용이 온다.</p>
                                                    <ul class="nav navbar-nav post-nav">
                                                        <li><a href="jsp/main/#"><i class="fa fa-clock-o"></i>February 11,2014</a></li>
                                                        <li><a href="jsp/main/#"><i class="fa fa-reply"></i>Reply</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                        
                                    </ul>                   
                                </div><!--/Response-area-->
                                </div>
                            </div>
                        </div>
                    </div>
                 </div>
                 
                <div class="col-md-3 col-sm-5">
                    <div class="sidebar blog-sidebar">
                        <div class="sidebar-item  recent">
	                        <c:if test="${cons.cons_result1 =='accept' and cons.cons_go_date == null and user_id == cons_id}">
	                            <h3>감정 날짜 선택</h3>
	                            <table style="width:100%;"><tr>
	                            <td style="width:33%;"><button style="width:100%;" class="btn btn-info">이전</button></td>
	                            <td style="width:34%;"><button style="width:100%;" class="btn btn-info">현재</button></td>
	                            <td><button style="width:100%;" class="btn btn-info">다음</button></td>
	                            </tr></table><br>
	                            <table style="width:100%;">
	                            	<tr><td colspan="7" style="text-align:center;font-size:20px;">2019년 1월</td></tr>
	                            	<tr>
	                            		<td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td>
	                            	</tr>
	                            	<tr>
	                            		<td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td>
	                            	</tr>
	                            	<tr>
	                            		<td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td>
	                            	</tr>
	                            	<tr>
	                            		<td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td>
	                            	</tr>
	                            	<tr>
	                            		<td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td>
	                            	</tr>
	                            	<tr>
	                            		<td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td>
	                            	</tr>
	                            </table><br>
	                            <div style="text-align:center;">
	                                                        <input type="text" style="width:20%" readOnly>년 <input type="text" style="width:20%" readOnly>월 <input type="text" style="width:20%" readOnly>일<hr>
	                            <input type="radio" value="dispatch" name="appraise" value="dispatch" id="dispatch"><label for="dispatch">파견</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <input type="radio" value="visit" name="appraise" value="visit" id="visit"><label for="visit">방문</label>
	                            <br>
	                            <input type="number" min="10" max="17" style="width:20%;">시 ~ <input type="number" max="18" style="width:20%;">시 사이
	                            </div><hr>
	                            <input type="text" placeholder="요청 사항을 입력해주세요." style="width:100%;height:100px;overflow:auto;">
	                            <br>
	                            <button style="width:100%;" class="btn btn-lg btn-success">감정 신청</button>
	                        </c:if>
	                        <c:if test="${cons.cons_result1 =='yet'}">
	                        	<h3>작성 내용을 검토중입니다.</h3>
	                        	<p>등록하신 내용을 바탕으로 경매 물품에 대해 검토하는 중입니다. 이 과정은 며칠이 걸릴 수 있습니다.</p>
	                        </c:if>
	                        <c:if test="${cons.cons_result1 =='deny'}">
	                        	<h3>감정을 진행할 수 없습니다.</h3>
	                        </c:if>
                        </div>
                        <div class="sidebar-item categories">
                            <h3>감정결과</h3>
                            <c:if test="${cons.cons_ant_price != null}">
	                            <table style="width:100%;">
		                            <tr><td style="height:50px;">감정가 : <input type="number" id="values_" value="" style="font-size:30px;" readOnly></td></tr>
		                            <tr><td style="height:30px;text-align:center;font-size:20px;">한글 숫자값</td></tr>
		                            <tr><td colspan="2" style="text-align:center;">감정가 설명</td></tr>
		                            <tr><td colspan="2">여기에 설명 적음</td></tr>
	                            </table>
	                            <c:if test="${user_grade == 'master' or user_grade =='admin'}">
	                            	<button style="width:100%" class="btn btn-lg btn-warning">감정가 수정</button>
	                            </c:if>
                            </c:if>
                            <c:if test="${cons.cons_ant_price == null}">
                            	<c:if test="${user_grade != 'master' or user_grade !='admin'}">
		                            <table style="width:100%;">
			                            <tr><td style="height:50px;">감정가 : <input type="number" id="values_" value="" style="font-size:30px;" readOnly></td></tr>
			                            <tr><td style="height:30px;text-align:center;font-size:20px;">한글 숫자값</td></tr>
			                            <tr><td colspan="2" style="text-align:center;">감정가 설명</td></tr>
			                            <tr><td colspan="2">여기에 설명 적음</td></tr>
		                            </table>
	                            </c:if>
	                            <c:if test="${user_grade == 'master' or user_grade =='admin'}">
		                            <table style="width:100%;">
			                            <tr><td style="height:50px;">감정가 : <input type="number" id="values_" value="" style="font-size:30px;"></td></tr>
			                            <tr><td style="height:30px;text-align:center;font-size:20px;">한글 숫자값</td></tr>
			                            <tr><td colspan="2" style="text-align:center;">감정가 설명</td></tr>
			                            <tr><td colspan="2"><textarea cols="10" rows="10"></textarea></td></tr>
		                            </table>
		                            <button style="width:100%" class="btn btn-lg btn-success">감정가 입력</button>
	                            </c:if>
                            </c:if>
                        </div>
                        <c:if test="${cons.cons_result2 =='accept' and cons.cons_commit == 'no' and user_id == cons_id}">
	                        <div class="sidebar-item tag-cloud">
	                            <h3>안내사항</h3>
	                            <p>
	                            <span>위탁에 대한 안내사항 </span><br>
	                             - 위탁을 취소할 경우 출장 감정비를 지불할 수 있습니다.
	                             - 위탁을 승인할 경우 정기 경매로 진행이 되며 낙찰 금액의 10%를 수수로 공제한 후 낙찰금을 받으실 수 있습니다.
	                             - 샬라샬라~~~~~~~~~~~~~~~~~~~~~~~~~
	                            </p>
	                        </div>
	                        <div class="sidebar-item popular">
	                            <h3>nth 정기 경매에 등록합니다.</h3>
	                            <p>시작가:1000000000(디폴트 = 추정가의 70% 시작)</p>
	                            <p>한글 숫자 표시</p>
	                            <p>단위:1000000000(디폴트 = 시작가의 1%, 천원 이하 버림, 큰자리만 남김.)</p>
	                            <p>한글 숫자 표시</p>
	                            <button style="width:50%;" class="btn btn-lg btn-success">위탁 경매 승인</button>
	                            <button style="width:50%;" class="btn btn-lg btn-danger">위탁 경매 취소</button>
	                        </div>
                        </c:if>
                        <c:if test="${cons.cons_result2 =='accept' and cons.cons_commit == 'yes'}">
	                        <div class="sidebar-item tag-cloud">
	                            <h3>안내사항</h3>
	                            <p>
	                            <span>위탁에 대한 안내사항 </span><br>
	                             - 위탁을 취소할 경우 출장 감정비를 지불할 수 있습니다.
	                             - 위탁을 승인할 경우 정기 경매로 진행이 되며 낙찰 금액의 10%를 수수로 공제한 후 낙찰금을 받으실 수 있습니다.
	                             - 샬라샬라 (여기는 조인을 해서 빈을 추가하는 형식으로 합시다.)
	                            </p>
	                        </div>
	                        <div class="sidebar-item popular">
	                            <h3>nth 정기 경매에 등록하였습니다.</h3>
	                            <p>시작가:1000000000</p>
	                            <p>한글 숫자 표시</p>
	                            <p>단위:1000000000</p>
	                            <p>한글 숫자 표시</p>
	                            <button style="width:100%;" class="btn btn-lg btn-success" disabled>등록 완료</button>
	                        </div>
                        </c:if>
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
