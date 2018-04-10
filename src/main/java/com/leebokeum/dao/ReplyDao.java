package com.leebokeum.dao;

import com.leebokeum.dao.vo.Reply;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by 이복음 on 2017-06-10.
 */
public interface ReplyDao extends JpaRepository<Reply, Integer> {
}
