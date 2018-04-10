<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/common/header.jsp" />
<link href="/css/write.css" type="text/css" rel="stylesheet" />
<script src="/ckeditor/ckeditor.js"></script>
<body>
	<c:import url="/common/nav.jsp" />
	<!-- Page Header -->
	<!-- Set your background image for this header on the line below. -->
	<header class="intro-header" style="background-image: url('/img/about-bg.png')">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
					<div class="page-heading">
						<h1>${about.title }</h1>
						<hr class="small">
						<span class="subheading">${about.sub_title }</span>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-body">

				<form class="form-horizontal" role="form" action="./AboutController" method="post">
					<div class="form-group">
						<label class="control-label col-sm-2" for="title">제목 :</label>
						<div class="col-sm-10">
							<c:choose>
								<c:when test="${about ne null }">
									<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해주세요" value="${about.title }" required="required">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해주세요" required="required">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="sub_title">부제목 :</label>
						<div class="col-sm-10">
							<c:choose>
								<c:when test="${about ne null }">
									<input type="text" class="form-control" name="sub_title" id="sub_title" placeholder="제목을 입력해주세요" value="${about.sub_title }">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" name="sub_title" id="sub_title" placeholder="제목을 입력해주세요">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="content">내용 :</label>
						<div class="col-sm-10">
							<c:choose>
								<c:when test="${about ne null }">
									<textarea id="editor" name="content" rows="50" cols="80" class="form-control" placeholder="내용을 입력해주세요">${about.content}</textarea>
								</c:when>
								<c:otherwise>
									<textarea id="editor" name="content" rows="50" cols="80" class="form-control" placeholder="내용을 입력해주세요"></textarea>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default btn-lg">Submit</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<hr>
	<c:import url="/common/footer.jsp" />
	<script type="text/javascript">
		$(function() {
			var editor = CKEDITOR.replace('editor', {
				height : 500
			});
		});
	</script>
</body>

</html>