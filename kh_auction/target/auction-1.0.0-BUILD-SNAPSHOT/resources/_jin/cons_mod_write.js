$(function(){
	if(!$('#gua_check').prop('checked')) $('#gua_container').hide();
	$('.reimg_up').hide();
	$('#img_up').prop('required',false);
	
	num_to_kor($('#auc_price'));
	
	$('#gua_check').on('change',function(){
		if($(this).prop('checked')){
			$('#gua_container').show();
		}else{
			$('#gua_container').hide();
		}
	});
    
	$('.img_control').on('change',function(){
		if($(this).val() != 'img_no_change'){
			$('.reimg_up').show();
		}else{
			$('.reimg_up').hide();
			$('#cons_img').val('');
			$('.sample_view').empty();
		}
	});
	
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
	
	$('#auc_price').on('keyup',function(){
		if($('#auc_price').val()<0 || $('#auc_price').val() > 999999999999){
			$('#auc_price').val('0');
			alert("희망가격은 0(미정) ~ 999,999,999,999 값이어야합니다.");
			$('#korstart').empty()
						  .append('영')
						  .css('color','red');
		}else {
			$('#auc_price').val(Math.floor($('#auc_price').val()));
			num_to_kor($('#auc_price'));
		}
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