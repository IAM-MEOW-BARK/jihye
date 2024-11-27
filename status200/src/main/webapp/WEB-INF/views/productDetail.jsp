<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        
        <title>상픔 상세페이지</title>
        
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/productStyle.css" rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          	  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    
    <body>
       <!-- %@ include file="include/header.jsp"%> -->
        
        <!-- 상품 상세페이지 상단 -->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
            	
            	
	                <div class="row gx-4 gx-lg-5 align-items-center">
	                	<!-- 상품 썸네일 -->
	                    <div class="col-md-6">
	                    	<img src="${pageContext.request.contextPath}/resources/upload/${productDetail.thumbnail_img}" alt="Product Thumbnail" class="card-img"
	                    	 style="max-width: 720px; max-height: 720px; object-fit: cover;"/></div>
	                    <!-- 상품 정보 -->
	                    <div class="col-md-6">
	                        <!-- 상품명 -->
	                        <h1 class="display-7 fw-bolder">${productDetail.product_name}</h1>
	
							<!--  찜하기 버튼 -->
	                    	
	                    	
	                    	
	                    	
	                    	
	                		
	                     	<!-- 상품 가격 -->
	                     	<div class="products-box-detail-price border-btm-e1e1e1">
								<span class="products-box-detail-postInfo-title">가격</span>
								<span class="products-box-detail-price-figure">${productDetail.product_price}</span> <span>원</span>
							</div>
							
							<!-- 배송 정보 -->
							<div class="products-box-detail-postInfo">
								<span class="products-box-detail-postInfo-title">배송정보</span>
								<span class="products-box-detail-postInfo-content">무료배송</span>
								<div class="products-box-detail-realInfo-title">제주 3,000원 추가/도서산간 5,000원 추가</div>	
								<div class="products-box-detail-realInfo-content">오늘 주문 시 11월 13일(수) 출발</div>
							</div>
							
							
	                        <div class="d-flex">
	                        	<label>수량</label>
	                            <input class="form-control text-center me-3" id="inputQuantity" type="number" value="1" style="max-width: 4rem; margin-left:15px;" />
	                        </div>
							
							
							<!-- 상품 금액 -->
							<div class="products-box-detail-allPrice">
								<span class="products-box-detail-allPrice-title">주문금액</span>
								<span class="products-box-detail-allPrice-figure">${productDetail.product_price}</span> <span>원</span>
							</div>
							
							<!-- 장바구니 버튼 -->
							<button type="button" class="buy-btn">장바구니</button>
							
	                     <br>
	                    </div>
	                </div>
               

            </div>
        </section>
        
        <!-- 상품 상세 페이지 하단 -->
        <section class="py-5">
			<div class="wrap-detail-info" style="padding-top: 0px;">
				<!-- 상세정보 이동 탭 -->
				<div class="tab-detail-info">
					<ul class="tab">
						<li class="active" id="tab-img-text"> <a href="#detail-img-text-box" id="tab-img-text-a">상품정보</a></li>
						<li class="active" id="tab-review"> <a href="#detail-review-box" id="tab-review-a">리뷰</a></li>
						<li class="active" id="tab-qna"> <a href="#detail-qna-box" id="tab-qna-a">Q&A</a></li>
						<li class="active" id="tab-purchaseInfo"><a href="#detail-guideInfo-box" id="tab-purchaseInfo-a">취소/교환/반품 안내</a></li>
					</ul>
				</div>
				
				<!-- 상품 상세정보 시작 -->
	            <div class="container px-4 px-lg-5 mt-5 ">
	                <div class="detail-header">상품정보</div>
	                	<div id="detail-img-text-box">
	                		 <img class="card-img-top" src="http://dogpose.diskn.com/z7N3uVaQwv" alt="..." />
               			</div>
  					<div id="detail-info-box">
						<div class="detail-info-header">상품설명</div>
						
					</div>
					<div id="detail-review-box">
						<div class="detail-review-header">리뷰 (0)</div>
					</div>
					<div id="detail-qna-box">
						<div class="detail-qna-header">Q&A (0)</div>
					</div>
					<div id="detail-guideInfo-box">
					
						<div class="detail-guideInfo-header">취소/교환/반품 안내</div>
							<div class="accordion accordion-flush" id="accordionFlushExample">
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="flush-headingOne">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
							        주문취소
							      </button>
							    </h2>
							    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
							      <div class="accordion-body">
							      	<ul class="guide">
							      		<li>주문취소는 '입금대기, 입금완료' 단계에서만 가능합니다.</li>
							      		<li>주문취소는 '마이페이지 > 주문ㆍ배송 > 주문취소 > 주문 상세 보기'를 통해 직접 취소하실 수 있습니다.</li>
							      		<li>입금완료 후 신속한 발송을 위하여 주문 상태가 빠르게 '발송준비중'으로 변경될 수 있으며, '발송준비중' 단계에서는 주문 취소가 불가능합니다.</li>
							      		<li>'발송준비중, 발송처리완료' 단계에서는 상품 수령 후 교환 또는 반품만 가능합니다.</li>
							      	</ul>
							      </div>
							    </div>
							  </div>
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="flush-headingTwo">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
							        교환 및 반품정보
							      </button>
							    </h2>
							    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
							      <div class="accordion-body">
							      	<ul class="guide">
							      		<li>교환/반품은 배송 완료일 기준으로 7일 이내 신청 가능합니다.</li>
							      		<li>교환/반품하려는 상품은 처음 배송한 택배사에서 수거하므로 다른 택배사 이용은 불가능합니다.</li>
							      	</ul>
							      
							      </div>
							    </div>
							  </div>
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="flush-headingThree">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
							        교환/반품 배송비
							      </button>
							    </h2>
							    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
							      <div class="accordion-body">
							      	<ul class="guide">
							      		<li>단순변심으로 인한 교환/반품은 고객님께서 배송비를 부담하셔야 합니다.</li>
							      		<li>상품의 불량 또는 파손, 오배송의 경우에는 '내가바로 냥냥멍멍'에서 배송비를 부담합니다.</li>
							      		<li>제주, 도서산간 지역은 추가 배송비가 발생할 수 있습니다.</li>
							      	</ul>
							      </div>
							    </div>
							  </div>
							  
							  <div class="accordion-item">
							    <h2 class="accordion-header" id="flush-headingFour">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
							        교환/반품이 불가능한 경우
							      </button>
							    </h2>
							    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
							      <div class="accordion-body">
							      	<ul class="guide">
							      		<li>교환/반품 요청 기간이 지난 경우</li>
							      		<li>포장이 훼손되어 상품 가치가 감소한 경우</li>
							      		<li>상품을 설치하거나 사용한 경우</li>
							      		<li>시간의 경과에 의하여 재판매가 곤란할 정도로 상품의 가치가 현저히 감소한 경우</li>
							      		<li>구성품을 분실하였거나 고객님의 부주의로 인한 파손/고장/오염으로 재판매가 불가능한 경우</li>
							      	</ul>
							      </div>
							    </div>
							  </div>					  
							</div>
					</div> 
					
										
				</div>
		</div>
        
        </section>
        
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script type="text/javascript" src="/resources/js/productDetail.js"></script>
        <!--  ${pageContext.request.contextPath}/resources/js/productDetail.js"></script>  -->
    </body>
</html>