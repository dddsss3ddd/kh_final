<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="./resources/css/bbs.css" 
          type="text/css"> 

</head>
<body>
<div id="bbscont_wrap" style="width:600px">
	<h2 class="bbscont_title" style="width:370px">
		게시물 내용보기</h2>
	<table id="bbscont_t">
		<tr>
			<th>제목</th>
			<td>${bcont.bbs_subject}</td>
		</tr>
		
		<tr>
			 <th>글내용</th>
			 <td>
			 	<textarea rows="8" cols="50" readOnly> ${bcont.bbs_content}</textarea>
			 </td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td><a href="./resources/upload${bcont.bbs_file}" >${bcont.bbs_original}</a></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>
			${bcont.bbs_readcount}
			</td>
			 <!-- <pre>태그로 입력한 그대로 출력되게 합니다.엔터도 잘나옵니다. -->	
		</tr>
	</table>
		<div id="bbscont_menu" style="margin-left:200px">
			<input type="button" value="수정" class="input_button"
				onclick="location='bbs_cont.nhn?bbs_num=${bcont.bbs_num}&page=${page}&state=edit'">
			
			<input type="button" value="삭제" class="input_button"
				onclick="location='bbs_cont.nhn?bbs_num=${bcont.bbs_num}&page=${page}&state=del'">
			
			<input type="button" value="답변" class="input_button"
				onclick="location='bbs_cont.nhn?bbs_num=${bcont.bbs_num}&page=${page}&state=reply'">	
			
			<input type="button" value="목록" class="input_button"
				onclick="location='bbs_list.nhn?page=${page}'">
		</div>
	</div>
</body>
</html>