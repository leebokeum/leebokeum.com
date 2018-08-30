package com.leebokeum.dao;

import com.leebokeum.dao.vo.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by 이복음 on 2017-06-10.
 */
public interface UserDao extends JpaRepository<User, Integer> {
    User findByUserIdAndPassword(String userId, String password);
}
