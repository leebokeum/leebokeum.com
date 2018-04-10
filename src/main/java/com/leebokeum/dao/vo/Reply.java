package com.leebokeum.dao.vo;

import lombok.Data;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by 이복음 on 2017-06-10.
 */
@Entity
@Data
public class Reply {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int id;
    private String contents;
    private String deleteFlag;
    private int parentId;
    private String password;
    private String createrName;
    private String createrEmail;
    private String createDate;

    public Reply saveDefualt(Reply reply) {
        Date date = new java.util.Date();
        SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        reply.setCreateDate(simpleDateFormat.format(date));
        reply.setContents(reply.getContents().replaceAll("\n", "<br>"));
        reply.setDeleteFlag("N");
        return reply;
    }
}
