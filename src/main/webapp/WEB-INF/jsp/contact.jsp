<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/common/header.jsp"/>
<link rel="stylesheet" type="text/css" href="/css/alert/alertify.min.css"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<body>
<c:import url="/common/nav.jsp"/>
<div id="content-wrapper">

    <div class="container-above-header">

    </div>

    <div class="blocks-container">

        <div class="block type-10">
            <!-- <div class="main-banner-height"> -->
            <div class="container about">
                <div class="row wow fadeInDown" style="visibility: hidden; animation-name: none;">
                    <img class="img_contact" alt="" src="/img/contact-bg.png" width="100%;">
                    <img class="img_contact2" alt="" src="/img/contact-bg2.png" width="100%;">
                </div>
            </div>
        </div>

        <!-- BLOCK "TYPE 3" -->
        <div class="block type-3">
            <div class="container">

                <div class="block-header">
                    <div class="title">연락 정보 </div>
                    <div class="text" style="margin-top: 10px;">저에게 연락하시려면 카카오톡 친구 추가 또는 아래를 참고하세요.</div>
                    <a href="javascript:void addPlusFriend()">
                        <img src="https://developers.kakao.com/assets/img/about/logos/plusfriend/friendadd_small_yellow_rect.png"/>
                    </a>
                </div>
                <!-- </div> -->
                <div class="row">
                    <div class="icon-entry col-sm-4 wow fadeInLeft animated" data-wow-delay="0.3s"
                         style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInLeft;">
                        <img class="img-circle" alt="" src="/img/icon-120.png">
                        <div class="content">
                            <h3 class="title">근무지</h3>
                            <div class="text">경기도 성남시 분당구 분당내곡로 117  <br> 크래프톤타워 11층 <br> 네이버 비즈니스 플랫폼</div>
                        </div>
                    </div>
                    <div class="icon-entry col-sm-4 wow fadeInUp animated" data-wow-delay="0.4s"
                         style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">
                        <img class="img-circle" alt="" src="/img/icon-121.png">
                        <div class="content">
                            <h3 class="title">연락처</h3>
                            <div class="text"><b>사무실:</b> 031-600-6136 <br> <b>Mobile:</b> 010-9915-1341
                            </div>
                        </div>
                    </div>
                    <div class="icon-entry col-sm-4 wow fadeInRight animated" data-wow-delay="0.3s"
                         style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInRight;">
                        <img class="img-circle" alt="" src="/img/icon-122.png">
                        <div class="content">
                            <h3 class="title">Email</h3>
                            <div class="text"><b>회사메일:</b> bokeum.lee@navercorp.com <br> <b>Gmail:</b> leebokeum87@gmail.com
                                <br> <b>Hanmail:</b> leebokeum@hanmail.net
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!-- BLOCK "TYPE 18" -->
        <div class="block">
            <div class="container">
                <div class="row">

                    <div class="col-md-10 col-md-offset-1 wow fadeInUp animated"
                         style="visibility: visible; animation-name: fadeInUp;">
                        <div class="form-block">
                            <img class="img-circle form-icon" src="/img/icon-123.png" alt="">

                            <div class="form-wrapper">
                                <div class="row">
                                    <div class="block-header col-md-8 col-md-offset-2">
                                        <h2 class="title">메시지 남기기
                                            <a href="javascript:void plusFriendChat()">
                                                <img src="https://developers.kakao.com/assets/img/about/logos/plusfriend/consult_small_yellow_pc.png"/>
                                            </a>
                                        </h2>


                                        <div class="text">여기에 메시지를 남겨주시면 저에게 즉시 알림이 옵니다</div>
                                    </div>
                                </div>
                                <form class="js-contact-form">
                                    <div class="field-entry">
                                        <label for="name">성함 *</label>
                                        <input type="text" name="name" required="" value="" id="name">
                                    </div>
                                    <div class="field-entry">
                                        <label for="email">Email *</label>
                                        <input type="email" name="email" required="" value="" id="email">
                                    </div>
                                    <div class="field-entry">
                                        <label for="contents">Message</label>
                                        <textarea id="contents" name="contents"></textarea>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-2">
                                            <div class="button">메시지 전송<input type="submit" value=""></div>
                                        </div>
                                    </div>
                                </form>
                                <div class="ajax-result">
                                    <div class="success"></div>
                                    <div class="error"></div>
                                </div>
                                <div class="ajax-loader"></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</div>

<hr>
<c:import url="/common/footer.jsp"/>
<script type='text/javascript'>
    //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('ecd00a5c80333685992c68be5a531f0a');

    function addPlusFriend() {
        Kakao.PlusFriend.addFriend({
            plusFriendId: '_xfxiZVj' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
        });
    }

    function plusFriendChat() {
        Kakao.PlusFriend.chat({
            plusFriendId: '_xfxiZVj' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
        });
    }

    //]]>
</script>
<script src="/js/alert/alertify.min.js"></script>
<script type="text/javascript">
    $(function () {
        $(".menu-entry").eq(3).addClass("active");
    });
</script>
</body>
</html>