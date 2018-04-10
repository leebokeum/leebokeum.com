package com.leebokeum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

/**
 * Created by 이복음 on 2017-06-06.
 */
@Controller
public class ViewController {

    @Autowired
    private ResourcePatternResolver resourcePatternResolver;

    @RequestMapping("/home")
    public String home(){
        return "home";
    }

    @RequestMapping("/about")
    public String about(){
        return "about";
    }

    @RequestMapping("/contact")
    public String contact(){
        return "contact";
    }

    @RequestMapping("/write")
    public String write(){
        return "write";
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/har")
    public String portfolio(Model model){
        Resource[] resources = null;
        try {
            resources = resourcePatternResolver.getResources("classpath:/static/flipbook/portfolio/*.jpg");
        } catch (IOException e) {
            e.printStackTrace();
        }
        model.addAttribute("imgCount",  Integer.toString(resources.length - 2));
        return "har_portfolio";
    }
}
