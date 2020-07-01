var bookCategoryObj = '';

function bookCategorySelect() {
	var baseUrl = window.location.protocol + "//" + window.location.host + "/lightbrary/";
	$.ajax({
		type: "POST",
		url: baseUrl + '/book/category.do',
		dataType: 'json',
		success: function(data){
			bookCategoryObj = data;
			bookCategoryOnload();
		},
		error: function(e){
			alert('오류');
		}
	});
}	

function initBookCategory(){
	var $appendStr = '';
	$appendStr = $('<option value="">대분류</option>');
	$('#bookCategory1').append($appendStr);

	$.each(bookCategoryObj, function(idx, item){
		if (item.depth == 1 && item.name != null) {
			$appendStr = $('<option value="' + item.code + '">' + item.name + '</option>');
			$('#bookCategory1').append($appendStr);
		}
	});
	
	$('#bookCategory1').change(function(){
		$('#bookCategory2').empty();
		
		$appendStr = $('<option value="">중분류</option>');
		$('#bookCategory2').append($appendStr);

		$('#bookCategory3').empty();
		
		$appendStr = $('<option value="">소분류</option>');
		$('#bookCategory3').append($appendStr);
		
		$.each(bookCategoryObj, function(idx, item){
			var selectedVal = $('#bookCategory1 option:selected').val();
			
			if (item.depth == 2 && item.name != null) {
				if(selectedVal.charAt(0) == item.code.charAt(0)){
					$appendStr = $('<option value="' + item.code + '">' + item.name + '</option>');
					$('#bookCategory2').append($appendStr);
				}
			}
		});
	});
	
	$('#bookCategory2').change(function(){
		$('#bookCategory3').empty();
		
		$appendStr = $('<option value="">소분류</option>');
		$('#bookCategory3').append($appendStr);

		$.each(bookCategoryObj, function(idx, item){
			var selectedVal = $('#bookCategory2 option:selected').val();
			if (item.depth == 3 && item.name != null) {
				if(selectedVal.charAt(0) == item.code.charAt(0)){
					if(selectedVal.charAt(1) == item.code.charAt(1)){
						$appendStr = $('<option value="' + item.code + '">' + item.name + '</option>');
						$('#bookCategory3').append($appendStr);
					}
				}
			}
		});
	});
}