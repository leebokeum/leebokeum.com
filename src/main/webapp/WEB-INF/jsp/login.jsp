<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/common/header.jsp"/>
<link rel="stylesheet" type="text/css" href="/css/alert/alertify.min.css"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<body>
<c:import url="/common/nav.jsp"/>
<div id="content-wrapper">
    <div class="container-above-header"></div>
    <div class="blocks-container">
        <!-- BLOCK "TYPE 18" -->
        <div class="block">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 wow fadeInUp" id="login"
                         style="visibility: hidden; animation-name: none;">
                        <div class="form-block">
                            <img class="img-circle form-icon" src="/img/icon-118.png" alt="">

                            <div class="form-wrapper">
                                <div class="row">
                                    <div class="block-header">
                                        <h2 class="title">로그인</h2>
                                        <div class="text">leebokem.com에 글을 쓰려면 로그인을 하셔야 합니다.</div>
                                    </div>
                                </div>
                                <form id="loginForm">
                                    <div class="field-entry">
                                        <label for="field-1">Login ID *</label> <input type="text" required="required"
                                                                                       name="userId"
                                                                                       placeholder="ID를 입력하세요."
                                                                                       id="field-1">
                                    </div>
                                    <div class="field-entry">
                                        <label for="field-2">Your Password *</label> <input type="password"
                                                                                            required="required"
                                                                                            name="password"
                                                                                            placeholder="비밀번호를 입력하세요."
                                                                                            id="field-2">
                                    </div>
                                    <a class="simple-link" href="#"><span
                                            class="glyphicon glyphicon-chevron-right"></span>비밀번호를 잊어버리셨나요?</a><br>
                                    <a class="simple-link reg"><span class="glyphicon glyphicon-chevron-right"></span>지금
                                        회원가입하기</a><br>
                                    <div class="button">
                                        로그인<input type="submit">
                                    </div>
                                </form>
                                <a id="custom-login-btn" href="javascript:loginWithKakao()">
                                    <img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="100%" style="margin-top: 5px"/>
                                <script type='text/javascript'>
                                    //<![CDATA[
                                    // 사용할 앱의 JavaScript 키를 설정해 주세요.
                                    Kakao.init('ecd00a5c80333685992c68be5a531f0a');
                                    // 카카오 로그인 버튼을 생성합니다.
                                    function loginWithKakao() {
                                        // 로그인 창을 띄웁니다.
                                        Kakao.Auth.login({
                                            success: function(authObj) {
                                                // 로그인 성공시, API를 호출합니다.
                                                Kakao.API.request({
                                                    url: '/v2/user/me',
                                                    success: function(user) {
                                                        $.ajax({
                                                            type: "POST",
                                                            url: "/kakaoLogin",
                                                            dataType: "json",
                                                            data: user, // serializes the form's elements.
                                                            success: function (data) {
                                                                if (data == '500') {
                                                                    alertify.error("승인대기중인 ID입니다");
                                                                } else if (data == '200') {
                                                                    location.href = "/home";
                                                                } else {
                                                                    alertify.error("로그인정보를 확인해주세요");
                                                                }
                                                            }
                                                        });
                                                    },
                                                    fail: function(error) {
                                                        alert(JSON.stringify(error));
                                                    }
                                                });
                                                //window.location.href = 'http://www.abc.com/';
                                            },
                                            fail: function(err) {
                                                alert(JSON.stringify(err));
                                            }
                                        });
                                    };

                                    //]]>
                                </script>
                            </div>
                        </div>
                    </div>

                    <div class="clear"></div>
                    <%--<div id="register"></div>--%>

                    <div class="col-md-6 col-md-offset-3 wow fadeInUp" id="register"
                         style="visibility: hidden; animation-name: none;">
                        <div class="form-block">
                            <img class="img-circle form-icon" src="/img/icon-119.png" alt="">

                            <div class="form-wrapper">
                                <div class="row">
                                    <div class="block-header">
                                        <h2 class="title">회원가입</h2>
                                        <div class="text">leebokeum.com은 관리자의 승인하에 가입할 수 있습니다.</div>
                                    </div>
                                </div>
                                <form method="post" action="/join">
                                    <div class="field-entry">
                                        <label for="field-3">이메일 *</label> <input type="email" required="required"
                                                                                  value="" id="field-3" name="userId">
                                    </div>
                                    <div class="field-entry">
                                        <label for="field-6">이름 *</label> <input type="text" required="required"
                                                                                 value="" id="field-6" name="userName">
                                    </div>
                                    <div class="field-entry">
                                        <label for="field-4">비밀번호 *</label> <input type="password" required="required"
                                                                                   value="" id="field-4"
                                                                                   name="password">
                                    </div>
                                    <div class="field-entry">
                                        <label for="field-5">비밀번호 확인 *</label> <input type="password"
                                                                                      required="required" value=""
                                                                                      id="field-5">
                                    </div>
                                    <div class="checkbox-entry checkbox active">
                                        <input type="checkbox" checked=""> <label>leebokeum.com의 새로운 소식을 받아보고
                                        싶어요.</label>
                                    </div>
                                    <!-- <div class="checkbox-entry checkbox">
                                        <input type="checkbox"> <label>I agree with the Terms and Conditions</label>
                                    </div>
                                    <div class="checkbox-entry radio active">
                                        <input type="radio" name="radiobutton" checked=""> <label>I Am Private User</label>
                                    </div>
                                    <div class="checkbox-entry radio">
                                        <input type="radio" name="radiobutton"> <label>I Am Corporate User</label>
                                    </div> -->
                                    <div class="button">
                                        회원가입<input type="submit" value="">
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>


<c:import url="/common/footer.jsp"/>
<script src="/js/alert/alertify.min.js"></script>

<script type="text/javascript">
    window.onload = function () {
        var url = document.location.href.match(/[^\/]+$/)[0];
        if (url == "login.jsp#reg") {
            $('body, html').animate({'scrollTop': $('#register').offset().top - 100}, 800);
        }
    };

    $(function () {
        $('.reg').click(function () {
            $('body, html').animate({'scrollTop': $('#register').offset().top - 100}, 800);
        });

        $('#log').click(function () {
            $('body, html').animate({'scrollTop': $('#login').offset().top - 150}, 800);
        });

        $(".menu-entry").eq(5).addClass("active");

        $("#loginForm").submit(function (e) {
            $.ajax({
                type: "POST",
                url: "/sign",
                dataType: "json",
                data: $("#loginForm").serialize(), // serializes the form's elements.
                success: function (data) {
                    if (data == '500') {
                        alertify.error("승인대기중인 ID입니다");
                    } else if (data == '200') {
                        location.href = "/home";
                    } else {
                        alertify.error("로그인정보를 확인해주세요");
                    }
                }
            });
            e.preventDefault(); // avoid to execute the actual submit of the form.
        });
    });
</script>
</body>

</html>