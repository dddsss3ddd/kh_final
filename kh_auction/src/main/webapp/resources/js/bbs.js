$(function(){
	$("#close").hide();
	
	$("#upfile").on("change",function(){
		var fileinfo =$("#upfile").val().split("\\");
		var info_len = $("#upfile").val().split("\\").length;
		$("span#filevalue").text(fileinfo[info_len-1]);
		$("#close").show();
	});
	$("#close").on("click",function(){
		$("#upfile").val("");
		$("#close").hide();
	});
});

function check(){
	if($.trim($("#bbs_name").val())==""){
		alert("글쓴이를 입력하세요!");
		$("#bbs_name").val("").focus();
		return false;
	}
	if($.trim($("#bbs_pass").val())==""){
		alert("암호를 입력하세요!");
		$("#bbs_pass").val("").focus();
		return false;
	}
	if($.trim($("#bbs_subject").val())==""){
		alert("insert subject!");
		$("#bbs_subject").val("").focus();
		return false;
	}
	if($.trim($("#bbs_content").val())==""){
		alert("insert content!");
		$("#bbs_content").val("").focus();
		return false;
	}
};