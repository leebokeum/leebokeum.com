package com.leebokeum.common;

import com.leebokeum.dao.vo.Content;
import org.springframework.data.domain.Page;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

public class Tags {

    public List<String> getTagList(Page<Content> contentList){
        ArrayList<String> tags = new ArrayList<String>();
        Iterator<Content> iterator = contentList.iterator();
        while(iterator.hasNext()){
            for (String tag:iterator.next().getTagSplit()) {
                tags.add(tag);
            }
        }

        HashSet<String> distinctData = new HashSet<String>(tags);
        tags = new ArrayList<String>(distinctData);

        return tags;
    }
}
