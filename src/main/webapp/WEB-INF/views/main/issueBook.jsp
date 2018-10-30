<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="b_arrow_box">
	<button class="slide_aw left" id="ib_awL">
		<span class="aw_count_ib"></span>
	</button>	
	<button class="slide_aw right" id="ib_awR">
		<span class="aw_count_ib"></span>
	</button>
</div>
<div class="swiper-container swiper5">
	<div class="swiper-wrapper">
		<c:forEach var="ib" items="${lst }">
			<div class="swiper-slide">
				<div class="wrap_ib_img">
					<a href="<%=cp%>/tempbook.action?isbn=${ib.isbn}">
						<img src="<%=cp%>/resources/image/book/${ib.bookImage }">
					</a>
					<dl class="rb_title">
						<dt>${ib.bookTitle }</dt>
						<dd>${ib.authorName }</dd>
					</dl>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<script>
var swiper = new Swiper('.swiper5', {
	slidesPerView: 5,
	spaceBetween: 10,
	slidesPerGroup: 5,
	loopFillGroupWithBlank: true,
	loop: true,
	pagination: {
		el: '.aw_count_ib',
		type: 'fraction',
	},
	navigation: {
		nextEl: '#ib_awR',
		prevEl: '#ib_awL',
	},
});
</script>