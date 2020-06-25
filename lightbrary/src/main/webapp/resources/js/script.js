$(document).ready(function() {
	
	//헤더 스크롤 모션
	headerScroll();
	//회원 마이페이지 드롭다운 메뉴
	myPageDrop();
	
	//탑 버튼
	$('#topBtn').click( function() {
		$('html, body').animate({scrollTop:0}, 400);
		return false;
	});
	
	//체크박스 전체선택
	$('#all').click(function() {
		$('.checkbox input').prop('checked', $(this).prop('checked'));
	});
	//전체선택에서 개별 선택시 전체선택 비활성화
	$('.checkbox input').click(function() {
	    if (!$(this).prop('checked')) {
	        $("#all").prop('checked', false);
	    }
	});
	
})

function headerScroll(){
	$(window).scroll(function() {
		var scroll = $(window).scrollTop();
		
		if(scroll > 50){
			$('#headerTop').addClass('active');
			$('#headerSearch').addClass('scroll');
		} else{
			$('#headerTop').removeClass('active');
			$('#headerSearch').removeClass('scroll');
		}
		
		if ($('#myPageClick').hasClass('active')) {
			$('#myPageDrop').slideUp(100);
			$('#myPageClick').removeClass('active');
		}
	
	});
}
	

function myPageDrop(){	
	$('#myPageClick').click(function() {
		$('#myPageDrop').slideToggle(100);
		$(this).toggleClass('active');
	});
}