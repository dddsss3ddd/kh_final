$(function(){
	$('#small_imgs').children('img').first()
									.css('background',' #a5732a')
									.css('padding','10px');
	$('.price').each(function(){
		kor_conv(this);
	});

	
	$('.smalls').on('click',function(){
		var imgsrc=$(this).prop('src');
		$('#large_img').prop('src',imgsrc);
		$('.smalls').css('padding','0px').css('background','white');
		$(this).css('padding','10px').css('background','#a5732a');
	});

	
$('.blog-sidebar').on('click','button',function(){
		
		var up_info = "";
		up_info+='cons_no='+$('#cons_no').val();
		var message = ' ';
		up_info+='&button_info='+$(this).val();
		//감정 승인 or 거절
		if($(this).hasClass('identify')){
			message += '감정신청을 ';
			if($(this).val()=='indentify_accept') {
				message += '승인';
				up_info+='&cons_result1=accept';
			}else {
				message += '거절';
				up_info+='&cons_result1=deny';
			}
		}
		var empty_space = "";
		
		//감정 승인이후의 사용자 날짜시간 선택
		if($(this).hasClass('identify_date')){ //각각이 비어있는지 아닌지 확인해야함. 아직 안함.
			up_info+='&cons_go_date='+$('#cons_go_date').val();
			if($('#cons_go_date').val() == "" || $('#cons_go_date').val() ==null) empty_space = '#cons_go_date';
			up_info+='&cons_go_time_f='+$('#i_s_time').val();
			if($('#i_s_time').val() == "" || $('#i_s_time').val() == null) empty_space = '#i_s_time';
			up_info+='&cons_go_time_t='+$('#i_e_time').val();
			if($('#i_e_time').val() == "" ||$('#i_e_time').val() ==  null) empty_space = '#i_e_time';
			
			message += '감정 신청 날짜를 입력';
		}
		
		//해당 시간에 방문/파견 을 통해 감정후 추정 예상가 입력
		if($(this).hasClass('identify_result')){
			up_info+='&cons_ant_price='+$('#values_').val();
			if($('#values_').val() == "" || $('#values_').val() == null) empty_space = '#values_';
			up_info+='&cons_ans='+$('#values_info').val();
			if($('#values_info').val() == "" || $('#values_info').val() == null) empty_space = '#values_info';
			
			message += '추정 가격을 입력';
		}
		
		//추정가 업데이트
		if($(this).hasClass('identify_update')){
			up_info+='&identify_update='+$('#identify_update').val();
			up_info+='&cons_ant_price='+$('#values_').val();
			if($('#values_').val() == "" || $('#values_').val() == null) empty_space = '#values_';
			up_info+='&cons_ans='+$('#values_info').val();
			if($('#values_info').val() == "" || $('#values_info').val() == null) empty_space = '#values_info';
			
			message += '새로운 추정 가격을 입력';
		}
		
		//위탁을 신청하기
		if($(this).hasClass('consignment')){
			up_info+='&auc_price='+$('#auc_price').val();
			if($('#auc_price').val() == "" || $('#auc_price').val() == null) empty_space = '#auc_price';
			up_info+='&auc_interval='+$('#auc_interval').val();
			if($('#auc_interval').val() == "" || $('#auc_interval').val() == null) empty_space = '#auc_interval';
			
			message += '위탁 신청을 ';
			if($(this).val() == 'cons_accept') {
				message += '확정';
				up_info+='&cons_commit=accept';
			}else {
				message += '취소';
				up_info+='&cons_commit=deny';
			}
		}
		
		message += '하시겠습니까?';
		
		var conf_result = confirm(message);

		alert("what is empty?"+empty_space+conf_result);
		
		if(empty_space != "" && conf_result ){
			$(empty_space).focus();
		}else if(conf_result){
			alert('ajax 시작');
			
			//var senddata=JSON.stringify(up_info);
			var senddata=up_info;
			alert(senddata);
			//여기서 ajax 호출 아이콘,사이드바 둘다 호출해야함.
			$.ajax({
				url : './cons_detail_upgrade.hh',
				data : senddata,
				dataType : 'json',
				type : 'POST',
				cache : false,
				success : function(responsedata){
					alert(responsedata)
					//json 형식으로 받아온 값에 대하여.
					//1. 오른쪽 사이드바를 먼저 갱신한다.
					history.go(0);
					
				},
				error : function(request, status, error){
		        	 console.log("code :" + request.status  
		        			     + "\n 받은 데이터 :" + request.responseText 
		        			     + "\n error status : " + status
		        	             + "\n error 메시지 : " + error);}
			});
		}
	});
	
	
	//이거 ajax 사용가능하게 수정해야함.
	$('.price').on('keyup',function(){
		kor_conv(this);
	});
	
	$('.cons_mod').on('click',function(){
		location.href='cons_mod.hh?cons_no='+$('#cons_no').val();
	});
	
	$('.cons_del').on('click',function(){
		var delis = confirm('게시글이 삭제됩니다. 계속 하시겠습니까?');
		if(delis) {
			var cons_no_is=$('#cons_no').val();
			$.post(
				'cons_del.hh' ,
				{"cons_no":cons_no_is},
				function(data){
					if(data=='deleted'){
						alert('게시물이 삭제되었습니다.');
						history.back();
					}else{
						alert('게시물을 삭제할 수 없습니다.');
					}
				},
				'text'
			)
		}
	});
});

