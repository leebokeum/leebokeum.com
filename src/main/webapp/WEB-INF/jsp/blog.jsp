<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:import url="/common/header.jsp" />

<c:import url="/common/nav.jsp" />
<!-- Main Content -->
<body>
<div id="content-wrapper">
	<div class="container-above-header"></div>
	<div class="blocks-container">
		<div class="container blog-wrapper">
			<div class="row">
				<div class="col-md-9">
					<c:forEach var="content" items="${contentList.content }">
						<div class="blog-entry wow fadeInLeft animated" style="visibility: hidden; animation-name: none;">
							<div class="data-column">
								<div class="date">
									<span>${ fn:substring(content.createDate, 8, 10) }</span> ${ fn:substring(content.createDate, 0, 7) }
								</div>
								<div class="data-entry">
									<span class="icon-entry like"></span><br>${content.likes}
								</div>
								<div class="data-entry">
									<span class="icon-entry views"></span><br>${content.hit}
								</div>
								<div class="data-entry">
									<span class="icon-entry comments"></span><br>${content.reply.size()}
								</div>
							</div>
							<div class="content">
									<c:choose>
										<c:when test="${content.repImg ne null }">
											<a class="thumbnail-entry" href="/content/${content.id }" >
											<img  class="thumbnail-img" src="//leebokeum.com/images/${content.repImg }" alt="">
											</a> <a class="title" href="/content/${content.id }">${content.title }</a>
										</c:when>
										<c:otherwise>
											<a class="thumbnail-entry" href="/content/${content.id }">
												<blockquote>
													<p>${content.title }</p>
													<footer><cite>leebokeum.com</cite>, ${content.createrName }</footer>
												</blockquote>
											</a>
										</c:otherwise>
									</c:choose>
								<div class="author">
									<a href="/content/${content.id }">Written</a> by <b>${content.createrName }</b>
								</div>
								<div class="description">${content.subTitle }</div>
								<a class="button" href="/content/${content.id }">Read More</a>
							</div>
							<div class="clear"></div>
						</div>
					</c:forEach>
					<!-- <div class="blog-entry wow fadeInLeft" style="visibility: hidden; animation-name: none;">
						<div class="data-column">
							<div class="date">
								<span>26</span> Feb 2014
							</div>
							<div class="data-entry">
								<span class="icon-entry like"></span><br>821
							</div>
							<div class="data-entry">
								<span class="icon-entry views"></span><br>1028
							</div>
							<div class="data-entry">
								<span class="icon-entry comments"></span><br>58
							</div>
						</div>
						<div class="content">
							<a class="thumbnail-entry" href="blog-detail.html">
								<div class="embed-responsive embed-responsive-16by9">
									<iframe src="https://player.vimeo.com/video/33031367" width="500" height="281" frameborder="0" webkitallowfullscreen="" mozallowfullscreen=""
										allowfullscreen=""></iframe>
								</div>
							</a> <a class="title" href="blog-detail.html">Phasellus vel odio commodo, pharetra urna sit amet, gravida nibh</a>
							<div class="author">
								<a href="blog-detail.html">Tech</a> by <b>Dorian Gray</b>
							</div>
							<div class="description">Integer vitae rhoncus enim. Nam interdum vitae leo in viverra. Interdum et malesuada fames ac ante ipsum primis
								in faucibus. Ut fermentum risus in enim elementum pretium. Aliquam faucibus mattis nunc quis lobortis. In pulvinar eros sed purus sollicitudin
								auctor. Vivamus facilisis odio in nisi gravida euismod</div>
							<a class="button" href="blog-detail.html">Read More</a>
						</div>
						<div class="clear"></div>
					</div> -->
					<div class="paginator wow fadeInUp animated" style="visibility: hidden; animation-name: none;">
						<ul>
							<c:forEach var="i" begin="${pageBlock.firstPage }" end="${pageBlock.lastPage }">
								<c:choose>
									<c:when test="${i == (contentList.number+1)}">
										<li><a class="active" href="?page=${i-1}">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="?page=${i-1}">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
						<div>
							<c:choose>
								<c:when test="${pageBlock.currentBlock != 1}">
									<a class="button" href="?page=${pageBlock.firstPage-2}">Prev Page</a>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${(contentList.number+1) != 1}">
											<a class="button" href="?page=${contentList.number-1}">Prev Page</a>
										</c:when>
										<c:otherwise>
											<a class="button" href="#">Prev Page</a>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${pageBlock.currentBlock != pageBlock.totalBlock}">
									<a class="button" href="?page=${pageBlock.lastPage}">Next Page</a>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${(contentList.number+1) != pageBlock.lastPage}">
											<a class="button" href="?page=${contentList.number+1}">Prev Page</a>
										</c:when>
										<c:otherwise>
											<a class="button" href="#">Next Page</a>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="clear"></div>
					</div>
				</div>

				<c:import url="/common/side.jsp" />
			</div>
		</div>
	</div>
</div>
<hr>
<c:import url="/common/footer.jsp" />
<script type="text/javascript">
		$(function() {
			$(".menu-entry").eq(1).addClass("active");
		});
	</script>
</body>
</html>