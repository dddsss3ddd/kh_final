<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script>
<script>
$(function(){
	$('#meme').submit(function(e){
		
		var senddata = $(this).serialize();
		alert(senddata);
		selectData(senddata);
		
		e.preventDefault();
	});
});
function selectData(senddata){
$.ajax({
	url : './sejin.hh',
	data : senddata,
	dataType : 'json',
	type : 'POST',
	cache : false,
	success : function(responsedata){
		$('#append_me').append(responsedata.hval1+responsedata.hval2);
		alert(responsedata);
		alert(responsedata.hval1);
	},
	error : function(request, status, error){
    	 console.log("code :" + request.status  
    			     + "\n 받은 데이터 :" + request.responseText 
    			     + "\n error status : " + status
    	             + "\n error 메시지 : " + error);}
});
}
</script>
</head>
<body>
<h1>han test 아무 번호나 입력해보자</h1>
<form action="sejin.hh" method = "post" id="meme">
<input type="text" name="hval1">
<input type="text" name="hval2">
<button type="submit">gogo</button>
</form>
<div id="append_me">
</div>
</body>
</html>