<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<body  class="loaded">--%>
<header class="">
    <div class="container">
        <div id="logo-wrapper">
            <div class="cell-view"><a id="logo" href="/home"><img src="/img/logo_black.png" width="150" alt=""></a>
            </div>
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

                        <c:forEach var="menu" items="${menuList}" varStatus="status">


                            <c:if test="${sessionUser eq null && menu.menuLevel == '1' && menu.menuTargetYn == 'N'}">
                                <div class="menu-entry">
                                    <a href="${menu.menuLink}">${menu.menuName}</a>
                                    <c:if test="${!empty(menu.subMenu)}">
                                            <span class="submenu-icon"><span
                                                    class="glyphicon glyphicon-chevron-down"></span></span>
                                        <div class="submenu">
                                            <div>
                                                <c:forEach var="subMenu" items="${menu.subMenu}" varStatus="status">
                                                    <c:choose>
                                                        <c:when test="${subMenu.menuName == '로그인'}">
                                                            <a href="${subMenu.menuLink}"
                                                               id="log">${subMenu.menuName}</a>
                                                        </c:when>
                                                        <c:when test="${subMenu.menuName == '회원가입'}">
                                                            <a href="${subMenu.menuLink}"
                                                               class="reg">${subMenu.menuName}</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="${subMenu.menuLink}">${subMenu.menuName}</a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </c:if>

                            <c:if test="${sessionUser ne null && menu.menuLevel == '1'}">
                                <div class="menu-entry">
                                    <c:if test="${menu.menuName != 'Login'}">
                                        <a href="${menu.menuLink}">${menu.menuName}</a>
                                        <c:if test="${!empty(menu.subMenu)}">
                                            <span class="submenu-icon"><span
                                                    class="glyphicon glyphicon-chevron-down"></span></span>
                                            <div class="submenu">
                                                <div>
                                                    <c:forEach var="subMenu" items="${menu.subMenu}" varStatus="status">
                                                        <a href="${subMenu.menuLink}">${subMenu.menuName}</a>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:if>
                                </div>
                            </c:if>
                        </c:forEach>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</header>
    