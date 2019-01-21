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
	                            		border-radius:20px;">위탁 신청하기</button>
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
                	<ul id="tab1" class="nav nav-tabs">
					    <li class="active"><a href="#" data-toggle="tab">전체 보기</a></li>
					    <li><a href="#" data-toggle="tab">감정 검토중</a></li>
					    <li><a href="#" data-toggle="tab">감정 진행중</a></li>
					    <li><a href="#" data-toggle="tab">위탁절차 진행중</a></li>
					    <li><a href="#" data-toggle="tab">위탁신청 완료</a></li>
		    		</ul><br>
                    <div class="row">
                         <div class="col-md-6 col-sm-12 blog-padding-right">
                            <div class="single-blog two-column">
                                <div class="post-thumb">
                                    <a href="jsp/main/blogdetails.jsp"><img src="resources/images/blog/timeline/1.jpg" class="img-responsive" alt=""></a>
                                    <div class="post-overlay">
                                        <span class="uppercase"><a href="jsp/main/#">14 <br><small>Feb</small></a></span>
                                    </div>
                                </div>
                                <div class="post-content overflow">
                                    <h2 class="post-title bold"><a href="jsp/main/blogdetails.jsp">it is First</a></h2>
                                    <h3 class="post-author"><a href="jsp/main/#">Posted by first</a></h3>
                                    <div style="height:90px; overflow:hidden;">here is first contents in hendrerit in vulputate velit esse molestie coere is first contents in hendrerit in vulputate velit [...]</div>
                                    <a href="jsp/main/#" class="read-more">View More</a>
                                    <div class="post-bottom overflow">
                                    <table style="width:100%;">
                                    	<tr>
                                    		<td><a href="jsp/main/#"><i class="fa fa-circle-o-notch fa-spin" style="color:#ff9800"></i> 검토중</a></td>
                                    		<td><a href="jsp/main/#"><i class="fa fa-circle-o-notch fa-spin" style="color:#ff9800"></i> 감정중</a></td>
                                    		<td><a href="jsp/main/#"><i class="fa fa-history" style="color:#ff9800"></i>진행 대기중</a></td>
                                    	</tr>
                                    	<tr>
                                    		<td><a href="jsp/main/#"><i class="fa fa-calendar-o"></i> 2019.01.21</a></td>
                                    		<td><a href="jsp/main/#"><i class="fa fa-calendar-o"></i> 2019.02.08</a></td>
                                    		<td><a href="jsp/main/#"><i class="fa fa-comments"></i> 3 Comments</a></td>
                                    	</tr>
                                    </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12 blog-padding-right">
                            <div class="single-blog two-column">
                                <div class="post-thumb">
                                    <a href="jsp/main/blogdetails.jsp"><img src="resources/images/blog/timeline/4.jpg" class="img-responsive" alt=""></a>
                                    <div class="post-overlay">
                                        <span class="uppercase"><a href="jsp/main/#">14 <br><small>Feb</small></a></span>
                                    </div>
                                </div>
                                <div class="post-content overflow">
                                    <h2 class="post-title bold"><a href="jsp/main/blogdetails.jsp">Advanced business cards design</a></h2>
                                    <h3 class="post-author"><a href="jsp/main/#">Posted by micron News</a></h3>
                                    <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber [...]</p>
                                    <a href="jsp/main/#" class="read-more">View More</a>
                                    <div class="post-bottom overflow">
                                        <table style="width:100%;">
	                                    	<tr>
	                                    		<td><a href="jsp/main/#"><i class="fa fa-check-square-o" style="color:green;"></i> 감정 승인</a></td>
	                                    		<td><a href="jsp/main/#"><i class="fa fa-circle-o-notch fa-spin" style="color:#ff9800"></i> 감정중</a></td>
	                                    		<td><a href="jsp/main/#"><i class="fa fa-star" style="color:#f5dc00;"></i> 위탁 완료</a></td>
	                                    	</tr>
	                                    	<tr>
	                                    		<td><a href="jsp/main/#"><i class="fa fa-calendar-o" style="margin-right:55px;"></i>.</a></td>
	                                    		<td><a href="jsp/main/#"><i class="fa fa-calendar-o" style="margin-right:55px;"></i>.</a></td>
	                                    		<td><a href="jsp/main/#"><i class="fa fa-comments"></i>3 Comments</a></td>
	                                    	</tr>
                                    	</table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12 blog-padding-right">
                            <div class="single-blog two-column">
                                <div class="post-thumb">
                                    <a href="jsp/main/blogdetails.jsp"><img src="resources/images/blog/timeline/5.jpg" class="img-responsive" alt=""></a>
                                    <div class="post-overlay">
                                        <span class="uppercase"><a href="jsp/main/#">14 <br><small>Feb</small></a></span>
                                    </div>
                                </div>
                                <div class="post-content overflow">
                                    <h2 class="post-title bold"><a href="jsp/main/blogdetails.jsp">Advanced business cards design</a></h2>
                                    <h3 class="post-author"><a href="jsp/main/#">Posted by micron News</a></h3>
                                    <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber [...]</p>
                                    <a href="jsp/main/#" class="read-more">View More</a>
                                    <div class="post-bottom overflow">
                                        <table style="width:100%;">
	                                    	<tr>
	                                    		<td><a href="jsp/main/#"><i class="fa fa-minus-square" style="color:red;"></i> 감정 불가</a></td>
	                                    		<td><a href="jsp/main/#"><i class="fa fa-history" style="color:#ff9800"></i> 진행 대기중</a></td>
	                                    		<td><a href="jsp/main/#"><i class="fa fa-history" style="color:#ff9800"></i> 진행 대기중</a></td>
	                                    	</tr>
	                                    	<tr>
	                                    		<td><a href="jsp/main/#"><i class="fa fa-calendar-o"></i> 2019.01.05</a></td>
	                                    		<td><a href="jsp/main/#"><i class="fa fa-calendar-o" style="margin-right:55px;"></i>.</a></td>
	                                    		<td><a href="jsp/main/#"><i class="fa fa-comments"></i> 3 Comments</a></td>
	                                    	</tr>
                                    	</table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12 blog-padding-right">
                            <div class="single-blog two-column">
                                <div class="post-thumb">
                                    <a href="jsp/main/blogdetails.jsp"><img src="resources/images/blog/timeline/6.jpg" class="img-responsive" alt=""></a>
                                    <div class="post-overlay">
                                        <span class="uppercase"><a href="jsp/main/#">14 <br><small>Feb</small></a></span>
                                    </div>
                                </div>
                                <div class="post-content overflow">
                                    <h2 class="post-title bold"><a href="jsp/main/blogdetails.jsp">Advanced business cards design</a></h2>
                                    <h3 class="post-author"><a href="jsp/main/#">Posted by micron News</a></h3>
                                    <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber [...]</p>
                                    <a href="jsp/main/#" class="read-more">View More</a>
                                    <div class="post-bottom overflow">
                                        
                                        <table style="width:100%;">
	                                    	<tr>
	                                    		<td><a href="jsp/main/#"><i class="fa fa-check-square-o" style="color:green;"></i> 감정 승인</a></td>
	                                    		<td><a href="jsp/main/#"><i class="fa fa-diamond" style="color:blue;"></i> 감정 완료</a></td>
	                                    		<td><a href="jsp/main/#"><i class="fa fa-star" style="color:#f5dc00;"></i> 위탁 완료</a></td>
	                                    	</tr>
	                                    	<tr>
	                                    		<td><a href="jsp/main/#"><i class="fa fa-calendar-o"></i> 2019.01.05</a></td>
	                                    		<td><a href="jsp/main/#"><i class="fa fa-calendar-o"></i> 2019.01.21</a></td>
	                                    		<td><a href="jsp/main/#"><i class="fa fa-comments"></i> 3 Comments</a></td>
	                                    	</tr>
                                    	</table>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12 blog-padding-right">
                            <div class="single-blog two-column">
                                <div class="post-thumb">
                                    <a href="jsp/main/blogdetails.jsp"><img src="resources/images/blog/timeline/3.jpg" class="img-responsive" alt=""></a>
                                    <div class="post-overlay">
                                        <span class="uppercase"><a href="jsp/main/#">14 <br><small>Feb</small></a></span>
                                    </div>
                                </div>
                                <div class="post-content overflow">
                                    <h2 class="post-title bold"><a href="jsp/main/blogdetails.jsp">Advanced business cards design</a></h2>
                                    <h3 class="post-author"><a href="jsp/main/#">Posted by micron News</a></h3>
                                    <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber [...]</p>
                                    <a href="jsp/main/#" class="read-more">View More</a>
                                    <div class="post-bottom overflow">
                                        <ul class="nav nav-justified post-nav">
                                            <li><a href="jsp/main/#"><i class="fa fa-tag"></i>Creative</a></li>
                                            <li><a href="jsp/main/#"><i class="fa fa-heart"></i>32 Love</a></li>
                                            <li><a href="jsp/main/#"><i class="fa fa-comments"></i>3 Comments</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="col-md-6 col-sm-12 blog-padding-right">
                            <div class="single-blog two-column">
                                <div class="post-thumb">
                                    <a href="jsp/main/blogdetails.jsp"><img src="resources/images/blog/timeline/2.jpg" class="img-responsive" alt=""></a>
                                    <div class="post-overlay">
                                        <span class="uppercase"><a href="jsp/main/#">14 <br><small>Feb</small></a></span>
                                    </div>
                                </div>
                                <div class="post-content overflow">
                                    <h2 class="post-title bold"><a href="jsp/main/blogdetails.jsp">Advanced business cards design</a></h2>
                                    <h3 class="post-author"><a href="jsp/main/#">Posted by micron News</a></h3>
                                    <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber [...]</p>
                                    <a href="jsp/main/#" class="read-more">View More</a>
                                    <div class="post-bottom overflow">
                                        <ul class="nav nav-justified post-nav">
                                            <li><a href="jsp/main/#"><i class="fa fa-tag"></i>Creative</a></li>
                                            <li><a href="jsp/main/#"><i class="fa fa-heart"></i>32 Love</a></li>
                                            <li><a href="jsp/main/#"><i class="fa fa-comments"></i>3 Comments</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="blog-pagination">
                        <ul class="pagination">
                          <li><a href="jsp/main/#">left</a></li>
                          <li><a href="jsp/main/#">1</a></li>
                          <li><a href="jsp/main/#">2</a></li>
                          <li class="active"><a href="jsp/main/#">3</a></li>
                          <li><a href="jsp/main/#">4</a></li>
                          <li><a href="jsp/main/#">5</a></li>
                          <li><a href="jsp/main/#">6</a></li>
                          <li><a href="jsp/main/#">7</a></li>
                          <li><a href="jsp/main/#">8</a></li>
                          <li><a href="jsp/main/#">9</a></li>
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
