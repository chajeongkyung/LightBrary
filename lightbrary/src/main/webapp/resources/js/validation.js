
	function isNull(input) {
		if (input.value == null || input.value == "") {
			return true;
		} else {
			return false;		
		}
	}
	
	function isEmpty(input) {
		if (input.value == null || input.value.replace(/ /gi, "") == "") {
			return true;
		} else {
			return false;		
		}
	}
	
	function containsCharsOnly(input, chars) {
		for (var i = 0; i < input.value.charAt(i); i++) {
			if (chars.indexOf(input.value.charAt(i)) == -1) {
				return false;
			}
		}
	}
	
	function isValidFormat(input, format) {
		if (input.value.search(format) != -1) {
			return true; //올바른 포맷형식
		}
		return false;
	}
	
	function isValidEmail(input) {
		var format = /^[a-zA-Z0-9]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
			
		return isValidFormat(input, format);
	}
	
	function isValidPhone(input) {
		var format = /^(\d+)-(\d+)-(\d+)$/;
		
		return isValidFormat(input, format);
	}