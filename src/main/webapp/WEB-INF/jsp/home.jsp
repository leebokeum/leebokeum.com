<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/common/header.jsp"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<body>
<c:import url="/common/nav.jsp"/>
<!-- Main Content -->
<div class="subheader">
    <div class="container-fluid">
        <a id="subheader-logo" href="/home"><img src="/img/logo_black.png" width="150" alt=""></a>
        <div class="subheader-content">
            <div class="subheader-left">
                <c:forEach var="menu" items="${menuList}" varStatus="status">
                    <c:if test="${sessionUser eq null && menu.menuLevel == '1' && menu.menuAuth == 'N'}">
                        <a class="scroll-to-link subheader-link" data-rel="1"
                           href="${menu.menuLink}">${menu.menuName}</a>
                    </c:if>

                    <c:if test="${sessionUser ne null && menu.menuLevel == '1'}">
                        <c:if test="${menu.menuName != 'Login'}">
                            <a class="scroll-to-link subheader-link" data-rel="1"
                               href="${menu.menuLink}">${menu.menuName}</a>
                        </c:if>
                    </c:if>
                </c:forEach>

            </div>
            <div class="subheader-right">
                <a class="button" href="#content-wrapper">맨 위로</a>
            </div>
        </div>
    </div>
</div>
<div id="content-wrapper">

    <div class="container-above-header">

    </div>

    <div class="blocks-container">

        <!-- BLOCK "TYPE 10" -->
        <div class="block type-10">
            <div class="main-banner-height">
                <div class="swiper-container" data-autoplay="5000" data-loop="1" data-speed="500" data-center="0"
                     data-slides-per-view="1">
                    <div class="swiper-wrapper">

                        <div class="swiper-slide">
                            <div class="container">
                                <div class="slide-container">
                                    <div class="slide-block nopadding col-sm-6">
                                        <div class="vertical-align">
                                            <div class="content">
                                                <img src="/img/slider-image-1.png" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="slide-block nopadding col-sm-6">
                                        <div class="vertical-align">
                                            <div class="content text-entry">
                                                <div class="price">Career Goals</div>
                                                <h3 class="title">가치를 창조하는 개발자</h3>
                                                <div class="text">개발자로서 저는 더 나은 가치를 추구합니다. 사람들에게 어떤 가치를 줄 수 있을까 항상
                                                    고민합니다. 건설적이고 긍정적인 영향을 주려고 힘씁니다.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="container">
                                <div class="slide-container">
                                    <div class="slide-block nopadding col-sm-6">
                                        <div class="vertical-align">
                                            <div class="content">
                                                <img src="/img/slider-image-2.png" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="slide-block nopadding col-sm-6">
                                        <div class="vertical-align">
                                            <div class="content text-entry">
                                                <div class="price">Identity</div>
                                                <h3 class="title_en" style="font-size: 30px;">I AM A NEW CREATION</h3>
                                                <div class="text">저는 제가 누구인지 압니다. 저의 정체성은 예수그리스도 안에 있습니다. 과거에 연연하지 않고
                                                    언제나 제가 새롭게 되었다는 것을 인식하고 살아갑니다.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="container">
                                <div class="slide-container">
                                    <div class="slide-block nopadding col-sm-6">
                                        <div class="vertical-align">
                                            <div class="content">
                                                <img src="/img/slider-image-3.png" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="slide-block nopadding col-sm-6">
                                        <div class="vertical-align">
                                            <div class="content text-entry">
                                                <div class="price">Values</div>
                                                <h3 class="title">존중하는 삶</h3>
                                                <div class="text">제 삶의 가치관은 '존중하는 삶'입니다. 상대방을 존중하고 따뜻한 마음으로 섬기길 원합니다. 내
                                                    앞에 있는 사람을 최고로 섬기는 것이 제 인생의 목표입니다.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="container">
                                <div class="slide-container">
                                    <div class="slide-block nopadding col-sm-6 col-sm-push-6">
                                        <div class="vertical-align">
                                            <div class="content">
                                                <img src="/img/slider-image-4.png" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="slide-block nopadding col-sm-6 col-sm-pull-6">
                                        <div class="vertical-align">
                                            <div class="content text-entry">
                                                <div class="price">Vision</div>
                                                <h3 class="title_en">IT MISSIONARY</h3>
                                                <div class="text">제 비전은 IT를 통해 전 세계에 복된 소식을 전하는 것입니다. IT는 하나님께서 주신 최고의
                                                    선교 도구입니다. 저는 IT를 통해 하나님 나라 확장에 동역하길 원합니다.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="pagination"></div>
                </div>
            </div>
            <div class="banner-tabs">
                <div class="container-fluid">
                    <div class="row">
                        <div class="tab-entry active col-md-3">
                            <div class="title">가치를 창조하는 개발자</div>
                            <div class="text">Career Goals</div>
                        </div>
                        <div class="tab-entry col-md-3">
                            <div class="title">I AM A NEW CREATION</div>
                            <div class="text">Identity</div>
                        </div>
                        <div class="tab-entry col-md-3">
                            <div class="title">존중하는 삶</div>
                            <div class="text">Values</div>
                        </div>
                        <div class="tab-entry col-md-3">
                            <div class="title">IT MISSIONARY</div>
                            <div class="text">Vision</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- BLOCK "TYPE 1" -->
        <div class="block type-1 scroll-to-block" data-rel="1">
            <div class="container">

                <div class="row wow fadeInDown" style="visibility: hidden; animation-name: none;">
                    <div class="block-header">
                        <div class="title">
                            풀스택 개발자
                        </div>
                        <a href="javascript:void addPlusFriend()">
                            <img src="https://developers.kakao.com/assets/img/about/logos/plusfriend/friendadd_small_yellow_rect.png"/>
                        </a>
                        <br/>
                        <script type='text/javascript'>
                            // 사용할 앱의 JavaScript 키를 설정해 주세요.
                            Kakao.init('ecd00a5c80333685992c68be5a531f0a');
                            function addPlusFriend() {
                                Kakao.PlusFriend.addFriend({
                                    plusFriendId: '_xfxiZVj' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
                                });
                            }
                        </script>
                    </div>
                </div>

                <div class="row wow fadeInUp" style="visibility: hidden; animation-name: none;">
                    <div class="icon-entry col-xs-12 col-sm-6  col-md-4">
                        <img src="/img/home/naver.png" alt="">
                        <div class="content">
                            <h3 class="title">현 네이버 개발자</h3>
                            <div class="text">네이버 비즈니스플랫폼 WORKPLACE SERVICE 팀</div>
                        </div>
                    </div>
                    <div class="icon-entry col-xs-12 col-sm-6  col-md-4">
                        <img src="/img/home/java.png" alt="">
                        <div class="content">
                            <h3 class="title">JAVA</h3>
                            <div class="text">자바는 내친구! 자바 마스터</div>
                        </div>
                    </div>
                    <div class="icon-entry col-xs-12 col-sm-6  col-md-4">
                        <img src="/img/home/spring.png" alt="">
                        <div class="content">
                            <h3 class="title">SpringBoot</h3>
                            <div class="text">SpringBoot를 이용한 빠른 서버사이드 개발</div>
                        </div>
                    </div>
                    <div class="icon-entry col-xs-12 col-sm-6  col-md-4">
                        <img src="/img/home/jpa.png" alt="">
                        <div class="content">
                            <h3 class="title">JPA</h3>
                            <div class="text">JPA, Hibernate 기반 ORM</div>
                        </div>
                    </div>
                    <div class="icon-entry col-xs-12 col-sm-6 col-md-4">
                        <img src="/img/home/html5.png" alt="">
                        <div class="content">
                            <h3 class="title">HTML5</h3>
                            <div class="text">HTML5 기반의 웹 표준을 준수</div>
                        </div>
                    </div>
                    <div class="icon-entry col-xs-12 col-sm-6  col-md-4">
                        <img src="/img/home/vue.png" alt="">
                        <div class="content">
                            <h3 class="title">Vue.js</h3>
                            <div class="text">Vue 프론트 프레임워크 개발</div>
                        </div>
                    </div>
                    <div class="icon-entry col-xs-12 col-sm-6  col-md-4">
                        <img src="/img/home/angular.png" alt="">
                        <div class="content">
                            <h3 class="title">Angular</h3>
                            <div class="text">Angular 프론트 프레임워크 개발</div>
                        </div>
                    </div>
                    <div class="icon-entry col-xs-12 col-sm-6  col-md-4">
                        <img src="/img/home/mysql.png" alt="">
                        <div class="content">
                            <h3 class="title">Mysql</h3>
                            <div class="text">관계형 데이터베이스 전문가</div>
                        </div>
                    </div>
                    <div class="icon-entry col-xs-12 col-sm-6  col-md-4">
                        <img src="/img/home/oracle.jpg" alt="">
                        <div class="content">
                            <h3 class="title">오라클 ERP</h3>
                            <div class="text">오라클 ERP 및 Database 개발 경력 5년</div>
                        </div>
                    </div>

                </div>

            </div>
        </div>

        <!-- BLOCK "TYPE 5" -->
        <div class="block type-5">
            <div class="container">

                <div class="row wow fadeInDown" style="visibility: hidden; animation-name: none;">
                    <div class="block-header col-md-6 col-md-offset-3 col-sm-12 col-sm-offset-0">
                        <h2 class="title">미래의 경쟁자</h2>
                        <div class="text">글로벌 IT 기업들과 어깨를 나란히</div>
                    </div>
                </div>

                <div class="wow fadeInUp" style="visibility: hidden; animation-name: none;">
                    <div class="swiper-container" data-autoplay="0" data-loop="0" data-speed="500" data-center="0"
                         data-slides-per-view="responsive" data-xs-slides="1" data-sm-slides="3" data-md-slides="5"
                         data-lg-slides="6">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <img src="/img/logo-1.png" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="/img/logo-2.png" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="/img/logo-3.png" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="/img/logo-4.png" alt="">
                            </div>
                            <div class="swiper-slide">
                                <img src="/img/logo-6.png" alt="">
                            </div>
                        </div>
                        <div class="pagination"></div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>
<hr>
<c:import url="/common/footer.jsp"/>
<script type="text/javascript">
    $(function () {
        $("body").removeClass().addClass("header-floated loaded");
        $(".menu-entry").eq(0).addClass("active");
    });
</script>
</body>

</html>