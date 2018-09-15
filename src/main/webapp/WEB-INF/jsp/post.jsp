<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta property="og:url" content="//leebokeum.com/content/${content.id }"/>
    <meta property="og:type" content="article"/>
    <meta property="og:title" content="${content.title}"/>
    <meta property="og:image:type" content="image/jpeg" />
    <c:choose>
        <c:when test="${content.repImg != null }">
            <meta property="og:image" content="//leebokeum.com/images/${content.repImg }"/>
        </c:when>
        <c:otherwise>
            <c:choose>
                <c:when test="${content.getOgImage() != '' }">
                    <meta property="og:image" content="${content.getOgImage() }"/>
                </c:when>
                <c:otherwise>
                    <meta property="og:image" content="//leebokeum.com/img/link.jpg" />
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>

    <meta property='og:description' content="${content.subTitle }"/>

    <link rel="apple-touch-icon" href="/img/icon.png"/>
    <link rel="shortcut icon" href="/img/icon.png"/>

    <title>leebokeum.com</title>

    <!-- Bootstrap Core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/idangerous.swiper.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/customizing.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <!-- <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet'
          type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
          rel='stylesheet'
          type='text/css'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link href="/ckeditor/contents.css" rel="stylesheet">
    <link href="/css/content.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/alert/alertify.min.css"/>

    <script>
        window.fbAsyncInit = function () {
            FB.init({
                appId: '1561168777532546',
                xfbml: true,
                version: 'v3.1'
            });
            FB.AppEvents.logPageView();
        };

        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {
                return;
            }
            js = d.createElement(s);
            js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>

</head>

<body>

<c:import url="/common/nav.jsp"/>

<div id="content-wrapper">

    <div class="container-above-header"></div>

    <div class="blocks-container">

        <div class="container blog-wrapper">
            <div class="row">
                <div class="col-md-9">

                    <div class="blog-entry wow fadeInLeft animated"
                         style="visibility: visible; animation-name: fadeInLeft;">
                        <div class="data-column">
                            <div class="date">
                                <span>${ fn:substring(content.createDate, 8, 10) }</span> ${ fn:substring(content.createDate, 0, 7) }
                            </div>
                            <div class="data-entry">
                                <span class="icon-entry like"></span><br>${content.likes }
                            </div>
                            <div class="data-entry">
                                <span class="icon-entry views"></span><br>${content.hit }
                            </div>
                            <div class="data-entry">
                                <span class="icon-entry comments"></span><br>${content.reply.size() }
                            </div>
                        </div>
                        <div class="content">
                            <h1 class="title">${content.title }</h1>
                            <div class="author">
                                <a href="#">Written</a> by <b><a href="/about">${content.createrName }</a></b>
                            </div>

                            <c:if test="${content.repImg != null }">
                                <div class="thumbnail-entry">
                                    <img class="thumbnail-img" src="//leebokeum.com/images/${content.repImg }"
                                         alt="">
                                </div>
                            </c:if>

                            <div class="typography-block cke_contents_ltr">
                                ${content.contents }
                            </div>

                            <div
                                    class="fb-like"
                                    data-share="true"
                                    data-width="450"
                                    data-show-faces="true">
                            </div>
                        </div>
                        <div class="clear"></div>
                        <c:if test="${sessionUser ne null }">
                            <div style="float: right">
                                <form action="/modify" method="post" class="inline-form">
                                    <input type="hidden" name="id" value="${content.id }">
                                    <div class="button">
                                        수정<input type="submit" value="">
                                    </div>
                                </form>
                                <form action="/delete" method="post" class="inline-form">
                                    <input type="hidden" name="id" value="${content.id }">
                                    <div class="button">
                                        삭제<input type="submit" value="">
                                    </div>
                                </form>
                            </div>
                        </c:if>
                    </div>

                    <div class="blog-detail-content">
                        <div class="blog-comments">
                            <div class="row wow fadeInDown animated"
                                 style="visibility: visible; animation-name: fadeInDown;">
                                <div class="block-header col-md-6 col-md-offset-3 col-sm-12 col-sm-offset-0">
                                    <h2 class="title">
                                        댓글 (<span>${content.reply.size() }</span>)
                                    </h2>
                                </div>
                            </div>

                            <div class="comment-wrapper">
                                <c:forEach var="reply" items="${content.reply }">
                                    <div class="comment-entry wow fadeInUp animated"
                                         style="visibility: visible; animation-name: fadeInUp;">
                                        <img class="comment-icon img-circle" src="/img/person2.png" alt="">
                                        <div class="title">
                                            <span class="name">${reply.createrName }</span> , ${reply.createDate }
                                        </div>
                                        <div class="description">${reply.contents }</div>
                                    </div>
                                </c:forEach>
                            </div>

                            <div class="form-block wow fadeInUp animated"
                                 style="visibility: visible; animation-name: fadeInUp;">
                                <div class="form-wrapper">
                                    <form id="replyForm">
                                        <input type="hidden" name="parentId" value="${content.id}">
                                        <div class="field-entry">
                                            <label for="replyName">이름 *</label> <input type="text" required="required"
                                                                                       name="createrName"
                                                                                       id="replyName">
                                        </div>
                                        <div class="field-entry">
                                            <label for="replyEmail">이메일 *</label> <input type="email"
                                                                                         required="required"
                                                                                         name="createrEmail"
                                                                                         id="replyEmail">
                                        </div>
                                        <div class="field-entry">
                                            <label for="replyMessage">댓글내용</label>
                                            <textarea id="replyMessage" name="contents" required></textarea>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-8 col-md-offset-2">
                                                <div class="button">
                                                    댓글저장<input type="submit" value="">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <c:import url="/common/side.jsp"/>
            </div>
        </div>
    </div>
</div>

<hr>

<c:import url="/common/footer.jsp"/>
<script src="/js/alert/alertify.min.js"></script>

<script type="text/javascript">
    $(function () {
        $(".menu-entry").eq(1).addClass("active");

        function printTime() {
            var now = new Date(); // 현재시간
            var nowTime = now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate() + "-" + now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();
            return nowTime;
        };

        $("#replyForm").submit(function (e) {
            $.ajax({
                type: "POST",
                url: "/replySave",
                dataType: "json",
                data: $("#replyForm").serialize(), // serializes the form's elements.
                success: function (data) {
                    $("#replyName").val("");
                    $("#replyEmail").val("");
                    $("#replyMessage").val("");
                    $(".comment-wrapper").append(
                        '<div class="comment-entry wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">' +
                        '<img class="comment-icon img-circle" src="/img/person2.png">' +
                        '<div class="title">' +
                        '<span class="name">' + data.createrName + ' , ' + '</span>' + printTime() +
                        '</div>' +
                        '<div class="description">' + data.contents + '</div>' +
                        '</div>');
                    alertify.success('등록되었습니다');
                }
            });
            e.preventDefault(); // avoid to execute the actual submit of the form.
        });
    });

</script>
</body>

</html>