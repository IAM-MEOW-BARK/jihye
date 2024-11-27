<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상픔 상세페이지</title>
<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .product-detail {
            display: flex;
            gap: 20px;
            margin-bottom: 40px;
        }

        .product-images img {
            max-width: 100%;
            border-radius: 5px;
        }

        .product-info {
            flex: 1;
        }

        .product-info h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .product-info .price {
            font-size: 20px;
            color: #ff6600;
            margin-bottom: 10px;
        }

        .cart-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #ff6600;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .cart-button:hover {
            background-color: #cc5200;
        }


		.tab-detail-info {
	position: sticky;
	margin: auto;
	max-width: 1230px;
	

    top: 0; /* Adjust this value if you have a header or other fixed elements */
    z-index: 1000; /* Make sure it's above other content */
    background-color: white; /* Add a background color to cover content beneath */
    padding: 10px 0; /* Optional: Adjust padding for better appearance */
}

.tab {
	text-decoration: none;
	list-style: none;
	display: flex;
	margin: 0px;
	padding: 0px;
	background-color: white;
}

.tab > li {
	width: 25%;
	text-align: center;
	padding: 15px 4px 15px;
	font-size: 15px;
	border-bottom: 2px solid #f2f2f2;
	
}
.tab > li > a {
	font-weight: 500;
	color: #9a9a9e;
	text-decoration: none;
}
        .section {
            margin-top: 40px;
        }

        .section h2 {
            font-size: 20px;
            margin-bottom: 20px;
        }

        .section p {
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .reviews img {
            max-width: 80px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .reviews {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .faq, .review-list {
            margin-top: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
        }

        .faq h3, .review-list h3 {
            font-size: 18px;
            margin-bottom: 15px;
        }

        .faq p, .review-list p {
            margin-bottom: 10px;
        }
        .accordion-button:not(.collapsed) {
    background-color: transparent !important; /* No background color */
    color: inherit; /* Keep the original text color */
    box-shadow: none !important; /* Remove any shadow effect */
    color: #ff6600 !important;
    border-color: #ff6600 !important;
    
}

.accordion-button:focus {
    box-shadow: none !important; /* Remove blue focus shadow */
    outline: none; /* Remove focus outline */
    border-color: #ff6600 !important; /* Change border color */
}
    </style>
</head>
<body>
    <div class="container">
        <!-- Product Detail -->
        <div class="product-detail">
        	<!-- 상품 썸네일 -->
            <div class="product-images">
                <img src="${pageContext.request.contextPath}/resources/upload/${productDetail.thumbnail_img}" alt="Product Thumbnail">
            </div>
            <!-- 상품 정보 -->
            <div class="product-info">
            	<!-- 상품명 -->
                <h1>${productDetail.product_name}</h1>
                <!--  찜하기 버튼 -->
                
                
                
                
               	<!-- 상품 가격 -->
                <div class="price">
                	<span>가격</span>
                    <span>${productDetail.product_price}</span><span>원</span>
                   
                </div>
                
                <!-- 배송 정보 -->
                <div>
					<span>배송정보</span>
					<span >무료배송</span>
					<div>제주 3,000원 추가/도서산간 5,000원 추가</div>	
					<div>오늘 주문 시 11월 13일(수) 출발</div>
				</div>
							
				<!-- 상품 금액 -->
				<div>
					<span>주문금액</span>
					<span>${productDetail.product_price}</span> <span>원</span>
				</div>
				
				
				<!-- 장바구니 버튼 -->		
                <button type="button" class="cart-button">장바구니</button>
            </div>
        </div>


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
</body>
</html>