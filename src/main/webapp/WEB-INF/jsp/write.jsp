<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/common/header.jsp" />
<link href="/css/write.css" type="text/css" rel="stylesheet" />
<link href="/css/sweetalert.css" type="text/css" rel="stylesheet" />
<script src="/ckeditor/ckeditor.js"></script>
<script src="/js/sweetalert.min.js"></script>
<!-- http://lipis.github.io/bootstrap-sweetalert/ -->
<c:if test="${sessionUser eq null }">
	<c:redirect url="/home" />
</c:if>

<body>
	<c:import url="/common/nav.jsp" />

	<c:choose>
		<c:when test="${content ne null}">
			<c:url var="actionUrl" value="/update" />
		</c:when>
		<c:otherwise>
			<c:url var="actionUrl" value="/save" />
		</c:otherwise>
	</c:choose>
	<div id="content-wrapper">
		<div class="container-above-header"></div>
		<div class="blocks-container">
			<div class="container blog-wrapper wirte">
				<div class="row">
					<div class="blog-entry write-form wow fadeInLeft animated " style="visibility: hidden; animation-name: none;">
						<form action="${actionUrl }" method="post" enctype="multipart/form-data">
							<c:choose>
								<c:when test="${content ne null }">
									<div class="field-columns write-columns">
										<div class="column">
											<div class="checkbox-entry checkbox">
												<input type="checkbox" name="noticeFlag" value="${content.noticeFlag }"> <label>공지사항</label>
											</div>
										</div>
										<div class="column">
											<div class="checkbox-entry checkbox">
												<input type="checkbox" name="secretFlag" value="${content.secretFlag }"> <label>나만보기</label>
											</div>
										</div>
									</div>
									<div class="field-entry">
										<label for="field-1">제목 *</label> <input type="hidden" name="id" value="${content.id }"> <input type="text" required="required"
											name="title" placeholder="제목을 입력해주세요" value="${content.title }" id="field-1">
									</div>
									<div class="field-entry">
										<label for="img1">대표 이미지(1장, 선택)</label>
										<input type="file" name="repImage" accept="image/*" id="img1"/>
									</div>
									<div class="field-entry">
										<label for="field-2">서두 (50글자 이내) *</label> <textarea required="required" name="subTitle" placeholder="서두를 입력하세요(50글자 이내)" id="field-2"> ${content.subTitle }</textarea>
									</div>
									<div class="field-entry">
										<label for="field-1">내용 *</label>
										<textarea id="editor" name="contents" placeholder="내용을 입력해주세요">${content.contents}</textarea>
									</div>
									<div class="field-entry">
										<label for="tags">태그 *</label> <input type="text" required="required" name="tag" placeholder="태그를 입력하세요(쉼표로 구분 해서 넣기)" id="tags"  value="${content.tag }">
									</div>
									<div class="field-entry">
										<label for="field-1">작성자 *</label> <input type="text" name="createrName" placeholder="작성자 이름" value="${content.createrName }" required="required">
									</div>
									<div class="field-columns write-columns">
										<div class="column">
											<div class="field-entry">
												<label>카테고리</label>
												<div class="block-form-wrapper">
													<div class="block-form">
														<select class="form-control" name="categoryId">
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="column">
											<div class="field-entry">
												<label>카테고리 추가</label>
												<div class="block-form-wrapper">
													<div class="block-form submit">
														<input type="submit" form="addMenuForm" value="추가"> <input type="text" name ="categoryName" id="addMenu" form="addMenuForm"
																												   placeholder="추가할 카테고리명을 입력하세요.">
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="field-columns write-columns">
										<div class="column">
											<div class="checkbox-entry checkbox">
												<input type="checkbox" name="noticeFlag"> <label>공지사항</label>
											</div>
										</div>
										<div class="column">
											<div class="checkbox-entry checkbox">
												<input type="checkbox" name="secretFlag"> <label>나만보기</label>
											</div>
										</div>
									</div>
									<div class="field-entry">
										<label for="field-1">제목 *</label> <input type="text" required="required" name="title" placeholder="제목을 입력해주세요" id="field-1">
									</div>
									<div class="field-entry">
										<label for="img1">대표 이미지(1장, 선택)</label>
										<input type="file" name="repImage" accept="image/*" id="img1"/>
									</div>
									<div class="field-entry">
										<label for="field-2">서두 (50글자 이내) *</label> <textarea required="required" name="subTitle" placeholder="서두를 입력하세요(50글자 이내)" id="field-2"></textarea>
									</div>
									<div class="field-entry">
										<label for="editor">내용 *</label>
										<textarea id="editor" name="contents" placeholder="내용을 입력해주세요"></textarea>
									</div>
									<div class="field-entry">
										<label for="tags">태그 *</label> <input type="text" required="required" name="tag" placeholder="태그를 입력하세요(쉼표로 구분 해서 넣기)" id="tags">
									</div>
									<div class="field-entry">
										<label for="createrName">작성자 *</label> <input type="text" name="createrName" value="${sessionUser.userName }" placeholder="작성자 이름" required="required" id="createrName">
									</div>
									<div class="field-columns write-columns">
										<div class="column">
											<div class="field-entry">
												<label>카테고리</label>
												<div class="block-form-wrapper">
													<div class="block-form">
														<select class="form-control" name="categoryId">
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="column">
											<div class="field-entry">
												<label>카테고리 추가</label>
												<div class="block-form-wrapper">
													<div class="block-form submit">
														<input type="submit" form="addCategoryForm" value="추가"> <input type="text" name ="categoryName" id="addCategory" form="addCategoryForm"
															placeholder="추가할 카테고리명을 입력하세요.">
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
							<div class="block-button-container write-button">
								<div class="button">
									SUBMIT<input type="submit">
								</div>
							</div>
						</form>
						<form id="addCategoryForm"></form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<c:import url="/common/footer.jsp" />
	<script type="text/javascript">
		$(function() {
            $(".menu-entry").eq(4).addClass("active");

			var editor = CKEDITOR.replace('editor', {
				height : 500
			});



            $('input[type=checkbox]').change(function() {
                if(this.checked) {
                    $(this).val('Y');
                }else{
                    $(this).val('N');
				}
            });
			
			$.ajax({
				type : 'POST',
				dataType : 'json',
				url : '/category',
				success : function(result) {

					for(var i =0; i < result.length; i++){
						 $('select').append(
									$("<option></option>").attr("value", result[i].id).text(result[i].categoryName));
					}
				}
			});
			

			$("#addCategoryForm").submit(
					function(e) {
						$.ajax({
							type : 'POST',
							dataType : 'json',
							url : '/addCategory',
							data : $("#addCategoryForm").serialize(),
							success : function(result) {
								 $('select').append(
										$("<option></option>").attr("value", result.id).text(result.categoryName));
								 swal('추가되었습니다', result.categoryName + " 이 추가되었습니다.", "success")
							}
						});

						e.preventDefault();
					});
		});
	</script>
</body>

</html>