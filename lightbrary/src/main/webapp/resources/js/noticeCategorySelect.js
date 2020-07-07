//ajax는 순서가 있음
var noticeCategoryObj = '';
function noticeCategorySelect(){
	$.ajax({
		type: "POST",
		url: './category.do',
		dataType: 'json',
		success: function(data){
			noticeCategoryObj = data;
			noticeCategoryOnload();
		},
		error: function(e){
			alert('오류');
		}
	});
}

function initNoticeCategory() {
	var $nameStr = '';
	
	$.each(noticeCategoryObj, function(i, item) {
		$nameStr = $('<option value="' + item.code + '">' + item.name + '</option>');
		$('#noticeCategory').append($nameStr);
	});
	
}



