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
	<link href="resources/_jin/cons_detail.css" rel="stylesheet">
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
                            <h1 class="title">위탁신청 : <input type="hidden" value="${cons.cons_no}" id="cons_no"><c:out value="${cons.cons_no}"/> 제목 : 
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
                                <div class="post-thumb" style="height:600px;">
                                    <img src="${fn:split(cons.cons_img2,',')[0]}" class="img-responsive" alt="" id="large_img" style="margin:0px auto;object-fit:contain;height:100%;width:auto;">
                                </div>
                                <div style="overflow-x:scroll; height:120px;white-space:nowrap;" id="small_imgs">
                                	<c:forEach var="imgs" items="${fn:split(cons.cons_img2,',')}">	
                                		<img class="smalls" src="${imgs}" style="width:100px;height:100px;">
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
			                                    	<c:if test="${cons.cons_commit == 'deny'}">
			                                    		<td><a href="#"><i class="fa fa-minus-square" style="color:red;"></i> 위탁 불가</a></td>
			                                    	</c:if>
			                                    	<c:if test="${cons.cons_commit == 'accept'}">
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
                                    </div>
                                    <div class="blog-share">
                                    	<c:if test="${(time_compare != 'can_not_mod' and cons.cons_id==user_id) or user_grade=='admin' or user_grade=='master'}">
                                        	<button class="btn btn-lg btn-warning cons_mod">내용 수정하기</button>
                                        </c:if>
                                        <c:if test="${cons.cons_id==user_id or user_grade=='admin' or user_grade=='master'}">
                                        	<button class="btn btn-lg btn-warning cons_del">글 삭제하기</button>
                                        </c:if>
                                    </div>
                                    <br><br>
                                </div>
                            </div>
                        </div>
                    </div>
                 </div>
                 
                <div class="col-md-3 col-sm-5">
                    <div class="sidebar blog-sidebar">
                        <div class="sidebar-item  recent">
	                        <c:if test="${cons.cons_result1 =='accept' and not empty cons.cons_go_date}">
	                            <c:if test="${user_id==cons_id}">
		                            <h3>감정 날짜 선택</h3>
		                            <br>
			                            <input type="date" style="width:100%; height:50px; font-size:30px; color:darkgray;" id="cons_go_date">
			                            <br>
		                            <div style="text-align:center;">
		                            <input type="radio" value="dispatch" name="appraise" value="dispatch" id="dispatch"><label for="dispatch">파견</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                            <input type="radio" value="visit" name="appraise" value="visit" id="visit"><label for="visit">방문</label>
		                            <br>
		                            <input type="number" min="10" max="17" style="width:20%;" id="i_s_time">시 ~ <input type="number" max="18" style="width:20%;" id="i_e_time">시 사이
		                            </div><hr>
		                            <input type="text" placeholder="요청 사항을 입력해주세요." style="width:100%;height:100px;overflow:auto;">
		                            <br>
		                            <button style="width:100%;" class="btn btn-lg btn-success identify_date" value="identify_date_select">감정 신청</button>
	                            </c:if>
	                            <c:if test="${user_id != cons_id}">
	                            	<h3>위탁 절차를 진행중입니다.</h3>
	                            </c:if>
	                        </c:if>
	                        <c:if test="${cons.cons_result1 =='yet'}">
	                        	<c:if test="${user_grade !='master' and user_grade != 'admin' }">
		                        	<h3>작성 내용을 검토중입니다.</h3>
		                        	<p>등록하신 내용을 바탕으로 경매 물품에 대해 검토하는 중입니다. 이 과정은 며칠이 걸릴 수 있습니다.</p>
	                        	</c:if>
	                        	<c:if test="${user_grade =='master' or user_grade == 'admin' }">
		                        	<h3>물품 감정 신청 결과</h3>
		                        	<button style="width:49%;" class="btn btn-lg btn-success identify" value="indentify_accept">승인</button>
	                            	<button style="width:49%;" class="btn btn-lg btn-danger identify" value="indentify_deny">거절</button>
	                        	</c:if>
	                        </c:if>
	                        <c:if test="${cons.cons_result1 =='deny'}">
	                        	<h3>감정을 진행할 수 없습니다.</h3>
	                        </c:if>
                        </div>
                        <div class="sidebar-item categories">
                            <h3>감정결과</h3>
                            <!-- 감정가 0이 아니고 관리자 계정일 경우 -->
                            <c:if test="${cons.cons_ant_price ne 0 and (user_grade == 'master' or user_grade =='admin')}">
	                            <table style="width:100%;">
		                            <tr><td style="height:50px;">감정가 : <input type="number" id="values_" class="price pstart antp" value="${cons.cons_ant_price}" style="font-size:30px;border:0;"></td></tr>
		                            <tr><td style="height:30px;text-align:center;font-size:20px;" class="start_kor pstart antp">한글 숫자값</td></tr>
		                            <tr><td colspan="2" style="text-align:center;">감정가 설명</td></tr>
		                            <tr><td colspan="2"><p>${cons.cons_ans}</p></td></tr>
	                            </table>
	                            <button style="width:100%" class="btn btn-lg btn-warning identify_update" value="ant_update">감정가 수정</button>
                            </c:if>
                            <!-- 감정가 0이 아니고 관리자 계정이 아닐 경우 -->
                            <c:if test="${cons.cons_ant_price ne 0}">
	                            <table style="width:100%;">
		                            <tr><td style="height:50px;">감정가 : <input type="number" id="values_" value="${cons.cons_ant_price}" style="font-size:30px;border:0;" readOnly></td></tr>
		                            <tr><td style="height:30px;text-align:center;font-size:20px;" class="start_kor pstart antp">한글 숫자값</td></tr>
		                            <tr><td colspan="2" style="text-align:center;">감정가 설명(빼기 한개로 치환예정)</td></tr>
		                            <tr><td colspan="2"><p>${cons.cons_ans}</p></td></tr>
	                            </table>
                            </c:if>
                            
                            <c:if test="${cons.cons_ant_price==0}">
                            	<c:if test="${user_grade != 'master' and user_grade !='admin'}">
		                            <table style="width:100%;">
			                            <tr><td style="height:50px;">감정가 : 
			                            	<input type="number" id="values_" value="<c:if test="${cons.cons_result1 != 'yet' }"></c:if>"
			                            		style="font-size:30px; border:0; readOnly">
			                            </td></tr>
			                            <tr><td style="height:30px;text-align:center;font-size:20px;">
											미정
										</td></tr>
			                            <tr><td colspan="2" style="text-align:center;">감정가 설명</td></tr>
			                            <tr><td colspan="2">
			                            	<c:out value="${cons.cons_result1 == 'yet'?'아직 감정을 진행중입니다.': cons.cons_ans }"/>
			                            </td></tr>
		                            </table>
	                            </c:if>
	                            <c:if test="${user_grade == 'master' or user_grade =='admin'}">
		                            <table style="width:100%;">
			                            <tr><td style="height:50px;">감정가 : <input type="number" id="values_" class="price pstart antp" value="" style="font-size:30px; border:0;width:100%"></td></tr>
			                            <tr><td style="height:30px;text-align:center;font-size:20px;" class="start_kor pstart antp">한글 숫자값(널마스터)</td></tr>
			                            <tr><td colspan="2" style="text-align:center;">감정가 설명</td></tr>
			                            <tr><td colspan="2"><textarea rows="10" style="width:100%;" id="values_info"></textarea></td></tr>
		                            </table>
		                            <button style="width:70%" class="btn btn-lg btn-success identify_result" value="ant_in_accept">감정가 입력/위탁 승인</button>
		                            <button style="width:29%" class="btn btn-lg btn-success identify_result" value="ant_in_deny">감정가 입력/위탁 거부</button>
	                            </c:if>
                            </c:if>
                        </div>
                        <div class="sidebar-item tag-cloud">
                            <h3>안내사항</h3>
                            <p>
                            <span>위탁에 대한 안내사항 </span><br>
                             - 위탁을 취소할 경우 출장 감정비를 지불할 수 있습니다.
                             - 위탁을 승인할 경우 정기 경매로 진행이 되며 낙찰 금액의 10%를 수수로 공제한 후 낙찰금을 받으실 수 있습니다.
                             - 시작가는 자체 연구결과에 따라 이상적인 가격으로(추청가의 70%)로 입력됩니다. 다만 원하시는 경우 수정할 수 있습니다.
                             - 입찰단위는 자체 연구결과에 따라 이상적인 가격(입찰가의 2%. 단, 최소값은 1000원)로 산정합니다. 
                            </p>
                        </div>
                        <c:if test="${cons.cons_result2 =='accept' and cons.cons_commit == 'no' and user_id == cons_id}">
	                        <div class="sidebar-item popular">
	                            <h3>nth 정기 경매에 등록합니다.</h3>
	                            <p>시작가:<input type="number" min="0" max="999999999999" value="${cons.cons_ant_price*0.7}" id="auc_price" class="price pstart wantp"></p>
	                            <p class="price_kor pstart wantp">한글 숫자 표시</p>
	                            <p>단위: <input type="number" min="0" max="1000000000" 
	                            		value="${cons.cons_ant_price*0.7*0.02-(cons.cons_ant_price*0.7*0.02%1)>'1000' ? (cons.cons_ant_price*0.7*0.02-(cons.cons_ant_price*0.7*0.02%1000)):'1000'}"
	                            		id="auc_interval"
	                            		class="price pinter wantp"
	                            		></p>
	                            <p class="price_kor pinter wantp">한글 숫자 표시</p>
	                            <button style="width:50%;" class="btn btn-lg btn-success consignment" value="cons_accept">위탁 경매 승인</button>
	                            <button style="width:50%;" class="btn btn-lg btn-danger consignment" value="cons_deny">위탁 경매 취소</button>
	                        </div>
                        </c:if>
                        <c:if test="${cons.cons_result2 =='accept' and cons.cons_commit == 'yes'}">
	                        <div class="sidebar-item popular">
	                            <h3>nth 정기 경매에 등록하였습니다.</h3>
	                            <p class="price pstart wantp">시작가:100000000000</p>
	                            <p class="price_kor pstart wantp">한글 숫자 표시</p>
	                            <p class="price pinter wantp">단위:100000000000</p>
	                            <p class="price_kor pinter wantp">한글 숫자 표시</p>
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
    <script type="text/javascript" src="resources/_jin/cons_detail.js"></script> 
</body>
</html>
