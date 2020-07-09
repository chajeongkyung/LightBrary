package com.lightbrary.util;

import java.util.UUID;

public class CommonUtils {
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	public static String getRandomPassword() {
		return UUID.randomUUID().toString().replaceAll("-", "").substring(0, 12);
	}

}
