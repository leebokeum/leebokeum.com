package com.leebokeum.dao;

import com.leebokeum.dao.vo.Menu;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by 이복음 on 2017-06-10.
 */
public interface MenuDao  extends JpaRepository<Menu, Integer> {

    List<Menu> findByDeleteFlagOrderByMenuOrderAsc(String deleteFlag);
}
