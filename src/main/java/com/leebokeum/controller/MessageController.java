package com.leebokeum.controller;

import com.leebokeum.dao.MessageDao;
import com.leebokeum.dao.vo.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * Created by 이복음 on 2017-06-11.
 */

@RestController
public class MessageController {

    @Autowired
    MessageDao messageDao;

    @RequestMapping(value = "/messageSave", method = RequestMethod.POST)
    String messageSave(Message message){
        message = messageDao.save(message.saveDefualt(message));
        if(message != null){
            return "메시지를 전송했습니다"; //메시지 저장 성공
        }else{
            return "메시지 전송에 실패했습니다."; //메시지 저장 실패
        }
    }
}
