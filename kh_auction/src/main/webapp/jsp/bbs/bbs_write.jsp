<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 입력 폼</title>
<link rel="stylesheet" type = "text/css" href="./resources/css/bbs.css">
<link rel="stylesheet" type = "text/css" href="./resources/css/admin.css">
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/bbs.js"></script>

</head>
<body>
  <div id ="bbswrite_wrap">
    <h2 class = "bbswrite_title">자료실 입력 폼</h2>
    <form method ="post" action="bbs_write_ok.nhn" onsubmit="return check()" enctype="multipart/form-data">
      <table id="bbswrite_t">
        <tr>
          <th>글쓴이</th>
          <td><input name="bbs_name" id="bbs_name" size="14" class="input_box"></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="bbs_pass" id="bbs_pass" size="14" class="input_box"></td>
        </tr>
        <tr>
          <th>글제목</th>
          <td><input name="bbs_subject" id="bbs_subject" size="40" class="input_box"></td>
        </tr>
        <tr>
          <th>글내용</th>
          <td><textarea name="bbs_content" id="bbs_content" rows="8" cols="50" class="input_box"></textarea>
        </tr>
        <tr>
          <th>파일첨부</th>
          <td>
            <label for="upfile">
              <img src="resources/images/file_open.png" alt="파일열기">
            </label>
            <input type="file" id="upfile" name="uploadfile">
            <span id="filevalue"></span>&nbsp;
            <span id="close"><img src="resources/images/cancel.png"></span>
          </td>
        </tr>
      </table>
      
      <div id="bbswrite_menu">
        <input type="submit" value="등록" class="input_button">
        <input type="reset" value="취소" class="input_button" onclick="$('#bbs_name').focus();" >
      </div>
    </form>
  </div>
</body>
</html>