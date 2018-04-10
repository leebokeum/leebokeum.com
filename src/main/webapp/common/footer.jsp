<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Footer -->
<footer>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
				<ul class="list-inline text-center">
					<li><a href="https://twitter.com/leebokeum87" target="_blank" class="twitter"> <span class="fa-stack fa-lg"> <i class="fa fa-circle fa-stack-2x"></i>
								<i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
						</span>
					</a></li>
					<li><a href="https://www.facebook.com/leebokeum87" target="_blank" class="facebook"> <span class="fa-stack fa-lg"> <i
								class="fa fa-circle fa-stack-2x"></i> <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
						</span>
					</a></li>
					<li><a href="https://github.com/leebokeum" target="_blank"  class="github"> <span class="fa-stack fa-lg"> <i class="fa fa-circle fa-stack-2x"></i>
								<i class="fa fa-github fa-stack-1x fa-inverse"></i>
						</span>
					</a></li>
				</ul>
				<p class="copyright text-muted">Copyright &copy; leebokeum 2016</p>
			</div>
		</div>
	</div>
</footer>


<!-- jQuery -->
<script src="/js/jquery-2.2.4.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/js/bootstrap.min.js"></script>

<script src="/js/idangerous.swiper.min.js"></script>
<script src="/js/global.js"></script>
<script src="/js/wow.min.js"></script>
<script>
	var wow = new WOW({
		boxClass : 'wow', // animated element css class (default is wow)
		animateClass : 'animated', // animation css class (default is animated)
		offset : 100, // distance to the element when triggering the animation (default is 0)
		mobile : true, // trigger animations on mobile devices (default is true)
		live : true, // act on asynchronously loaded content (default is true)
		callback : function(box) {
			// the callback is fired every time an animation is started
			// the argument that is passed in is the DOM node being animated
		}
	});
	wow.init();
</script>
<script type="text/javascript">
	$(function() {
		/* var url = document.location.href.match(/[^\/]+$/)[0]; */
		
		var subHeaderHeight = ($('.subheader').length)?$('.subheader').height():0;
		
		$('#test1').click(function(){
			/* var index = $('.scroll-to-link').index(this); */
			/* attr('href') */
			var index = 1;
			/* $('body, html').animate({'scrollTop':$('.scroll-to-block').eq(index).offset().top - (subHeaderHeight + 90)}, 800); */
			$('body, html').animate({'scrollTop':$('.scroll-to-block').eq(index).offset().top - (subHeaderHeight + 90)}, 800);
		});
	});
</script>
