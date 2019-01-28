$(function(){
	$('.big_cont').on('click','a',function(){
		
		var listajax = "";
		listajax="search_condition="+$('#search_condition').val();
		if($(this).hasClass('all')){
			listajax="search_condition=all";
			$('#search_condition').val("all");
			$('#page').val('1');
		}
		if($(this).hasClass('id')){
			listajax="search_condition=id";
			$('#search_condition').val("id");
			$('#page').val('1');
		}
		if($(this).hasClass('viewing')){
			listajax="search_condition=viewing";
			$('#search_condition').val("viewing");
			$('#page').val('1');
		}
		if($(this).hasClass('identifying'))	{
			listajax="search_condition=identifying";
			$('#search_condition').val("identifying");
			$('#page').val('1');
		}
		if($(this).hasClass('consigning')){
			listajax="search_condition=consigning";
			$('#search_condition').val("consigning");
			$('#page').val('1');
		}
		if($(this).hasClass('conplete')){
			listajax="search_condition=conplete";
			$('#search_condition').val("complete");
			$('#page').val('1');
		}
		
		if($(this).hasClass('selectpage')){
			if($(this).hasClass('active')) return false;
			if($(this).hasClass('go_left')){
				if($('#page').val()<=1) return false;
				else $('#page').val($('#page').val()-1);
			}else if($(this).hasClass('go_right')){
				if($('#page').val()>=$('#e_page').val()) return false;
				else $('#page').val($('#page').val()+1);
			}else{
				$('#page').val($(this).text());
			}
		}
//		if($(this).haxClass('selectab')) {
//			list_jax+="&selectt=tab";
//		}else if($(this).haxClass('selectpage')){
//			list_jax+="&selectt=page";
//		}else{
//			list_jax+="&selectt=init";
//		}
		
		
		//전부 아작스 또는 페이지만 아작스 처리.
		listajax+="&page="+$('#page').val();
		alert(listajax);
		list_jax(listajax+'&selectt=page','page');
		list_jax(listajax+'&selectt=tab','tab');		
	});
	
	
	alert($('.to_page').text());
});
function list_jax(senddata,conf){
	$.ajax({
		url : './cons_list.hh',
		data : senddata,
		dataType : 'text',
		type : 'POST',
		cache : false,
		success : function(responsedata){
			if(conf=='page'){
				$('.page_ajax').empty().append(responsedata);
			}
			else if(conf=='tab'){
				$('.item_ajax').empty().append(responsedata);
			}
		},
		error : function(request, status, error){
	    	 console.log("code :" + request.status  
	    			     + "\n 받은 데이터 :" + request.responseText 
	    			     + "\n error status : " + status
	    	             + "\n error 메시지 : " + error);}
	});	
}
