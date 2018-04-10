package com.leebokeum.dao.vo;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Created by 이복음 on 2017-06-10.
 */
@Entity
@Data
public class Menu {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int id;
    private int menuLevel;
    private int menuParent;
    private String menuName;
    private String menuLink;
    private String menuImgLink;
    private String menuTargetYn;
    private String menuDesktopYn;
    private String menuMobileYn;
    private String menuCustom;
    private int menuOrder;
    private String deleteFlag;
}
