package com.leebokeum.controller;

import com.leebokeum.dao.UserDao;
import com.leebokeum.dao.vo.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by 이복음 on 2017-06-06.
 */

@Controller
public class LoginController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    UserDao userDao;

    @RequestMapping(value = "/sign", method = RequestMethod.POST)
    @ResponseBody
    public String sign(HttpSession session, User user) {
        user = userDao.findByUserId(user.getUserId());

        if (user != null && user.getState().equals("Y")) {
            session.setAttribute("sessionUser", user);
            return "200";
        } else if (user != null && user.getState().equals("N")) {
            return "500";
        } else {
            return "404";
        }
    }

    @RequestMapping(value = "/join", method = RequestMethod.POST)
    public String join(User user) {
        user.setState("N");
        userDao.save(user);
        return "home";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "home";
    }
}
