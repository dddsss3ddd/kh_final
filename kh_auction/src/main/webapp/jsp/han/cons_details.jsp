<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
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
                            <h1 class="title">위탁 제목</h1>
                            <p>작성자</p>
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
                                    <a href="jsp/main/#"><img src="resources/images/blog/7.jpg" class="img-responsive" alt=""></a>
                                    <div class="post-overlay">
                                        <span class="uppercase"><a href="jsp/main/#">14 <br><small>Feb</small></a></span>
                                    </div>
                                </div>
                                <div style="overflow-x:scroll; height:100px;white-space:nowrap;">
                                --여기에 선택할 수 있는 이미지들을 넣도록 한다. 선택이미지는 테두리 생기도록.
                                </div>
                                <div class="post-content overflow">
                                    <p>
                                    -- 본문 내용이 이곳에 담기도록 합니다.
                                    </p>
                                    <div class="post-bottom overflow">
                                        <table style="width:100%;">
                                        	<tr>
	                                    		<th>감정 신청</th>
	                                    		<th>감정 결과</th>
	                                    		<th>위탁 신청</th>
	                                    	</tr>
	                                    	<tr>
	                                    		<td><a href="#"><i class="fa fa-circle-o-notch fa-spin" style="color:#ff9800"></i> 검토중</a></td>
	                                    		<td><a href="#"><i class="fa fa-circle-o-notch fa-spin" style="color:#ff9800"></i> 감정중</a></td>
	                                    		<td><a href="#"><i class="fa fa-history" style="color:#ff9800"></i>진행 대기중</a></td>
	                                    	</tr>
	                                    	<tr>
	                                    		<td><a href="#"><i class="fa fa-calendar-o"></i> 2019.01.21</a></td>
	                                    		<td><a href="#"><i class="fa fa-calendar-o"></i> 2019.02.08</a></td>
	                                    		<td><a href="#"><i class="fa fa-calendar-o"></i> 2019.02.08</a></td>
	                                    	</tr>
                                    	</table>
                                    </div>
                                    <div class="blog-share">
                                        <button class="btn btn-lg btn-warning">내용 수정하기</button>
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
                        </div>
                        <div class="sidebar-item categories">
                            <h3>감정결과</h3>
                            <table style="width:100%;">
                            <tr><td>감정가 : </td></tr><tr><td>한글 숫자값</td></tr>
                            <tr><td colspan="2">감정가 설명</td></tr>
                            <tr><td colspan="2">여기에 설명 적음</td></tr>
                            </table>
                            
                        </div>
                        <div class="sidebar-item tag-cloud">
                            <h3>안내사항</h3>
                            <p>
                            --위탁에 대한 안내사항 (고정)<br>
                            --위탁에 대한 안내사항 (고정)<br>
                            --위탁에 대한 안내사항 (고정)<br>
                            --위탁에 대한 안내사항 (고정)<br>
                            --위탁에 대한 안내사항 (고정)<br>
                            --위탁에 대한 안내사항 (고정)<br>
                            --위탁에 대한 안내사항 (고정)<br>
                            </p>
                        </div>
                        <div class="sidebar-item popular">
                            <h3>nth 정기 경매에 등록합니다.</h3>
                            <p>시작가:1000000000</p>
                            <p>한글 숫자 표시</p>
                            <p>단위:1000000000</p>
                            <p>한글 숫자 표시</p>
                            <button style="width:100%;" class="btn btn-lg btn-success">위탁 경매 승인</button>
                        </div>
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
