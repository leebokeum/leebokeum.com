package com.leebokeum.dao.vo;

import com.leebokeum.common.Board;
import lombok.Data;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by 이복음 on 2017-06-10.
 */

@Entity
@Data
public class Content implements Board {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
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
    @JoinColumn(name = "parentId", referencedColumnName = "id")
    @OrderBy("id ASC")
    @Where(clause = "delete_flag='N'")
    private List<Reply> reply;

    public List<String> getTagSplit() {
        String[] tagSplit = this.tag.replace("#", ",").split(",");
        ArrayList<String> tags = new ArrayList<String>();
        for (String tag : tagSplit) {
            if (!tag.trim().equals("")) {
                tags.add(tag.trim());
            }
        }

        return tags;
    }

    //og리스트를 위한 컨텐츠 내 이미지 추출
    public String getOgImage() {
        Pattern nonValidPattern = Pattern
                .compile("(?i)< *[IMG][^\\>]*[src] *= *[\"\']{0,1}([^\"\'\\ >]*)");
        int imgCnt = 0;
        String src = "";
        Matcher matcher = nonValidPattern.matcher(this.contents);
        while (matcher.find()) {
            src = matcher.group(1);
            imgCnt++;
            if (imgCnt == 1) {
                break;
            }
        }
        return src;
    }

    //og리스트를 위한 컨텐츠 내 이미지 추출 리스트로
    public List getOgImageList() {
        Pattern nonValidPattern = Pattern
                .compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");

        List srcList = new ArrayList();
        Matcher matcher = nonValidPattern.matcher(this.contents);
        while (matcher.find()) {
            srcList.add(matcher.group(1));
        }

        return srcList;
    }


    public Content saveDefualt(Content content) {
        Date date = new java.util.Date();
        SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        content.setCreateDate(simpleDateFormat.format(date));
        content.setLastUpdateDate(simpleDateFormat.format(date));
        content.setFamily(content.getId());
        content.setParent(content.getId());
        content.setDeleteFlag("N");
        content.setCardNewsYn("N");
        return content;
    }

    ;
}
