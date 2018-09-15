package com.leebokeum.dao.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

/**
 * Created by 이복음 on 2017-06-10.
 */

@Data
@AllArgsConstructor
@RequiredArgsConstructor
@Entity
public class User {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;
    @NotNull
    private String userId;
    @NotNull
    private String userName;
    @NotNull
    private String password;
    @NotNull
    private String state;

    //카카오톡 로그인을 위한 필드
    private String nickName;
    private String profileImage;
    private String thumbnailImage;
    private String email;
    private String ageRange;
    private String birthday;
    private String gender;

}
