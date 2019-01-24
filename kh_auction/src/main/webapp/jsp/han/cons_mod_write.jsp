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
                            <h1 class="title">위탁 수정하기</h1>
                            <p>각 분야의 전문가들이 검증합니다.</p>
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
                <div class="col-md-12">
                    <div class="row">
                         <div class="col-md-12 col-sm-12">
                            <div class="single-blog blog-details two-column">
                            
                            
                            
                            <form method="post" action="cons_mod_ok.hh" enctype="multipart/form-data">
                            <input type="radio" class="img_control" name="img_control" id="img_no_change" value="img_no_change" checked><label for="img_no_change" >이미지 그대로 사용</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" class="img_control" name="img_control" id="img_change" value="img_change"><label for="img_change">이미지 변경</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" class="img_control" name="img_control" id="img_add" value="img_add"><label for="img_add">이미지 추가</label>
                            <input type="hidden" name="cons_img1" value="${cons.cons_img1}"><input type="hidden" name="cons_img2" value="${cons.cons_img2}">
                            <br>
                            <span class="reimg_up">아래 네모에 이미지를 드래그해 넣거나 클릭하여 추가하세요.</span>
                                <input multiple="multiple" type="file" style="overflow-y:auto; height:100px;width:100%;white-space:nowrap;
                                			height:200px;text-align:center;font-size:20px;color:gray;
                                			vertical-align:middle;border:1px dotted gray;" id="img_up"
                                			name="cons_img" class="reimg_up" required>
                                			
								<div style="overflow-y:auto; height:100px;white-space:nowrap;
                                			height:150px;font-size:20px;color:gray;
                                			vertical-align:middle;border:1px dotted gray;overflow:auto;"
                                			class="sample_view reimg_up">
								</div>
                                <div class="post-content overflow">
                                <input type="text" class="form-control" placeholder="제목을 입력해주세요." 
                                name="cons_title" value="${cons.cons_title}" required>
                                    <textarea class="form-control"  rows="10" cols="60" placeholder="내용을 입력해주세요." 
                                    name="cons_content" required>${cons.cons_content })</textarea>
                                    <input type="checkbox" id="gua_check" name="cons_gua" value="yes" 
                                    <c:if test="${cons.cons_gua eq 'yes' }">
                                    	checked
                                    </c:if>
                                    >보증서 있음<br>
                                    <div id="gua_container">
                                    <textarea class="form-control" rows="5" cols="60" placeholder="보증서 정보를 입력해주세요."
                                    name="gua_info">${cons.gua_info}</textarea>
                                    </div><hr>
                                    <input  class="form-control" style="height:100px;font-size:50px;text-align:center;"
                                    type="number" min="0" max="999999999999" placeholder="희망가를 입력해주세요." id="auc_price" name="cons_price"
                                    value="${cons.cons_price }"
                                    ><br>
                                    <div style="text-align:center;font-size:30px; height:50px;">
                                    <span id="korstart"></span>원
                                    </div>
                                        <button style="width:100%;color: #fff;background-color: #f0ad4e;border-color: #eea236;
                                        padding: 10px 16px;font-size: 18px;line-height: 1.3333333;border-radius: 6px;" type="submit">위탁 내용 수정</button>
                                    <br>
                                </div>
                            </form>
                            </div>
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
    <script type="text/javascript" src="resources/_jin/cons_mod_write.js"></script>
</body>
</html>
