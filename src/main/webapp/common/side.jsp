<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-md-3 wow fadeInRight animated">
	<div class="search-form">
		<form>
			<input type="text" placeholder="Keyword ..."> <input type="submit" value="">
		</form>
	</div>
	<div class="side-menu">
		<div class="title">블로그 카테고리</div>
		<c:choose>
			<c:when test="${categoryId eq null}">
				<a href="/blog" class="side-menu-item active"> <span class="glyphicon glyphicon-chevron-right"></span>전체</a>
			</c:when>
			<c:otherwise>
				<a href="/blog" class="side-menu-item"> <span class="glyphicon glyphicon-chevron-right"></span>전체</a>
			</c:otherwise>
		</c:choose>

		<c:forEach var="category" items="${categoryList }">
			<c:choose>
				<c:when test="${categoryId eq category.id}">
					<a href="/blog/${category.id}" class="side-menu-item active"> <span class="glyphicon glyphicon-chevron-right"></span>${category.categoryName}</a>
				</c:when>
				<c:otherwise>
					<a href="/blog/${category.id}" class="side-menu-item"> <span class="glyphicon glyphicon-chevron-right"></span>${category.categoryName}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

	</div>
		 <div class="side-menu">
			<div class="title">인기 게시물</div>
			<div class="row nopadding">
				<div class="col-xs-12 col-sm-6 col-md-12 nopadding">
					<c:forEach var="content" items="${noticeList}" varStatus="status">
						<div class="side-menu-image-item">
							<c:if test="${content.img1 != null }">
								<a class="image" href="/content/${content.id}">
									<img src="http://leebokeum.com/images/${content.img1 }" alt="">
								</a>
							</c:if>
							  <a class="title" href="/content/${content.id}">${content.title}"</a>
							<div class="author">
								<a href="/content/${content.id}">Write</a> by <b>${content.createrName}"</b>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	<div class="side-menu">
		<div class="title">인기태그</div>
		<div class="tags-wrapper">
			<c:if test="${contentList ne null}">
				<c:forEach var="list" items="${contentList.content}" varStatus="status">
					<c:forEach var="tag" items="${list.getTagSplit() }">
						<a class="tag active" href="/blog">${tag}</a>
					</c:forEach>
				</c:forEach>
			</c:if>
			<c:if test="${content ne null}">
				<c:forEach var="tag" items="${content.getTagSplit() }">
					<a class="tag active" href="/blog">${tag}</a>
				</c:forEach>
			</c:if>
		</div>
	</div>
</div>