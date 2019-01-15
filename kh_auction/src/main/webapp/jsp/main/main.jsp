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
    <title>Home | Triangle</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="resources/css/animate.min.css" rel="stylesheet"> 
    <link href="resources/css/lightbox.css" rel="stylesheet"> 
	<link href="resources/css/main.css" rel="stylesheet">
	<link href="resources/css/responsive.css" rel="stylesheet">
	<link href="resources/_jin/main.css" rel="stylesheet">
   
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
    <section id="home-slider">
        <div class="container">
            <div class="main-slider">
                <div class="slide-text" style = "background:white;border-radius:30px;border:3px solid #d29948">
                    <h1 >&nbsp;&nbsp;&nbsp;정기 경매 안내</h1>
                    <p style="margin-left:40px;">(el식 날짜)에 정기 경매가 예정되어있습니다. <br>출품 경매 수 : (el식)</p>
                    <div style="text-align:center;margin-bottom:10px;"><a href="#" class="btn btn-common">상세보기</a></div>
                </div>
                <div id="home_slide_auc" class="img-responsive slider-house">여기서 정기경매 이미지를 띄웁니다. 여기 배경색을 없애주세요. 이미지는 슬라이드로 자동으로 넘어갑시다.</div>

                
            </div>
        </div>
        <div class="preloader"><i class="fa fa-sun-o fa-spin"></i></div>
    </section>
    <!--/#home-slider-->

    <section id="services" >
        <div class="container" id="hot_auction_cont">
        	<div id="hot_auction_title" class="wow fadeIn" data-wow-duration="300ms" data-wow-delay="300ms">
        		<h2 class="popular_auc"> 인기 경매 품목 </h2>
        	</div>
            <div class="row">
                <div class="col-sm-4 text-center padding wow fadeIn to_hots" data-wow-duration="1000ms" data-wow-delay="300ms">
                	<input type="hidden" name="item1" value="여기 el식 넣어서 상품번호 가지고있자.11111">
                    <div class="single-service">
                        <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="300ms">
                            <img src="resources/images/home/icon1.png" alt="">
                        </div>
                        <h2>경매 1 제목</h2>
                        <p>상품 1에 대한 설명이 쭈루루룩 적혀서 여기에 표현된다 다만 글자 제한이 있으며 넘칠경우 숨기던지 애초에 작게 받아오던지 해야한다.</p>
                    </div>
                </div>
                <div class="col-sm-4 text-center padding wow fadeIn to_hots" data-wow-duration="1000ms" data-wow-delay="600ms">
                	<input type="hidden" name="item2" value="여기 el식 넣어서 상품번호 가지고있자22222222.">
                    <div class="single-service">
                        <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="600ms">
                            <img src="resources/images/home/icon2.png" alt="">
                        </div>
                        <h2>경매2</h2>
                        <p>Hamburger ribeye drumstick turkey, strip steak sausage ground round shank pastrami beef brisket pancetta venison.</p>
                    </div>
                </div>
                <div class="col-sm-4 text-center padding wow fadeIn to_hots" data-wow-duration="1000ms" data-wow-delay="900ms">
                	<input type="hidden" name="item3" value="여기 el식 넣어서 상품번호 가지고있자.33333333">
                    <div class="single-service">
                        <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
                            <img src="resources/images/home/icon3.png" alt="">
                        </div>
                        <h2>경매3 만약에 제목이 길어지면어떻게되는?</h2>
                        <p>Venison tongue, salami corned beef ball tip meatloaf bacon. Fatback pork belly bresaola tenderloin bone pork kevin shankle.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#services-->

    <section id="action" class="responsive">
        <div class="vertical-center">
             <div class="container">
                <div class="row">
                    <div class="action take-tour">
                        <div class="col-sm-7 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                            <h1 class="title">믿을 수 있는 경매, <span class="kh">KH</span>와 함께하세요!</h1>
                            <p>Reliable, Trustworthy &amp; Invaluable</p>
                        </div>
                        <div class="col-sm-5 text-center wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                            <div class="tour-button">
                                <a href="jsp/main/#" class="btn btn-common">About us</a>
                             </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
    <!--/#action-->

    <section id="features">
        <div class="container">
            <div class="row">
                <div class="single-features">
                    <div class="col-sm-5 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                        <img src="resources/_jin/em.jpg" class="img-responsive" alt="">
                    </div>
                    <div class="col-sm-6 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                        <h2>Experienced and Trust</h2>
                        <P>전문적인 보안 요원과 투명한 경매 절차를 통해 신뢰와 공정성을 보장합니다.</P>
                    </div>
                </div>
                <div class="single-features">
                    <div class="col-sm-6 col-sm-offset-1 align-right wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                        <h2>Enthusiastic for the Money</h2>
                        <P>등급제를 통해 우수회원 선정 및 거래 혜택을 드립니다.</P>
                    </div>
                    <div class="col-sm-5 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                        <img src="resources/_jin/dia4.jpg" class="img-responsive" alt="">
                    </div>
                </div>
                <div class="single-features">
                    <div class="col-sm-5 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                        <img src="resources/_jin/everyone.png" class="img-responsive" alt="">
                    </div>
                    <div class="col-sm-6 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                        <h2>For everyone</h2>
                        <P>모든 사람들이 누구나 경매에 참여할 수 있습니다.</P>
                    </div>
                </div>
            </div>
        </div>
    </section>
     <!--/#features-->

    <section id="clients">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="clients text-center wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
                        <p><img src="resources/_jin/mc.jpg" class="img-responsive " alt=""></p>
                        <h1 class="title">위탁신청</h1>
                        <p>각 분야의 최고 전문가들이 검증합니다. 언제든 문의 주세요.</p>
                    </div>
                </div>
            </div>
        </div>
     </section>
    <!--/#clients-->

    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center bottom-separator">
                    <img src="resources/images/home/under.png" class="imgs inline" alt="">
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="testimonial bottom">
                        <h2>Testimonial</h2>
                        <div class="media">
                            <div class="pull-left">
                                <a href="jsp/main/#"><img src="resources/images/home/profile1.png" alt=""></a>
                            </div>
                            <div class="media-body">
                                <blockquote>Nisi commodo bresaola, leberkas venison eiusmod bacon occaecat labore tail.</blockquote>
                                <h3><a href="jsp/main/#">- Jhon Kalis</a></h3>
                            </div>
                         </div>
                    </div> 
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="contact-info bottom">
                        <h2>Contacts</h2>
                        <address>
                        E-mail: <a href="jsp/main/mailto:someone@example.com">email@email.com</a> <br> 
                        Phone: +1 (123) 456 7890 <br> 
                        Fax: +1 (123) 456 7891 <br> 
                        </address>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12">
                    <div class="contact-form bottom">
                        <h2>Address</h2>
                        <address>
                        Unit C2, St.Vincent's Trading Est., <br> 
                        Feeder Road, <br> 
                        Bristol, BS2 0UY <br> 
                        United Kingdom <br> 
                        </address>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="copyright-text text-center">
                        <p>&copy; KH AUCTION 2019. All Rights Reserved.</p>
                        <p>Designed by <a target="_blank" href="http://www.themeum.com">KH auction</a></p>
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
  	<script type="text/javascript" src="resources/_jin/main.js"></script>
</body>
</html>
