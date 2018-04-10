package com.leebokeum.dao.vo;

import com.leebokeum.common.Board;
import lombok.Data;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by 이복음 on 2017-06-10.
 */

@Entity
@Data
public class Content implements Board {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;
    @NotNull
    private String title;
    @NotNull
    private String subTitle;
    @Lob
    private String contents;
    private int hit;
    private String deleteFlag;
    private String noticeFlag;
    private int family;
    private int parent;
    private int depth;
    private int indent;
    private String password;
    private String createrName;
    private String deleterName;
    private String createDate;
    private String lastUpdateDate;
    private String originImg1;
    private String img1;
    private long fileSizeImg1;
    private String originVideo;
    private String video;
    private long fileSizeVideo;
    private int categoryId;
    private String cardNewsYn;
    private String tag;
    private int likes;
    private String secretFlag;

    @OneToMany
    @JoinColumn(name="parentId", referencedColumnName="id")
    @OrderBy("id ASC")
    @Where(clause="delete_flag='N'")
    private List<Reply> reply;

    public String[] getTagSplit() {
        String[] tagSplit = this.tag.trim().split(",");
        return tagSplit;
    }

    public Content saveDefualt(Content content){
        Date date = new java.util.Date();
        SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        content.setCreateDate(simpleDateFormat.format(date));
        content.setLastUpdateDate(simpleDateFormat.format(date));
        content.setFamily(content.getId());
        content.setParent(content.getId());
        content.setDeleteFlag("N");
        content.setCardNewsYn("N");
        return content;
    };
}
