var bookStatusObj = '';

function bookStatusSelect() {
	var baseUrl = window.location.protocol + "//" + window.location.host + "/lightbrary/";
	$.ajax({
		type: "POST",
		url: baseUrl + '/book/status.do',
		dataType: 'json',
		success: function(data){
			bookStatusObj = data;
			bookStatusOnload();
		},
		error: function(e){
			alert('오류');
		}
	});
}

function getStatusCodebyName(name){
	for (var i = 0; i < bookStatusObj.length; i++) {
		if(bookStatusObj[i].name == name){
			return bookStatusObj[i].code;
		}
	}
}