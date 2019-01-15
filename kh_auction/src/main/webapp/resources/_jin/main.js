jQuery(function($) {
	$('.to_hots').on('click',function(){
		var auc_no=$(this).find('input').val();
		location.href="auclist.jj?auc_no="+auc_no; //상품 경매 페이지로 이동하면 된다.
	});
});