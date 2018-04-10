package com.leebokeum.dao.vo;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Created by 이복음 on 2017-06-11.
 */
@Entity
@Data
public class BlogCategory {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int id;
    private int categoryLevel;
    private int categoryParent;
    private String categoryName;
    private String categoryLink;
    private String categoryImgLink;
    private String categoryTargetYn;
    private String categoryDesktopYn;
    private String categoryMobileYn;
    private int categoryOrder;
    private String deleteFlag;
}
