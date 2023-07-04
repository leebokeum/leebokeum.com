package com.leebokeum.controller;

import com.leebokeum.dao.MessageDao;
import com.leebokeum.dao.vo.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;
import javax.servlet.http.HttpSession;

/**
 * Created by 이복음 on 2017-06-11.
 */

@RestController
public class MessageController {

    @Autowired
    MessageDao messageDao;

    @RequestMapping(value = "/messageSave", method = RequestMethod.POST)
    ResponseEntity<?> messageSave(HttpSession session, Message message) {
        if (session.getAttribute("user") == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
        }

        message = messageDao.save(message.saveDefualt(message));
        if (message != null) {
            return ResponseEntity.ok("메시지를 전송했습니다"); // 메시지 저장 성공
        } else {
            return ResponseEntity.ok("메시지 전송에 실패했습니다."); // 메시지 저장 실패
        }
    }
}
