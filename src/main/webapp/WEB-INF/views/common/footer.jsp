<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>


<div style="margin-top: 50px; width: 960px; clear: both; height: 50px;"></div>

<div class="footer">
	<div class="copyright">
		<div class="f_menu">
			<ul>
				<li>
					<a href="javascript://">회사소개</a>
				</li>
				<li>
					<a href="javascript://">이용약관</a>
				</li>
				<li>
					<a href="javascript://" 
					style="color: #7B5A2B; font-weight: bold;">개인정보 처리방침</a>
				</li>
			</ul>
			<div class="sns_btn">
				<a href="javascript://">
					<button class="btn_inst"></button>
				</a>
				<a href="javascript://">
					<button class="btn_nb"></button>
				</a>
			</div>
		</div>
		<div class="f_logo">
			<img src="<%=cp%>/resources/image/main/logo_footer.gif">
		</div>
		<div class="f_info">
			<div class="f_info_box">
				<div class="fib_customer">
					<strong>고객문의</strong>: <strong class="tel">1577-4030</strong>
					<span class="tel_time">(발신자 부담) 평일 9시~18시(토요일,일요일,공휴일 휴무)</span>
					<span> | Fax: 02-3703-2499</span>
					<a href="javascript://">
						<img src="<%=cp%>/resources/image/main/btn_footer_customer.gif" style="vertical-align: middle;">
					</a>
				</div>
				<div class="fib_company">
					<ul class="company_info">
						<li>회사명 : (주)서울문고</li>
						<li>대표이사 : 김동국</li>
						<li>개인정보 관리 책임자 : 이해권</li>
					</ul>
					<ul class="company_info" style="width: 480px; border-left: 1px solid #eeeeee; padding-left: 23px;">
						<li>소재지 : 서울 서초구 강남대로 331 광일프라자빌딩 14층</li>
						<li>사업자 등록번호 : 120-81-02543 </li>
						<li>
							<span>통신판매업 신고번호 : 제2016-서울서초-1668호</span> 
						</li>
					</ul>
				</div>
				<div class="fib_cr">
					copyright ⓒ 2016 BANDI&LUNI'S All Rights Reserved
				</div>
			</div>	
		</div>
	</div>
	<div class="copy_award">
		<img src="<%=cp%>/resources/image/main/footer_award.jpg">
	</div>
</div>
