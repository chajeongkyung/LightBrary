var bookImageObj = '';

function bookImageSelect() {
	var baseUrl = window.location.protocol + "//" + window.location.host + "/lightbrary/";
	$.ajax({
		type: "POST",
		url: baseUrl + '/book/image.do',
		dataType: 'json',
		success: function(data){
			bookImageObj = data;
			bookImageOnload();
		},
		error: function(e){
			alert('오류');
		}
	});
}