package com.leebokeum.dao.vo;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by 이복음 on 2017-06-11.
 */
@Entity
@Data
public class Message {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int id;
    private String contents;
    private String name;
    private String email;
    private String createDate;

    public Message saveDefualt(Message message) {
        Date date = new java.util.Date();
        SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        message.setCreateDate(simpleDateFormat.format(date));
        return message;
    }
}
