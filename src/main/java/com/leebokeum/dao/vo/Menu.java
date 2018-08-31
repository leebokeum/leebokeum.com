package com.leebokeum.dao.vo;

import lombok.Data;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.util.List;

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

    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name="menuParent", referencedColumnName="id")
    @OrderBy(value="menuOrder")
    @Where(clause="delete_flag='N'")
    List<Menu> subMenu;
}
