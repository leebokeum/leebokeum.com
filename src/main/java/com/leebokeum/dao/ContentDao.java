package com.leebokeum.dao;

import com.leebokeum.dao.vo.Content;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


/**
 * Created by 이복음 on 2017-06-10.
 */
public interface ContentDao extends JpaRepository<Content, Integer> {
    Page<Content> findByDeleteFlag(String deleteFlag, Pageable pageReguest);
    Page<Content> findByDeleteFlagAndCategoryId(String deleteFlag, int categoryId, Pageable pageReguest);
    List<Content> findByDeleteFlagAndNoticeFlagOrderByIdDesc(String deleteFlag, String noticeFlag);
}
