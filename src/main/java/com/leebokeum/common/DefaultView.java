package com.leebokeum.common;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class DefaultView extends WebMvcConfigurerAdapter {

    /*기본 뷰*/
 
	@Override
    public void addViewControllers(ViewControllerRegistry registry ) {
        registry.addViewController( "/" ).setViewName( "forward:/home" );
        registry.setOrder( Ordered.HIGHEST_PRECEDENCE );
        super.addViewControllers( registry );
    } 
}
