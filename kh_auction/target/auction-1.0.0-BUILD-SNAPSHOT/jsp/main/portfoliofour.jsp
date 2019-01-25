<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Portfolio Three Columns | Triangle</title>
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
                            <h1 class="title">Portfolio</h1>
                            <p>Be Creative</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
    <!--/#page-breadcrumb-->

    <section id="projects">
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-8">
                    <div class="row">
                        <ul class="portfolio-filter text-center">
                            <li><a class="btn btn-default active" href="#" data-filter="*">All</a></li>
                            <li><a class="btn btn-default" href="#" data-filter=".branded">Branded</a></li>
                            <li><a class="btn btn-default" href="#" data-filter=".design">Design</a></li>
                            <li><a class="btn btn-default" href="#" data-filter=".folio">Folio</a></li>
                            <li><a class="btn btn-default" href="#" data-filter=".logos">Logos</a></li>
                            <li><a class="btn btn-default" href="#" data-filter=".mobile">Mobile</a></li>
                            <li><a class="btn btn-default" href="#" data-filter=".mockup">Mockup</a></li>
                        </ul><!--/#portfolio-filter-->
                        
                        <div class="portfolio-items">
                            <div class="col-xs-6 col-sm-6 col-md-4 portfolio-item branded logos">
                                <div class="portfolio-wrapper">
                                    <div class="portfolio-single">
                                        <div class="portfolio-thumb">
                                            <img src="resources/images/portfolio/1.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="portfolio-view">
                                            <ul class="nav nav-pills">
                                                <li><a href="jsp/main/portfolio-details.jsp"><i class="fa fa-link"></i></a></li>
                                                <li><a href="jsp/main/resources/images/portfolio/1.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="portfolio-info ">
                                        <h2>Sailing Vivamus</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 portfolio-item mockup folio">
                                <div class="portfolio-wrapper">
                                    <div class="portfolio-single">
                                        <div class="portfolio-thumb">
                                            <img src="resources/images/portfolio/2.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="portfolio-view">
                                            <ul class="nav nav-pills">
                                                <li><a href="jsp/main/portfolio-details.jsp"><i class="fa fa-link"></i></a></li>
                                                <li><a href="jsp/main/resources/images/portfolio/2.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="portfolio-info ">
                                        <h2>Sailing Vivamus</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 portfolio-item design logos">
                                <div class="portfolio-wrapper">
                                    <div class="portfolio-single">
                                        <div class="portfolio-thumb">
                                            <img src="resources/images/portfolio/3.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="portfolio-view">
                                            <ul class="nav nav-pills">
                                                <li><a href="jsp/main/portfolio-details.jsp"><i class="fa fa-link"></i></a></li>
                                                <li><a href="jsp/main/resources/images/portfolio/3.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="portfolio-info ">
                                        <h2>Sailing Vivamus</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 portfolio-item design logos">
                                <div class="portfolio-wrapper">
                                    <div class="portfolio-single">
                                        <div class="portfolio-thumb">
                                            <img src="resources/images/portfolio/4.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="portfolio-view">
                                            <ul class="nav nav-pills">
                                                <li><a href="jsp/main/portfolio-details.jsp"><i class="fa fa-link"></i></a></li>
                                                <li><a href="jsp/main/resources/images/portfolio/4.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="portfolio-info ">
                                        <h2>Sailing Vivamus</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 portfolio-item branded mobile">
                                <div class="portfolio-wrapper">
                                    <div class="portfolio-single">
                                        <div class="portfolio-thumb">
                                            <img src="resources/images/portfolio/5.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="portfolio-view">
                                            <ul class="nav nav-pills">
                                                <li><a href="jsp/main/portfolio-details.jsp"><i class="fa fa-link"></i></a></li>
                                                <li><a href="jsp/main/resources/images/portfolio/5.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="portfolio-info ">
                                        <h2>Sailing Vivamus</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 portfolio-item branded mockup">
                                <div class="portfolio-wrapper">
                                    <div class="portfolio-single">
                                        <div class="portfolio-thumb">
                                            <img src="resources/images/portfolio/6.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="portfolio-view">
                                            <ul class="nav nav-pills">
                                                <li><a href="jsp/main/portfolio-details.jsp"><i class="fa fa-link"></i></a></li>
                                                <li><a href="jsp/main/resources/images/portfolio/6.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="portfolio-info ">
                                        <h2>Sailing Vivamus</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 portfolio-item branded folio">
                                <div class="portfolio-wrapper">
                                    <div class="portfolio-single">
                                        <div class="portfolio-thumb">
                                            <img src="resources/images/portfolio/7.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="portfolio-view">
                                            <ul class="nav nav-pills">
                                                <li><a href="jsp/main/portfolio-details.jsp"><i class="fa fa-link"></i></a></li>
                                                <li><a href="jsp/main/resources/images/portfolio/7.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="portfolio-info ">
                                        <h2>Sailing Vivamus</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 portfolio-item design logos">
                                <div class="portfolio-wrapper">
                                    <div class="portfolio-single">
                                        <div class="portfolio-thumb">
                                            <img src="resources/images/portfolio/8.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="portfolio-view">
                                            <ul class="nav nav-pills">
                                                <li><a href="jsp/main/portfolio-details.jsp"><i class="fa fa-link"></i></a></li>
                                                <li><a href="jsp/main/resources/images/portfolio/8.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="portfolio-info ">
                                        <h2>Sailing Vivamus</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 portfolio-item mobile logos">
                                <div class="portfolio-wrapper">
                                    <div class="portfolio-single">
                                        <div class="portfolio-thumb">
                                            <img src="resources/images/portfolio/9.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="portfolio-view">
                                            <ul class="nav nav-pills">
                                                <li><a href="jsp/main/portfolio-details.jsp"><i class="fa fa-link"></i></a></li>
                                                <li><a href="jsp/main/resources/images/portfolio/9.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="portfolio-info ">
                                        <h2>Sailing Vivamus</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="portfolio-pagination">
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
                <div class="col-md-3 col-sm-4 padding-top">
                    <div class="sidebar portfolio-sidebar">
                        <div class="sidebar-item categories">
                            <h3>Project Categories</h3>
                            <ul class="nav navbar-stacked">
                                <li><a href="jsp/main/#">Branded<span class="pull-right">(1)</span></a></li>
                                <li class="active"><a href="jsp/main/#">Design<span class="pull-right">(8)</span></a></li>
                                <li><a href="jsp/main/#">Folio<span class="pull-right">(4)</span></a></li>
                                <li><a href="jsp/main/#">Logos<span class="pull-right">(9)</span></a></li>
                                <li><a href="jsp/main/#">Mobile<span class="pull-right">(3)</span></a></li>
                                <li><a href="jsp/main/#">Mockup<span class="pull-right">(4)</span></a></li>
                                <li><a href="jsp/main/#">Php<span class="pull-right">(2)</span></a></li>
                                <li><a href="jsp/main/#">Wordpress<span class="pull-right">(8)</span></a></li>
                            </ul>
                        </div>
                        <div class="sidebar-item  recent">
                            <h3>Recent Projects</h3>
                            <div class="media">
                                <div class="pull-left">
                                    <a href="jsp/main/#"><img src="resources/images/portfolio/project1.jpg" alt=""></a>
                                </div>
                                <div class="media-body">
                                    <h4><a href="jsp/main/#">Lorem ipsum dolor sit amet consectetur adipisicing elit,</a></h4>
                                    <p>posted on  07 March 2014</p>
                                </div>
                            </div>
                            <div class="media">
                                <div class="pull-left">
                                    <a href="jsp/main/#"><img src="resources/images/portfolio/project2.jpg" alt=""></a>
                                </div>
                                <div class="media-body">
                                    <h4><a href="jsp/main/#">Lorem ipsum dolor sit amet consectetur adipisicing elit,</a></h4>
                                    <p>posted on  07 March 2014</p>
                                </div>
                            </div>
                            <div class="media">
                                <div class="pull-left">
                                    <a href="jsp/main/#"><img src="resources/images/portfolio/project3.jpg" alt=""></a>
                                </div>
                                <div class="media-body">
                                    <h4><a href="jsp/main/#">Lorem ipsum dolor sit amet consectetur adipisicing elit,</a></h4>
                                    <p>posted on  07 March 2014</p>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar-item popular">
                            <h3>Popular Projects</h3>
                            <ul class="gallery">
                                <li><a href="jsp/main/#"><img src="resources/images/portfolio/popular1.jpg" alt=""></a></li>
                                <li><a href="jsp/main/#"><img src="resources/images/portfolio/popular2.jpg" alt=""></a></li>
                                <li><a href="jsp/main/#"><img src="resources/images/portfolio/popular3.jpg" alt=""></a></li>
                                <li><a href="jsp/main/#"><img src="resources/images/portfolio/popular4.jpg" alt=""></a></li>
                                <li><a href="jsp/main/#"><img src="resources/images/portfolio/popular5.jpg" alt=""></a></li>
                                <li><a href="jsp/main/#"><img src="resources/images/portfolio/popular1.jpg" alt=""></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#projects-->


    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center bottom-separator">
                    <img src="resources/images/home/under.png" class="img-responsive inline" alt="">
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
                        <div class="media">
                            <div class="pull-left">
                                <a href="jsp/main/#"><img src="resources/images/home/profile2.png" alt=""></a>
                            </div>
                            <div class="media-body">
                                <blockquote>Capicola nisi flank sed minim sunt aliqua rump pancetta leberkas venison eiusmod.</blockquote>
                                <h3><a href="jsp/main/">- Abraham Josef</a></h3>
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

                        <h2>Address</h2>
                        <address>
                        Unit C2, St.Vincent's Trading Est., <br> 
                        Feeder Road, <br> 
                        Bristol, BS2 0UY <br> 
                        United Kingdom <br> 
                        </address>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12">
                    <div class="contact-form bottom">
                        <h2>Send a message</h2>
                        <form id="main-contact-form" name="contact-form" method="post" action="sendemail.php">
                            <div class="form-group">
                                <input type="text" name="name" class="form-control" required="required" placeholder="Name">
                            </div>
                            <div class="form-group">
                                <input type="email" name="email" class="form-control" required="required" placeholder="Email Id">
                            </div>
                            <div class="form-group">
                                <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Your text here"></textarea>
                            </div>                        
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-submit" value="Submit">
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="copyright-text text-center">
                        <p>&copy; Your Company 2014. All Rights Reserved.</p>
                        <p>Designed by <a target="_blank" href="http://www.themeum.com">Themeum</a></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--/#footer-->


    <script type="text/javascript" src="resources/js/jquery.js"></script>
    <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resources/js/jquery.isotope.min.js"></script>
    <script type="text/javascript" src="resources/js/lightbox.min.js"></script>
    <script type="text/javascript" src="resources/js/wow.min.js"></script>
    <script type="text/javascript" src="resources/js/main.js"></script>  
</body>
</html>
