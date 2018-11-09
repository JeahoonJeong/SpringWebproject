<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="<%=cp%>/resources/css/main.css" type="text/css"/>
<link rel="stylesheet" href="/webproject/resources/common/css/bnlBSList2.css" type="text/css"/>
<link rel="stylesheet" href="/webproject/resources/common/css/shopCartList.css" type="text/css"/>
<link rel="shortcut icon" href="http://image.bandinlunis.com/favicon.ico" type="image/x-icon">
<title>2조 반디앤루니스</title>

<script type="text/javascript" src="/webproject/resources/common/js/common.js"></script>
<script type="text/javascript" src="/webproject/resources/common/js/swfobject.js"></script>
<script type="text/javascript" src="/webproject/resources/common/js/flashcommon.js"></script>
<script type="text/javascript" src="/webproject/resources/common/js/AC_RunActiveContent.js"></script>

<script type="text/javascript" src="/webproject/resources/js/common.js" charset="utf-8"></script>
<script type="text/javascript" src="/webproject/resources/js/JUTIL/JUTIL.js" charset="utf-8"></script>
<script type="text/javascript" src="/webproject/resources/js/navi.js" charset="utf-8"></script>
<script type="text/javascript" src="/webproject/resources/js/partnerHeaderInfo.js"></script>

<script type="text/javascript" src="/webproject/resources/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/webproject/resources/js/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="/webproject/resources/js/jquery/jquery.blockUI.js"></script>
<script type="text/javascript" src="/webproject/resources/js/jquery/idangerous.swiper.js"></script>

<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>

<!-- ADSSOM 신규 버전 17-11-20 -->
<!-- ADSSOM 공통 SCRIPT -->
<script type="text/javascript" src="https://sc.11h11m.net/s/E799.js"></script>
<script type="text/javascript" charset="UTF-8" async="" src="http://s.n2s.co.kr/_n2s_ck_log.php"></script>

<script type="text/javascript">
	
	
	$(function() {
	
		var ck = cookieInfo(getCookie('shop'));
		
		var cIsbn = new Array();
		var ordCount = new Array();
		
		if(ck!=null){
			for(i=0;i<ck.length;i++){
				cIsbn.push(ck[i].isbn);
				ordCount.push(ck[i].orderCount);
			}
		}else{
			return;
		}
		cartList(cIsbn,ordCount);		
		
	});
	
	
	//카트 목록 뿌리기
	function cartList(cIsbn,ordCount) {
		var params = "isbn=" + cIsbn;
		params+= "&orderCount=" + ordCount; 
	
		var url = "<%=cp%>/cartList.action";
		/* alert(params); */
		
		 $.post(url,params,function(args){
			$("#nuriwork").html(args);
		}); 
	}
		
	
	
	//쿠키 가져오기
	function getCookie(cookiename){
		var cookiestring  = document.cookie;
		var cookiearray = cookiestring.split(';');
		for(var i=0; i<cookiearray.length; ++i){ 
		    if(cookiearray[i].indexOf(cookiename)!=-1){
		        var nameVal = cookiearray[i].split("=");
		        nameVal = nameVal[1].trim();
		        
		        return unescape(nameVal);
		    }else{
		    	var cookie = null;
		    } 
		}
		return cookie;
	}
 	
	//쿠키 뿌리기
	function cookieInfo(cValue) {		
 		var cookie = cValue;
 		
 		if(cookie!=null){
 			cookie = cookie.split("/");
 	 		var ck = new Array();
 	 		
 	 		for(i=0;i<cookie.length;i++){
 	 			ck[i] = JSON.parse(cookie[i]);
 	 		} 		
 	 		
 	 		return ck;
 		}else{
 			return null;
 		}
	}
	
	//체크박스 값 배열에 정리하기
	//체크박스 값 배열에 정리하기
	//선택된 체크박스 배열 반환
	function chkToArray(){
		
		//체크박스 선택된 값을 담을 array
		var checkArray = new Array();
		//체크박스 객체
		var chkbox = $('.check_bandiDeduction');
		
		for(var i=0;i<chkbox.length;i++){
			if(chkbox[i].checked == true){
				checkArray.push(chkbox[i].value);
			}
		}

		return checkArray; 
	}
	
	function findCookieIndex(isbn){
		
		var ck = cookieInfo(getCookie('shop'));
		
		var cIsbn = new Array();
		
		if(ck!=null){
			for(i=0;i<ck.length;i++){
				cIsbn.push(ck[i].isbn);
			}
			var index = cIsbn.indexOf(isbn);
			
		}
		
		
		
		return index;
		
	}
	
	//삭제하기
	function deleteCart(){
		
		var checkArray = chkToArray();
		
		if(checkArray.length == 0){
			alert("삭제할 상품을 선택하세요.");
		}
		else{
			if(confirm("선택하신 상품을 쇼핑카드에서 삭제하시겠습니까?") == true){
				var items = getCookie('shop');
				
				if(items){
					var itemArray=items.split('/');
					
					if(itemArray.length==checkArray.length){
						var expireDate = new Date();
						expireDate.setDate(expireDate.getDate() - 1);

						document.cookie = "shop= " + "; path=/ ; expires=" + expireDate.toGMTString();
					}
					else{
						for(var i=0;i<checkArray.length;i++){
							var index = findCookieIndex(checkArray[i]);
								itemArray.splice(index,1);
								setCookie('shop',itemArray.join("/"),1);	
						}
					}
				}
			
			}
		}
		
		var ck = cookieInfo(getCookie('shop'));
		
		var cIsbn = new Array();
		var ordCount = new Array();
		
		if(ck!=null){
			for(i=0;i<ck.length;i++){
				cIsbn.push(ck[i].isbn);
				ordCount.push(ck[i].orderCount);
			}
		}
		
		cartList(cIsbn,ordCount);
	
		
	}

	//쿠키 생성
	function setCookie(cName, cValue, cDay){
		var expire = new Date();
	    expire.setDate(expire.getDate() + cDay);
	    cookies = cName + '=' + escape(cValue) + '; path=/ ';
	    if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
	    document.cookie = cookies;
	}
	
