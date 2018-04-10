package com.leebokeum.common;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.data.jpa.repository.JpaRepository;


public class HitIncement {

	public <T> Board addHit(JpaRepository<T, Integer> dao, int id, HttpServletResponse response, HttpServletRequest request, String CookieKeyValue){
		T temp = (T) dao.findOne(id);
		Board content = (Board) temp;

		Cookie cookies[] = request.getCookies();
		Map map = new HashMap();
		if(request.getCookies() != null){
			for (int i = 0; i < cookies.length; i++) {
				Cookie obj = cookies[i];
				map.put(obj.getName(),obj.getValue());
			}
		}
		// 저장된 쿠키중에 read_count 만 불러오기
		String readCount = (String) map.get(CookieKeyValue);
		
		 
		// 저장될 새로운 쿠키값 생성
		String newReadCount = "&" + id + "&";
		try {
			newReadCount = URLEncoder.encode(newReadCount,"utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		// 저장된 쿠키에 새로운 쿠키값이 존재하는 지 검사
		if(readCount == null){
			// 없을 경우 쿠키 생성
			Cookie cookie;
				cookie = new Cookie(CookieKeyValue, readCount + newReadCount);
				response.addCookie(cookie);
				content.setHit(content.getHit() + 1);
				dao.save((T) content);
		}else{
			if (readCount.indexOf(newReadCount) < 0) {
				// 없을 경우 쿠키 생성
				Cookie cookie = new Cookie(CookieKeyValue, readCount + newReadCount);
				response.addCookie(cookie);
				content.setHit(content.getHit() + 1);
				dao.save((T) content);
			}
		}
		return content;
	}
}
