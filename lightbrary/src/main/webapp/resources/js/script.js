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
		var allChecked = $(this).prop('checked');
		
		if (allChecked) {
			$('.checkbox input').each(function(){
				var disabled = $(this).prop('disabled');
				
				if (disabled) {
					$(this).prop('checked', false);
				} else{
					$(this).prop('checked', true);
				}
			});
		} else{
			$('.checkbox input').prop('checked', false);
		}
		
	});
	//전체선택에서 개별 선택시 전체선택 비활성화
	$('.checkbox input').click(function() {
	    if (!$(this).prop('checked')) {
	        $("#all").prop('checked', false);
	    }
	});
	
	//네비 서브네비 마우스오버
	$('.depthNav').mouseover(function() {
		var depth2 = $(this).find('ul');
		
		depth2.show();
		$('#nav').addClass('active');
	});
	$('.depthNav').mouseout(function() {
		var depth2 = $(this).find('ul');
		
		depth2.hide();
		$('#nav').removeClass('active');
	});
	
	//a태그 기본값
	$('a[href="#none"]').click(function(e) {
		e.preventDefault();
	});
	
	//jquery버전 조정
	$.browser = {};
	(function () {
	    $.browser.msie = false;
	    $.browser.version = 0;
	    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
	        $.browser.msie = true;
	        $.browser.version = RegExp.$1;
	    }
	})();
	
	//달력표시
	$(".datePicker").datepicker({
		dateFormat: "yy/mm/dd",
		changeYear: true,
		showButtonPanel: true
	});
}); 

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

function moveToMyRentFnc() {
	var headerMyNo = $('#headerMyNo').val();
	
	location.href = '/lightbrary/rent/member/list.do?myNo=' + headerMyNo;
}

function moveToMyReserveFnc() {
	var headerMyNo = $('#headerMyNo').val();
	
	location.href = '/lightbrary/rent/reserve/member/list.do?myNo=' + headerMyNo;
}

//선택된 체크박스 전체를 배열로 반환
function checkedObjArr(){
	return $('input[id^=chk]:checked');
}

//이미지파일 미리보기 및 유효성검사
function imageFileSelectFnc(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(file){
		if(!file.type.match("image.*")){
			alert("이미지 파일만 업로드 가능합니다.");
			initInputFile();
			$('#bookImage').css("background-image", $('#fileUrlDefault').val());
			$('#imageStatus').val(0);
		} else{
			selectedFile = file;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$('#bookImage').css("background-image", "url(" + e.target.result + ")");
				$('#imageStatus').val(1);
			}
			reader.readAsDataURL(file)
		}
	});
}

function initInputFile(){
	if (/(MSIE|Trident)/.test(navigator.userAgent)) {
		// ie 일때 input[type=file] init. 
		$("#file").replaceWith( $("#file").clone(true) ); 
	} else { 
		// other browser 일때 input[type=file] init. 
		$("#file").val("");
	}
}