function kor_conv(inval){
	var maxval=9999999999;
	var selector = '';
	
	if($(inval).hasClass('price')){
		if($(inval).hasClass('pstart')) maxval=999999999999;
		selector='.start_kor';
		if($(inval).hasClass('pstart')) selector+='.pstart';
		else selector+='.pinter';
		if($(inval).hasClass('antp')) selector+='.antp';
		else selector+='.wantp';
			
		if($(inval).val()<0 || $(inval).val() > maxval){
			$(inval).val('0');
			var temp_comma = '9,999,999,999';
			if(maxval==999999999999) temp_comma = '999,999,999,999';
			alert("희망가격은 0(미정) ~ "+temp_comma+" 값이어야합니다.");
			
			$(selector).empty()
					   .append('영')
					   .css('color','red');
		}else {
			$(inval).val(Math.floor($(inval).val()));
			num_to_kor(inval,selector);
		}
	}
}

function num_to_kor($input_money,selector){
	var korstart = $($input_money).val().replace(/1/g,'일')
	   .replace(/2/g,'이')
	   .replace(/3/g,'삼')
	   .replace(/4/g,'사')
	   .replace(/5/g,'오')
	   .replace(/6/g,'육')
	   .replace(/7/g,'칠')
	   .replace(/8/g,'팔')
	   .replace(/9/g,'구')
	   .replace(/0/g,'영');
	var len=korstart.length;
	var regexp = /영천|영백|영십/g;
	if(korstart.length>=9 && korstart.substr(len-8,4)=='영영영영'){
	regexp = /영만|영천|영백|영십/g;
	}
	for(let i =0; i<len; i++){
		var danw=i%4;
		if(danw==0){
			if(i==8){
				korstart = korstart.substr(0,len-i)+'억 '+korstart.substr(len-i);
			}else if(i==4){
				korstart = korstart.substr(0,len-i)+'만 '+korstart.substr(len-i);
			}
		}else if(danw==3){
			korstart = korstart.substr(0,len-i)+'천'+korstart.substr(len-i);
		}else if(danw==2){
			korstart = korstart.substr(0,len-i)+'백'+korstart.substr(len-i);
		}else if(danw==1){
			korstart = korstart.substr(0,len-i)+'십'+korstart.substr(len-i);
		}
	}
	korstart = korstart.replace(regexp,'');
	korstart = korstart.replace(/영억/g,'억');
	korstart = korstart.replace(/영만/g,'만');
	korstart = korstart.replace(/일십/g,'십');
	korstart = korstart.replace(/일백/g,'백');
	korstart = korstart.replace(/일천/g,'천');
	if($($input_money).val()!=0){
		korstart = korstart.replace(/영/g,'');
	}
	
	$(selector).empty();
	$(selector).append(korstart);
	
	if($($input_money).val() < 10000){ //만원이하 
		$(selector).css('color','red');
	}else if($($input_money).val() < 1000000){ //백만원 이하
		$(selector).css('color','#14b322');
	}else if($($input_money).val() < 100000000){ //일억원 이하
		$(selector).css('color','#5d29ff');
	}else { // 일억이상
		$(selector).css('color','#3bbad0');
	}
}