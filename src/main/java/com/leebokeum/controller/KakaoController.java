package com.leebokeum.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class KakaoController {
    private String kakaoRestKey = "738c14a830537e31159fdf85f33d6b9b";
    private String host = "http://leebokeum.com"; // 운영
    //private String host = "http://localhost:8080"; // 테스트


    //restApi로 로그인시 accessToken을 가지고 오기 위한 첫번째 단계
    @RequestMapping(value = "/kakaoLogin" , method = RequestMethod.GET)
    String kakaoLogin() {
        return "redirect:https://kauth.kakao.com/oauth/authorize?client_id="+ kakaoRestKey+"&redirect_uri="+ host +"/oauth&response_type=code";
    }


    //restApi로 로그인시 accessToken을 가지고 오기 위한 두번째(최종) 단계
    @RequestMapping(value = "/oauth" , method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    String oauth(@RequestParam("code") String code) {
        HttpHeaders header = new HttpHeaders();
        ResponseEntity<String> response = new RestTemplate().exchange("https://kauth.kakao.com/oauth/token?grant_type=authorization_code&client_id="+kakaoRestKey+"&redirect_uri=" + host + "/oauth&code=" + code, HttpMethod.POST, new HttpEntity(header), String.class);
        Map<String,String> resultMap = new HashMap<String,String>();
        ObjectMapper mapperObj = new ObjectMapper();

        //json을 자바 객체 맵으로 변환
        try {
            resultMap = mapperObj.readValue(response.getBody().toString(),
                    new TypeReference<HashMap<String,String>>(){});
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        System.out.println(resultMap);
        return response.getBody().toString();
    }


    @RequestMapping(value = "/sendKakao" , method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
        //@CrossOrigin(origins = "*")
    void kakaoSendMessage(@RequestParam("code") String code) {
        HttpHeaders header = new HttpHeaders();

        Map<String,String> resultMap = new HashMap<String,String>();
        ObjectMapper mapperObj = new ObjectMapper();

//        try {
//            resultMap = mapperObj.readValue(response.getBody().toString(),
//                    new TypeReference<HashMap<String,String>>(){});
//            header.add("Authorization","Bearer " + resultMap.get("access_token"));
//            response = new RestTemplate().exchange("https://kapi.kakao.com/v2/api/talk/memo/send?template_id=12253&template_args=", HttpMethod.POST, new HttpEntity(header), String.class);
//        } catch (IOException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
    }

    @RequestMapping(value = "/getUserInfo" , method = {RequestMethod.GET, RequestMethod.POST})
    private String getUserInfo(@RequestParam("accessToken") String accessToken){


        return null;
    }
}
