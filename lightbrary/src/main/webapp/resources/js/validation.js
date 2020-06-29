	function isNull(input) {
		if (input == null || input == "") {
			return true;
		} else {
			return false;		
		}
	}
	
	function isEmpty(input) {
		if (input == null || input.replace(/ /gi, "") == "") {
			return true;
		} else {
			return false;		
		}
	}
	
	function isValidFormat(input, format) {
		if (input.search(format) != -1) {
			return true; //올바른 포맷형식
		}
		return false;
	}
	
	function isValidName(input) {
		var format = /^[a-zA-Z가-힣]{2,8}$/; 
			
		return isValidFormat(input, format);
	}
	
	function isValidPhone(input) {
		var format = /^(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
		
		return isValidFormat(input, format);
	}

	function isValidEmail(input) {
		var format = /^[a-zA-Z0-9]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
			
		return isValidFormat(input, format);
	}
	
	function isValidPassword(input) {
		var format = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/;
			
		return isValidFormat(input, format);
	}

	