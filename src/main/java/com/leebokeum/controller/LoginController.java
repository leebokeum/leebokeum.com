package com.leebokeum.controller;

import com.leebokeum.dao.MenuDao;
import com.leebokeum.dao.UserDao;
import com.leebokeum.dao.vo.Menu;
import com.leebokeum.dao.vo.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by 이복음 on 2017-06-06.
 */

@Controller
public class LoginController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    UserDao userDao;

    @Autowired
    MenuDao menuDao;

    @RequestMapping(value = "/sign", method = RequestMethod.POST)
    @ResponseBody
    public String sign(HttpSession session, User user) {
        user = userDao.findByUserIdAndPassword(user.getUserId(), user.getPassword());
        if (user != null && user.getState().equals("Y")) {
            session.setAttribute("sessionUser", user);
            return "200";
        } else if (user != null && user.getState().equals("N")) {
            return "500";
        } else {
            return "404";
        }
    }

    @RequestMapping(value = "/kakaoLogin", method = RequestMethod.POST)
    @ResponseBody
    public String kakaoLogin(HttpSession session, @RequestParam Map<String, String> mapUser) {
        User user = null;
        if (mapUser != null){
            user = userDao.findByUserId(mapUser.get("id"));
            if(user != null && user.getState().equals("Y")){
                session.setAttribute("sessionUser", user);
            }else if(user != null && user.getState().equals("N")){
                return "500";
            } else{ //신규 카카오톡으로 회원승인대기
                user = new User();
                user.setAgeRange(mapUser.get("kakao_account[age_range]"));
                user.setBirthday(mapUser.get("kakao_account[birthday]"));
                user.setEmail(mapUser.get("kakao_account[email]"));
                user.setGender(mapUser.get("kakao_account[gender]"));
                user.setProfileImage(mapUser.get("properties[profile_image]"));
                user.setThumbnailImage(mapUser.get("properties[thumbnail_image]"));
                user.setState("N");
                user.setUserName(mapUser.get("properties[nickname]"));
                user.setNickName(mapUser.get("properties[nickname]"));
                user.setUserId(mapUser.get("id"));
                user.setPassword("kakao");
                userDao.save(user);
            }
            return "200";
        }
        return "500";
    }

    @RequestMapping(value = "/join", method = RequestMethod.POST)
    public String join(User user, Model model) {
        user.setState("N");
        userDao.save(user);
        getMenu(model);
        return "home";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session, Model model) {
        session.invalidate();
        getMenu(model);
        return "home";
    }

    private void getMenu(Model model){
        List<Menu> menuList = menuDao.findByDeleteFlagOrderByMenuOrderAsc("N");
        model.addAttribute("menuList", menuList);
    }
}
