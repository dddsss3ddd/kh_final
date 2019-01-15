jQuery(function($) {

	
	$('.start_date').on('change',function(){
		
		var q = new Date();
		var m = q.getMonth()+1;
		var d = q.getDate();
		var y = q.getFullYear();
		var tt = q.getHours();
		var mm = q.getMinutes();
		var sss = y+'-';
		if(m<10) sss +=0;
		sss+= m+'-'+d
		var date = new Date(sss);
		var input_date = new Date($('#auc_start1').val());
		
		if(input_date != null && input_date-date<0){
			alert("과거 날짜는 설정할 수 없습니다.");
			$('#auc_start1').val(sss);
		} else if(date-input_date==0){
			if(tt>$('#s_hour').val()){
				alert("현재시간 이후로 설정합니다.");
				$('#s_hour').val(tt+1)
			}
		}
	});
	
	//종료일 설정
	$('#e_date').val('1');
	$('.end_date').on('change',function(){
		if($('#e_date').val()==0 && $('#e_hour').val()==0 && $('#e_min').val()==0){
			alert('경매시간은 0이 될 수 없습니다.');
			$('#e_date').val('1');
			$('#e_hour').val('0');
			$('#e_min').val('0');
		}
	});
	
	//사용자 검색
	$('#con_id').on('keyup',function(){
		selectUser($(this).serialize());
	});
	
	//택배비
	$('#method_price').prop('disabled',true);
	$('#for_guarantee_info').css('display','none');
	
	$('.ggconfig').on('change',function(){
		if($('#g_yes').prop('checked')){
			$('#for_guarantee_info').css('display','block');
		}
		else{
			$('#guarantee_info').val('');
			$('#for_guarantee_info').css('display','none');
		}
	})
	
	
	//시간 자동/수동 설정 트리거
	$('.auto_date').on('change',function(){
		var select_is = $(this).next().val();
		if($(this).prop('checked'))	{
			$('.'+select_is).val('')
							.prop('disabled',true)
							.prop('required',false);
			
		}
		else $('.'+select_is).prop('disabled',false)
							 .prop('required',true);
	});
	
	//경매 시작가 및 경매단위 설정 한글 표시도.
	$('.price_in').on('keyup',function(){
		if($('#auc_price').val()<0 || $('#auc_price').val() > 999999999999){
			$('#auc_price').val('0');
			alert("경매 시작가는 0 이상 999,999,999,999이하의 값이어야합니다.");
			$('#korstart').empty()
						  .append('영')
						  .css('color','red');
		}else {
			num_to_kor($('#auc_price'));
		}
		
		if($('#auc_interval').val()<0 || $('#auc_interval').val()>10000000){
			$('#auc_interval').val('1');
			alert("경매 단위는 1 이상 1천만원 이하에서 선택해주세요.");
			$('#korend').empty()
			  .append('일')
			  .css('color','red');
		}else{
			num_to_kor($('#auc_interval'));
		}
	});
	
	sameday=false;
	
	//택배비 입력가능/불가
	$('#trade3').on('change',function(){
		if(!$('#trade3').prop('checked')){
			$('#method_price').val('0');
			$('#method_price').prop('disabled',true);
		}else{
			$('#method_price').prop('disabled',false);
		}
	});
	
	$('#method_price').on('change',function(){
		if($('#method_price').val()<0 || $('#method_price').val()>500000){
			alert('택배비 최소금액 : 0원, 최대금액 50만원 입니다.');
			$(this).val('0');
		}
	})
	
	//입찰단위 수정가능여부
	$('.ti_bli').on('change',function(){
		if($(this).val()=='time'){
			$('#auc_interval').prop('placeholder','입찰단위를 입력하세요.');
			$('#auc_interval').prop('required',true);
			$('#auc_interval').prop('disabled',false);
		}else{
			$('#auc_interval').prop('placeholder','단위를 지정하지 않습니다.');
			$('#auc_interval').prop('required',false);
			$('#auc_interval').prop('disabled',true);
			$('#auc_interval').val('');
			$('#korend').empty();
		}
	})
	
	//이미지 다중 업로드 내용
	var imagesPreview = function(input,placeToInsertImagePreview){
		if(input.files){
			var filesAmount = input.files.length;
			
			$(placeToInsertImagePreview).empty();
			for(i=0;i<filesAmount;i++){
				var reader = new FileReader();
				reader.onload = function(event) {
                    $($.parseHTML('<img>')).attr('src', event.target.result)
                    					   .css('width','120px')
                    					   .css('height','120px')
                    					   .appendTo(placeToInsertImagePreview);
                }
				reader.readAsDataURL(input.files[i]);
			}
		}
	};
	$('#img_up').on('change',function(){
		imagesPreview(this,'div.sample_view');
	});
	
	$('#id_config').on('click',function(){
		$('#con_id').prop('readOnly',true);
		$('#con_id').prop('placeholder','위탁고객이 입력되지 않았습니다.');
	});
	
	$('#id_reconf').on('click',function(){
		$('#con_id').prop('readOnly',false);
		$('#con_id').prop('placeholder','위탁고객을 입력하고 확인을 누르세요.');
		$('#con_id').val();
		$('#user_info').val();
	});
});

function num_to_kor($input_money){
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
	var selector = 'korstart';
	if($($input_money).prop('id')=='auc_interval'){
		selector = 'korend';
	}
	
	$('#'+selector).empty();
	$('#'+selector).append(korstart);
	
	if($($input_money).val() < 10000){ //만원이하 
		$('#'+selector).css('color','red');
	}else if($($input_money).val() < 1000000){ //백만원 이하
		$('#'+selector).css('color','#14b322');
	}else if($($input_money).val() < 100000000){ //일억원 이하
		$('#'+selector).css('color','#5d29ff');
	}else { // 일억이상
		$('#'+selector).css('color','#3bbad0');
	}
}

function selectUser(user_id) {

	if(user_id != ''){
		// Ajax를 수행합니다.
		$.ajax({
			url : 'getconfuser.hh',
			data : user_id,
			dataType : "text",
			type : "POST",
			cache : false,
			success : function(responsedata) {
				var output = '';
				if(responsedata != null && responsedata != '_none'){
					output +=
						'<a id="user_go" href="#?user_id='+
						responsedata+'">'+
						responsedata+'</a>';
				}
				else {
					output += 
						'<span style="color:red;">'+user_id+
						'해당하는 사용자가 없습니다.</span>';
				}
				$('#user_info').empty().append(output);
			},
			error : function(data) {
				alert("사용자 정보를 받아오던 중 오류가 발생했습니다.");
			}
		});
	}else{
		$('#user_info').empty().append("<span style='color:blue;'>위탁자를 입력해주세요.</span>");
	}
}
