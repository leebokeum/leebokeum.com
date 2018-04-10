package com.leebokeum.dao;

import com.leebokeum.dao.vo.BlogCategory;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by 이복음 on 2017-06-11.
 */
public interface BlogCategoryDao extends JpaRepository<BlogCategory, Integer> {
}
