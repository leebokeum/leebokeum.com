package com.leebokeum.dao;

import com.leebokeum.dao.vo.BlogCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by 이복음 on 2017-06-11.
 */
public interface BlogCategoryDao extends JpaRepository<BlogCategory, Integer> {

    @Query(value="SELECT max(category_order) FROM blog_category order by category_order desc", nativeQuery = true)
    int findMaxOrder();
}