</script>


</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>

<div id="contentBody">
        <div id="contentWrap">
		 
             <!-- location -->
            <div id="conLocation">
				<div class="location" id="locationArea">
					<li><a href="/">홈</a>&nbsp;<img src="/webproject/resources/images/searchN/ico_carte.gif">&nbsp;</li>
					<li><b>쇼핑카트</b></li>
				</div>
			</div>
            <!-- //location -->         
            <div class="conWrap pos_rel">
            	
            	<div class="orderStepN">
                    <h2><img src="/webproject/resources/images/searchN/h2_bookcart.gif" alt="쇼핑카트"></h2>
                    
                    <c:if test="${sessionScope.userInfo != null}">
	                    <dl class="benefitA overflow">
	                   		<dt class="bftit">나의 사용가능 혜택:</dt>
	                   		<dd>
	                   		 예치금 <strong>0</strong>원 |
	                   		적립금 <strong>1,000</strong>원 |
	                   		쿠폰 <strong>0</strong>장  | 전환금 <strong>0</strong>원
	                   		</dd>
	                    </dl>
	                <p class="mt10 t_gr fl_clear">최대 90일까지 보관되며, 이후에는 위시리스트에 자동 보관됩니다.</p>
                    </c:if>
                    <c:if test="${sessionScope.userInfo eq null }">
                    <p class="mt10 t_gr fl_clear">최대 90일까지 보관되며, 이후에는 위시리스트에 자동 보관됩니다.</p>
                    </c:if>
                    
                   	<p class="step"><img src="/webproject/resources/images/searchN/navi_step01.gif" alt="쇼핑카트 > 주문/결제 > 주문완료"></p>
                </div>
                
                
                <ul class="tab_cart_menu">
                	<li class="on"><a href="/webproject/shopCartList.action" class="cart_link tab_bandi">일반 상품</a></li>
                	<li style="background-color: white"></li>
                	<li style="background-color: white"></li>
                </ul>
                <div class="cart_bookself_info"></div>

	            <!-- 소득공제상품(도서) -->
                <div id="bandi_deduction_list" class="pos_rel fl_clear mt40" style="">
					<h3 class="orderTit mt20"> 
						반디배송 상품 <span class="t_14 t_blue t_bold">- 도서 소득공제 대상 <span class="sp_btn sp_help" onmouseover="javascript:popLayer('deductionInfo')" onmouseout="javascript:popHidden('deductionInfo')"><span>?</span></span></span>
					</h3> 
					<div class="bookViewPop al_left" id="deductionInfo" style="visibility: hidden; left 20px; top: 25px; width: 320px;">
						 <h3 class="mLine">도서 소득공제 대상 안내</h3>
						 <div class="laypopCon "> 
							 <p class="mt5">
								저자, 발행인, 발행일, 출판사, 국제표준도서번호(ISBN. 다만, 전자책의 경우
								ECN 포함)이 기록된 간행물로 종이책(학술서, 만화, 학습참고서 포함), 전자책
								(오디오북, 웹툰, 웹소설 포함)<br>
								(※ 잡지, eBook 대여, 과세도서 제외)
							 </p> 
						 </div> 						
					</div>

					<div class="pos_abs at0 ar0 mt3" style="_top:0;_margin-top:0">
						
						<a id="bandiDeduction" class="btn_bookSelf" style="cursor:pointer;"><img src="/webproject/resources/images/searchN/btn_cart_move_bookself.gif" alt="선택상품 북셀프로 주문하기"></a>
 						
						<a href="javascript:array_interest(1);"><img src="/webproject/resources/images/searchN/btn_cart_wishlist02.gif" alt="선택상품 위시리스트 담기"></a>
						<a href="javascript:deleteCart();" id="bandiDeduction" class="btn_del" style="cursor:pointer;"><img src="/webproject/resources/images/searchN/btn_cart_del02.gif" alt="선택상품 삭제"></a>
					</div>
					
            		<form  id="goOrder" action="<%=cp%>/order.action" method="post">
            		
	            	<div id="nuriwork">
	            	
	            	</div>

            	</div>


            	<div class="pos_rel overflow mt40">
					<h3 class="orderTit02 mt20"><img src="/webproject/resources/images/searchN/h3_cart_total.gif" alt="쇼핑카트 총 주문금액"></h3> 
	            	<table cellpadding="0" cellspacing="0" class="orderTable_tatol" width="960">
	            		<colgroup><col width="104"><col width="212"><col width="212"><col width="212"><col></colgroup>
	            		<tbody><tr>
	            			<th>수량</th>
	            			<th>상품정가</th>
	            			<th>상품할인</th>
	            			<th>배송비</th>
	            			<th>주문금액 합계</th>
	            		</tr>
	            		<tr>
	            			<td><span class="t_14" id="totOrdCnt">1종(1개)</span></td>
	            			<td><span id="totMarketSale">15,000</span><span class="t_14">원</span></td>
	            			<td><span id="totDiscountCost">1,500</span><span class="t_14">원</span></td>
	            			<td><span id="totDeliCost">0</span><span class="t_14">원</span></td>
	            			<td class="total"><span id="totOrdCost">13,500</span><span class="t_14">원</span></td>
	            		</tr>
	            	</tbody></table>
	            	<div class="cart_point_total_b">
	            		<strong class="ml15 fl_left mt15 mb10">적립가능액 : 
	            		<span class="point_b" id="totPoint">상품적립금 0원</span> 
	            		<span class="t_normal" id="extTotPoint"></span>
	            		</strong>	            		
	            	
	            		<ul class="cart_deli_notice fl_clear">
	            			<li>5만원 이상 추가적립/멤버십/바로온2% 적립금은 비도서, 뷰티포함 구매 시 적용 됩니다. (도서 제외)</li>
	            			<li><strong>업체배송 상품</strong>은 추가적립 대상에서 <strong>제외</strong>됩니다. (상품페이지, 쇼핑카트에서 업체배송 확인가능)</li>
	            			<li>적립가능액은 쿠폰, 적립금등 보조결제 수단 따라 약간의 금액 차이가 있을 수가 있습니다.</li>
	            			<li>적립금 지급시기는 구매완료 시점에 자동 지급 됩니다.</li>
	            		</ul>
			            <div class="bookViewPop" id="addPointInfo" style="visibility:hidden; top:0px;left:200px; width:420px">
			            	 <h3 class="mLine">추가적립금 안내 </h3>				        
			               	 <div class="laypopCon">
			                    <p class="mt10">
			                    	총 주문금액 5만원 이상 구매 시 2,000원 추가 적립
			                    </p>
			                    <ul class="mt10">
			                    	<li class="dot_comm t_11">국내도서, eBook만 구매 시 적립 불가</li>
			                    	<li class="dot_comm t_11 mt5">업체배송상품은 적립 대상에서 제외 <br>(상품상세 및 카트에서 업체배송 여부 확인 가능)</li>	
			                    	<li class="dot_comm t_11 mt5">배송비, 선물포장비 제외</li>
			                    	<li class="dot_comm t_11 mt5">취소,반품으로 인해 주문금액이 5만원에 미달시 지급된 추가적립금 차감</li>	 
			                    </ul>
			                    <p class="al_right mt5"><a href="/pages/front/service/serviceAddPoint.jsp" target="_blank"><img src="http://image.bandinlunis.com/images/order/btn_detail_view.gif"></a></p>
			               	 </div>
			                 <p class="btnClose"><img src="http://image.bandinlunis.com/images/common/btn_close02.gif" alt="close" style="cursor:pointer;" onclick="javascript:popHidden('addPointInfo')"></p>
			            </div> 
			        </div>

	            	
	            	<div class="cart_deli_info">
	            		<dl class="cart_deli_date">
	            			<dt>수령예상일 : </dt>
	            			
	            			
	            		</dl>
	            		<ul class="cart_deli_notice">
	            			<li>출고일이 다른 상품을 함께 주문하시면, 출고일이 가장 늦은 상품을 기준으로 일괄 배송합니다.</li>
	            			<li>같은 상품을 여러 개 주문하실 경우 추가 재고 확보에 시간이 더 걸릴 수 있으므로 예상 수령일보다  배송일이 2-3일 더 지연되기도 합니다.</li>
	            			<li>국내 수령지 기준이며, 해외배송은 배송방법에 따라 수령일이 최대 14일까지 늘어날 수 있습니다. </li>
	            		</ul>
	            	</div>
	            	
	            	
	            	<span class="cart_plus"></span><span class="cart_minus"></span><span class="cart_same"></span>
				</div>
				
				<div class="mt20 al_center fl_clear">
					<a href="/"><img src="/webproject/resources/images/searchN/btn_cart_shopping.gif" alt="쇼핑계속하기"></a>
					<a id="btn_order" style="cursor:pointer;"><img src="/webproject/resources/images/searchN/btn_cart_order.gif" alt="주문하기"></a>
				</div>
				</form>
				<!-- 크레마 무이자 팝업 -->
				
				<div class="laypop" id="laypop_crema" style="left:230px; bottom:1400px;width:500px; display:none;text-align:left;_left:-80px;">
					<h3 class="BLine ml20">12개월 무이자 할부 상품이 있습니다</h3>
					<div class="laypopCon">
						<div id="laypop_crema_prod" style="border:1px solid #d1d1d1;background:#f9f9f9;width:420px;padding:10px 10px 5px 10px;margin:10px 0 0 10px;">
						</div>
						<ul class="dotList mt15">
							<li>위 상품은 12개월 무이자 할부가 적용됩니다.</li>
							<li>적용 카드 : 외환,신한,삼성,현대,롯데,하나SK,농협NH</li>
							<li>단, <strong>타 상품과 함께 구매 시</strong>에는 <strong>12개월 무이자 혜택을 받으실 수   없습니다.</strong> <br>이 경우 <strong>타 상품은 별도로 주문 해 주십시오.</strong> </li>
						</ul>
						<div class="btnC mt10">
							<img src="http://image.bandinlunis.com/images/order/btn_cart_crema_only.gif" alt="무이자 혜택 상품만 주문" onclick="orderCrema();" style="cursor:pointer;">
							<img src="http://image.bandinlunis.com/images/order/btn_cart_crema_with.gif" alt="선택상품 모두 주문" onclick="orderProc();" style="cursor:pointer;">
						</div>
					</div>
					<p class="btnClose"><a href="javascript:closeCon('laypop_crema')"><img src="http://image.bandinlunis.com/images/common/btn_close02.gif" alt="close"></a></p>
				</div>
				
				<!-- //크레마 무이자 팝업 -->
				
				
				<div class="pos_rel overflow mt10 mb20 cart_inside">
					<div class="cartTit">
						<h3><img src="/webproject/resources/images/searchN/h3_cart_inside.gif" alt="추천inside"></h3>
					</div>
					<div class="cart_re_inside"><div class="inside_book">
						
						<dl id="BOOKCART_1_1" style="display: block;">
							<dt><img src="http://image.bandinlunis.com/upload/product/4034/4034224_s.jpg" onerror="this.src='http://image.bandinlunis.com/images/common/noimg_type02.gif'"></dt>
							<dd class="con01">돌이킬 수 없는 약속</dd>
							<dd class="mt5 BOOKCART_1_TIT"></dd>
						</dl>
						
						<p class="mPagingD pageNum" style="width:60px"><span class="num"><span id="insideIdx">1</span>/<span id="insideMax">1</span></span><a id="btn_insidePrev" class="prev" style="cursor:pointer;"><span>◀이전</span></a><a id="btn_insideNext" class="next" style="cursor:pointer;"><span>다음▶</span></a></p>
					</div></div>
					<div class="cart_recomProd">
						<ul class="mdbookList" id="BOOKCART_1"><li>추천 상품이 없습니다.</li></ul>
					</div>
				</div>
				
			</div>
			
		</div>
	</div>
<jsp:include page="../common/footer.jsp" flush="false" />
</body>
</html>