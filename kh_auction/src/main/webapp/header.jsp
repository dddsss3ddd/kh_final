<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           
<header id="header">      
    <div class="container">
        <div class="row">
            <div class="col-sm-12 overflow">
               <div class="social-icons pull-right">
                    <ul class="nav nav-pills">
                        <li><a href="jsp/main/"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="jsp/main/"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="jsp/main/"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="jsp/main/"><i class="fa fa-dribbble"></i></a></li>
                        <li><a href="jsp/main/"><i class="fa fa-linkedin"></i></a></li>
                    </ul>
                </div> 
            </div>
         </div>
    </div>
    <div class="navbar navbar-inverse" role="banner">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <a class="navbar-brand" href="main.hh">
                	<h1><img src="resources/images/logo.png" alt="logo"></h1>
                </a>
                
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="main.hh">Home</a></li>
                    <li class="dropdown"><a href="jsp/main/#">Auction! <i class="fa fa-angle-down"></i></a>
                        <ul role="menu" class="sub-menu">
	                        <li><a href="sejin_in.hh">정기 경매</a></li>
                            <li><a href="jsp/main/aboutus.jsp">실시간 경매</a></li>
                            <li><a href="jsp/main/aboutus2.jsp">깜깜이 경매</a></li>
                            <li><a href="jsp/main/pricing.jsp">경매 검색</a></li>
                            <li><a href="auction_upload.hh">경매 등록</a></li>
                        </ul>
                    </li>                  
                    <li class="dropdown"><a href="jsp/main/blog.jsp">고객센터 <i class="fa fa-angle-down"></i></a>
                        <ul role="menu" class="sub-menu">
                            <li><a href="FAQ.hh">FAQ</a></li>
                            <li><a href="jsp/main/blogtwo.jsp">QNA</a></li>
                            <li><a href="cons_list.hh">경매위탁</a></li>
                            <li><a href="jsp/main/blogthree.jsp">공지사항</a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="jsp/main/portfolio.jsp">My Info <i class="fa fa-angle-down"></i></a>
                        <ul role="menu" class="sub-menu">
                            <li><a href="jsp/main/portfolio.jsp">My page</a></li>
                            <li><a href="jsp/main/portfoliofour.jsp">캐쉬  충전</a></li>
                            <li><a href="jsp/main/portfolioone.jsp">거래이력 보기</a></li>
                            <li><a href="jsp/main/portfoliotwo.jsp">환전하기</a></li>
                        </ul>
                    </li>                         
                    <li><a href="#">관리자 메뉴</a></li>                    
                </ul>
            </div>
            <div class="search">
                <form role="form">
                    <i class="fa fa-search"></i>
                    <div class="field-toggle">
                        <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                    </div>
                </form>
            </div>
        </div>
    </div>
</header>