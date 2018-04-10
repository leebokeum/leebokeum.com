<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body  class="loaded">
<header class="">
        <div class="container">
            <div id="logo-wrapper">
                <div class="cell-view"><a id="logo" href="/home"><img src="/img/logo_black.png" alt=""></a></div>
            </div>
            <div class="open-icon">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <div class="header-container">
                <div class="scrollable-container">
                    <div class="header-right">
                        <nav>
                            <div class="menu-entry">
                                <a href="/home">Home</a>
                            </div>
                            <div class="menu-entry">
                                <a href="/blog">Blog</a>
                                <span class="submenu-icon"><span class="glyphicon glyphicon-chevron-down"></span></span>
                                <div class="submenu">
                                    <div>
                                        <a href="/blog">복음이의 블로그</a>
                                    </div>
                                </div>
                            </div>
                            <div class="menu-entry">
                                <a href="/about">About</a>
                            </div>
                            <div class="menu-entry">
                                <a href="/contact">Contact</a>
                            </div>
                            <c:choose>
								<c:when test="${sessionUser eq null }">
									<div class="menu-entry">
										<a href="/login">Login</a>
		                                <span class="submenu-icon"><span class="glyphicon glyphicon-chevron-down"></span></span>
		                                <div class="submenu">
		                                    <div>
		                                        <a href="/login#log" id ="log">로그인</a>
		                                        <a href="/login#reg" class ="reg">회원가입</a>
		                                    </div>
		                                </div>
	                               </div> 
								</c:when>
								<c:otherwise>
									<div class="menu-entry">
											<a href="/write">Write</a>
		                            </div>
									<div class="menu-entry">
										<a href="/logout">Logout</a>
	                               </div>
								</c:otherwise>
							</c:choose>                                           
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    