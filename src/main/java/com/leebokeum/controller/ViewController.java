package com.leebokeum.controller;

import com.leebokeum.dao.MenuDao;
import com.leebokeum.dao.vo.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.List;

/**
 * Created by 이복음 on 2017-06-06.
 */
@Controller
public class ViewController {

    @Autowired
    private ResourcePatternResolver resourcePatternResolver;

    @Autowired
    MenuDao menuDao;

    @RequestMapping("/home")
    public String home(Model model) {
        getMenu(model);
        return "home";
    }

    @RequestMapping("/about")
    public String about(Model model) {
        getMenu(model);
        return "about";
    }

    @RequestMapping("/contact")
    public String contact(Model model) {
        getMenu(model);
        return "contact";
    }

    @RequestMapping("/write")
    public String write(Model model) {
        getMenu(model);
        return "write";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        getMenu(model);
        return "login";
    }

    @RequestMapping("/portfolio/har")
    public String portfolio(Model model) {
        Resource[] resources = null;
        try {
            resources = resourcePatternResolver.getResources("classpath:/static/flipbook/portfolio/*.jpg");
        } catch (IOException e) {
            e.printStackTrace();
        }
        model.addAttribute("imgCount", Integer.toString(resources.length - 2));
        return "har_portfolio";
    }

    private void getMenu(Model model){
        List<Menu> menuList = menuDao.findByDeleteFlagOrderByMenuOrderAsc("N");
        model.addAttribute("menuList", menuList);
    }

}
