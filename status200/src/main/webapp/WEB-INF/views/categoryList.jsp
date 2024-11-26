<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>💜의류/잡화</title>
<%@ include file="include/head.jsp"%>

<style>
		.tab-image {
		   display: block;
		   overflow: hidden;
		   height: 200px;
		   width: 200px;	
		}
		.tab-image img {
		  
		   width: 100%;
		   height: 100%;
		   object-fit:cover;
		}
		.pagination-container {
           display: flex;
           justify-content: center; 
           align-items: center; 
           margin: 20px 0;
        }
        .pagination {
	        display: flex;
	        gap: 15px; 
	        margin: 0 auto;
	    }
	    .pagination a {
	        text-decoration: none;
	        color: #333;
	        font-size: 12px;
	    }
	    .pagination a.active {
	        color: #ff6600; 
	        font-weight: bold; 
	    }
	    a {
			text-decoration: none;
	        color: inherit;
		}
	    .cart_button {
         	padding: 8px 17px;
         	margin-right: 10px;
            cursor: pointer;
            font-size: 11px;
            border: 1px solid #ff6600;
            border-radius: 4px;
            background-color: #ffffff;
            color: #ff6600;    
        }
         .cart_button:hover {
            background-color: #ff6600;
            color: #ffffff;
</style>
</head>
<body>
	<div class="preloader-wrapper">
		<div class="preloader"></div>
	</div>

	<div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasCart">
		<div class="offcanvas-header justify-content-center">
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>

		<!-- 우측 장바구니 슬라이더  -->

		<div class="offcanvas-body">
			<div class="order-md-last">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-primary">Your cart</span> <span class="badge bg-primary rounded-pill">3</span>
				</h4>
				<ul class="list-group mb-3">
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<h6 class="my-0">Growers cider</h6>
							<small class="text-body-secondary">Brief description</small>
						</div> <span class="text-body-secondary">$12</span>
					</li>
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<h6 class="my-0">Fresh grapes</h6>
							<small class="text-body-secondary">Brief description</small>
						</div> <span class="text-body-secondary">$8</span>
					</li>
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<h6 class="my-0">Heinz tomato ketchup</h6>
							<small class="text-body-secondary">Brief description</small>
						</div> <span class="text-body-secondary">$5</span>
					</li>
					<li class="list-group-item d-flex justify-content-between"><span>Total (USD)</span> <strong>$20</strong></li>
				</ul>

				<button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
			</div>
		</div>
	</div>

	<!-- / 우측 장바구니 슬라이더. 끝.  -->

	<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar">
		<div class="offcanvas-header justify-content-between">
			<h4 class="fw-normal text-uppercase fs-6">Menu</h4>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>

		<div class="offcanvas-body">
			<ul class="navbar-nav justify-content-end menu-list list-unstyled d-flex gap-md-3 mb-0">
				<li class="nav-item border-dashed active"><a href="index.html" class="nav-link d-flex align-items-center gap-3 text-dark p-2"> <svg width="24" height="24" viewBox="0 0 24 24">
                <use xlink:href="#fruits"></use>
              </svg> <span>Fruits and vegetables</span>
				</a></li>
				<li class="nav-item border-dashed"><a href="index.html" class="nav-link d-flex align-items-center gap-3 text-dark p-2"> <svg width="24" height="24" viewBox="0 0 24 24">
                <use xlink:href="#dairy"></use>
              </svg> <span>Dairy and Eggs</span>
				</a></li>
			</ul>
		</div>
	</div>

	<%@ include file="include/header.jsp"%>


	<!-- Main 캐러셀 리스트 -->
	<section class="pb-5">
		<div class="container-lg">
			<div class="row">
				<div class="col-md-12">
					<div class="section-header d-flex flex-wrap justify-content-between my-4">
						<h2 class="section-title">의류/잡화</h2>

				
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="product-grid row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-3 row-cols-xl-4 row-cols-xxl-5">

						<!-- 리스트에서 아이템 하나 -->
						<c:forEach var="product" items="${categoryList}">
							<div class="col">
								<div class="product-item">
									<figure>
										<a href="productDetail" title="Product Title"> <img src="${pageContext.request.contextPath}/resources/upload/${product.thumbnail_img}" alt="Product Thumbnail" class="tab-image" />
										</a>
									</figure>
									<div class="d-flex flex-column text-center">
										<h3 class="fs-6 fw-normal">${product.product_name}</h3>
										<div class="d-flex justify-content-center align-items-center gap-2">
											<span class="text-dark fw-semibold">${product.product_price}원</span>
										</div>
										<div class="button-area p-3 pt-0">
											<div class="row g-1 mt-2">
												<div class="col-3">
													<input type="number" name="quantity" class="form-control border-dark-subtle input-number quantity" value="1" />
												</div>
												<div class="col-7">
													<a href="#" class="cart_button"> <svg width="18" height="18">
								                          <use xlink:href="#cart"></use>
								                          </svg> 장바구니
													</a>
												</div>
												<div class="col-2">
													<a href="#" class="btn btn-outline-dark rounded-1 p-2 fs-6"> <svg width="18" height="18">
								                          <use xlink:href="#heart"></use>
								                          </svg>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<!-- / 리스트에서 아이템 하나 -->
					</div>
					<!-- / product-grid -->
				</div>
			</div>
		</div>
	</section>

	<!-- / Main 캐러셀 리스트 -->

	

    <!-- 페이징 처리 -->
    <div class="pagination-container">
        <div class="pagination">
            <c:if test="${startPage > 1}">
                <a href="categoryList?pageNum=${startPage - 1}&pageListNum=${pageListNum-1}">&lt;</a>
            </c:if>
            <c:forEach begin="${startPage}" end="${endPage}" var="page">
                <a href="categoryList?pageNum=${page}&pageListNum=${pageListNum}" 
                   class="${currentPage == page ? 'active' : ''}">${page}</a>
            </c:forEach>
            <c:if test="${endPage  < totalPage}">
                <a href="categoryList?pageNum=${endPage + 1}&pageListNum=${pageListNum+1}">&gt;</a>
            </c:if>
        </div>
    </div>

	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery-1.11.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/plugins.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/script.js"></script>
</body>
</html>
