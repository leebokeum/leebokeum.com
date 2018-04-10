package com.leebokeum.common;

import java.util.UUID;

public class CommonUtil {
	public static String getRandomString(){
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
}
