<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>

<!Doctype html>
<html>
<head>
	<title>게시판 목록</title>
	<style>
	tr:hover{background:#FFF8F8}
	 td{font-family: Tahoma; font-size:10pt;height:26px}
	 div, .center{text-align:center}
	 tr:nth-child(1){font-size: 12pt; height:26px;text-align:center}
	 td:nth-child(1){width:8%}
	 td:nth-child(2){width:50%}
	 td:nth-child(3){width:14%}
	 td:nth-child(4){width:19%}
	 td:nth-child(5){width:13%}
	</style>
    <link rel="stylesheet" href="./resources/css/bbs.css" 
          type="text/css"> 
</head>

<body>
 <!-- 게시판 리스트 -->
 <div id="bbslist_wrap">
  <h2 class="bbslist_title">게시판 목록</h2>
	<div id="bbslist_c">글 개수 : ${listcount}</div>
 	 <table id="bbslist_t">
	  <tr>
		<td>
			<div>번호</div>
		</td>
		<td>
			<div>제목</div>
		</td>
		<td >
			<div>작성자</div>
		</td>
		<td>
			<div>날짜</div>
		</td>
		<td>
			<div>조회수</div>
		</td>
	  </tr>

	  <!-- 화면 출력 번호  변수 정의 -->		
	  <c:set var="num" value="${listcount-(page-1)*10}"/> 	
      <!-- 반복문 시작 -->
	  <c:forEach var="b" items="${bbslist}">
			<tr>
			<td>					
 			  <!-- 번호 출력 부분 -->	
 			  <c:out value="${num}"/>			
			  <c:set var="num" value="${num-1}"/>	 
			</td>
				
			<td>
			  <div style="text-align:left">						
				<c:if test="${b.bbs_re_lev != 0}"> 
				   <c:forEach var="k" begin="1" 
				              end="${b.bbs_re_lev}">
					  &nbsp;&nbsp;			
				   </c:forEach>
				   <img src="./resources/images/AnswerLine.gif">	
				</c:if>					
						
				<!-- 제목 출력 부분 -->	
				<a href="bbs_cont.nhn?bbs_num=${b.bbs_num}&page=${page}&state=cont">
							${b.bbs_subject}
				</a>
			  </div>
			</td>

			<td>
			  <div>${b.bbs_name}</div>
			</td>
			<td>
			  <div>${b.bbs_date}</div>
			</td>
			<td>
			  <div>${b.bbs_readcount}</div>
			</td>
		 </tr>
	   </c:forEach>
	   <!-- 반복문 끝 -->			
	 </table>		

	 <div style="margin-left:0px;margin-top:20px" >			
		<c:if test="${page <=1 }">
				[이전]&nbsp;
		</c:if>
			
		<c:if test="${page > 1 }">
			<a href="bbs_list.nhn?page=${page-1}">[이전]</a>&nbsp;
		</c:if>			

		<c:forEach var="a" begin="${startpage}" end="${endpage}">
		  <c:if test="${a == page }">
					[${a}]
		  </c:if>
		  <c:if test="${a != page }">
			 <a href="bbs_list.nhn?page=${a}">[${a}]</a>&nbsp;
		  </c:if>
		</c:forEach>			
		
		<c:if test="${page >= maxpage }">
				[다음] 
		</c:if>
		<c:if test="${page < maxpage }">
			<a href="bbs_list.nhn?page=${page+1}">[다음]</a>
		</c:if>			
	 </div>
	 <div id="bbslist_w">
	  <input type="button" value="글쓰기" class="input_button"
		 	 onclick="location='bbs_write.nhn'">
	 </div>
   </div>
 </body>
</html>