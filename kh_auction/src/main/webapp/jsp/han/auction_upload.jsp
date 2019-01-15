<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Portfolio Details | Triangle</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="resources/css/lightbox.css" rel="stylesheet"> 
    <link href="resources/css/animate.min.css" rel="stylesheet"> 
	<link href="resources/css/main.css" rel="stylesheet">
	<link href="resources/css/responsive.css" rel="stylesheet">
	<link href="resources/_jin/upload.css" rel="stylesheet">
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
<form method="post" action="auction_up_ok.hh" enctype="multipart/form-data">
     <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">경매 등록하기</h1>
                            <c:if test="${user_id ne 'admin'}">
                            	<p>일반 경매를 등록합니다.</p>
                            </c:if>
                            <c:if test="${user_id eq 'admin'}">
                            	<p>일반/정기 경매를 등록합니다.</p>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#action-->

    <section id="portfolio-information" class="padding-top">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="img-responsive sample_view">여기는 이미지가 미리 보입니다.</div>
                    <div class="live-preview" style="text-align:center;">
                    	<div ><h3>Drop Images below.</h3>
                        	<input multiple="multiple"  type="file" name="auc_img" class="img_up" id="img_up"/>
                		</div>
                	</div>
            	</div>
                <div class="col-sm-6">
                  <h1 class="title text-center">경매 정보 입력</h1>
                    <div class="project-name overflow">
                    	<input type="hidden" name="user_id" value="${user_id}">
                    </div>
                    <div class="project-info overflow">
                    	<h4> ◎ 게시 유형</h4>
                        <c:choose>
                        	<c:when test="${user_id eq 'admin'}">
                        		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="auc_info1" id="a_vip" value="vip" checked><label for="a_vip">정기경매</label>&nbsp;&nbsp;
                        		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="auc_info1" id="a_normal" value="normal"><label for="a_normal">일반경매</label>
                        	</c:when>
                        	<c:when test="${user_id ne 'admin'}">
                        		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="auc_info1" id="a_normal" value="normal" checked><label for="a_normal">일반경매</label>
                        	</c:when>
                        </c:choose>
                        <h4> ◎ 경매 방법</h4>
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="auc_info2" id="a_time" class="ti_bli" value="time" required ><label for="a_time" >실시간 경매</label>&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="auc_info2" id="a_blind" class="ti_bli" value="blind"><label for="a_blind">깜깜이 경매</label><br>
                        <h4> ◎ 보증서</h4>
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="guarantee" id="g_yes" value="yes" class="ggconfig" required ><label for="g_yes">유</label>&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="guarantee" id="g_no" value="no" class="ggconfig"><label for="g_no">무</label>
                        <div id="for_guarantee_info">
                        	<textarea name="guarantee_info" id="guarantee_info" placeholder="보증서 정보를 입력해주세요" class="form-control" rows="5"></textarea>
                        </div>
                        <h4> ◎ 경매 가격 정보</h4>
                        <div id="price_table_container">
                       	<table class="price_table">
                       		<tr>
                       			<th>시작 가격</th>
                       			<th>입찰 단위</th>
                       		</tr>
                       		<tr>
                       			<td><input type="number" min="0" name="auc_price" class="price_in" id="auc_price" placeholder="시작가격을 입력하세요."  required > </td>
                       			<td><input type="number" min="1" name="auc_interval"  class="price_in" id="auc_interval" max="10000000" placeholder="입찰 단위를 입력하세요."></td>
                       		</tr>
                       		<tr>
                       			<td><span id="korstart"></span>원</td>
                       			<td><span id="korend"></span>원</td>
                       		</tr>
                       	</table>
                       	</div>
                       	<H4> ◎ 경매 날짜 정보</H4>
                       	<table class="date_table">
                       		<tr>
                       			<th>시작 날짜&nbsp;&nbsp;&nbsp;(<label for="auto_s_date">자동</label><input type="checkbox" name="auto_date_s" class="auto_date" value="start_default"><input type="hidden" value="start_date">)<span style="color:blue;" id="infos">ⓘ</span></th>
                       			<th>종료 날짜&nbsp;&nbsp;&nbsp;(<label for="auto_e_date">자동</label><input type="checkbox" name="auto_date_e" class="auto_date" value="end_default"><input type="hidden" value="end_date">)<span style="color:blue;" id="infos">ⓘ</span></th>
                       		</tr>
                       		<tr>
                       			<td>
                       				<input type="date" name="auc_start1" id="auc_start1" class="start_date" required><br>
                       				<select name="s_hour" id="s_hour" class="start_date" required>
                       					<c:forEach begin="0" end="23" var="temp_var">
                       						<option value="${temp_var}">${temp_var}</option>
                       					</c:forEach>
                       				</select>시&nbsp;&nbsp;
                       				<select name="s_min" id="s_min" class="start_date" required>
                       					<c:forEach begin="0" end="59" var="temp_var">
                       						<option value="${temp_var}">${temp_var}</option>
                       					</c:forEach>
                       				</select>분
                       			</td>
                       			<td>
                       				<select name="e_date" id="e_date" class="end_date" required>
                       					<c:forEach begin="0" end="6" var="temp_var" >
	                       					<option value="${temp_var}">${temp_var}</option>
                       					</c:forEach>
                       				</select>일
                       				<select name="e_hour" id="e_hour" class="end_date" required>
                       					<c:forEach begin="0" end="23" var="temp_var">
                       						<option value="${temp_var}">${temp_var}</option>
                       					</c:forEach>
                       				</select>시&nbsp;&nbsp;
                       				<select name="e_min" id="e_min" class="end_date" required>
                       					<c:forEach begin="0" end="59" var="temp_var">
                       						<option value="${temp_var}">${temp_var}</option>
                       					</c:forEach>
                       				</select>분<br><b>뒤에 종료</b>
                       			</td>
                       		</tr>
                       	</table>
                        <H4> ◎ 거래 방법</H4>
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="method" id="trade1" value="come" class="tr_config"><label for="trade1">방문 수령</label>&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="method" id="trade2" value="direct" class="tr_config"><label for="trade2">직접 거래</label>&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="method" id="trade3" value="post" class="tr_config"><label for="trade3">택배 거래</label><br>
                        <span>택배비 : </span><input type="number" name="method_price" id="method_price" width="50px" min="0">
                    </div>
                    <div class="skills overflow">
                        <h3> ◎ Category:</h3>
                            <input type="radio" name="auc_category1" value="car" id="car"><label for="car">자동차</label>&nbsp;&nbsp;
                            <input type="radio" name="auc_category1" value="art" id="art"><label for="art">미술품</label>&nbsp;&nbsp;
                            <input type="radio" name="auc_category1" value="land" id="land"><label for="land">부동산</label>&nbsp;&nbsp;
                            <input type="radio" name="auc_category1" value="jewelry" id="jewelry"><label for="jewelry">귀금속</label>&nbsp;&nbsp;
                            <input type="radio" name="auc_category1" value="clothes" id="clothes"><label for="clothes">의류</label>&nbsp;&nbsp;
                            <input type="radio" name="auc_category1" value="etc" id="etc"><label for="etc">기타</label>
                    </div>
                    <c:if test="${user_id eq 'admin'}">
	                    <div class="client overflow">
	                        <h3> ◎ Client : <span id="user_info"><a id="user_go" href="#">사용자를 확인합니다.</a></span></h3>
	                            <input type="text" name="con_id" id="con_id" placeholder="위탁 고객을 입력하고 확인을 누르세요." class="form-control">
	                            <button type="button" id="id_config" class="btn concon">고객 확인</button><button type="button" id="id_reconf" class="btn concon">고객 변경</button>
	                    </div>
                    </c:if>
                </div>
            </div>
        </div>
    </section>
     <!--/#portfolio-information-->

    <section id="related-work" class="padding-top padding-bottom">
        <div class="container">
            <div class="row">
                <h1 class="title text-center">경매 내용 입력</h1>
                <br>
                <input type="text" name="auc_title" placeholder="제목을 입력하세요" class="form-control" required="required">
                <br>
                <textarea name="auc_content" cols="40" rows="30" class="form-control" placeholder="경매 내용을 입력하세요" required="required"></textarea>
            </div>
            <button type="submit" name="submit" class="btn btn-submit">AUCTION!</button>
        </div>
    </section>
    <!--/#related-work-->
</form>
    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center bottom-separator">
                    <img src="resources/images/home/under.png" class="img-responsive inline" alt="">
                </div>
                <div class="col-sm-12">
                    <div class="copyright-text text-center">
                        <p>&copy; KH Auction 2019. All Rights Reserved.</p>
                        <p>Designed by <a target="_blank" href="http://www.themeum.com">KH_Acution</a></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--/#footer-->
    <script type="text/javascript" src="resources/js/jquery.js"></script>
    <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resources/js/lightbox.min.js"></script>
    <script type="text/javascript" src="resources/js/wow.min.js"></script>
    <script type="text/javascript" src="resources/js/main.js"></script>  
    <script type="text/javascript" src="resources/_jin/upload.js"></script>
</body>
</html>
