<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>리뷰 게시판</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link href="${pageContext.request.contextPath}/resources/css/boardStyle.css"
		  rel="stylesheet">
</head>
<body>
<%@ include file="include/header.jsp"%>
	<!-- Product section-->
	<section class="py-5">
		<%@ include file="include/boardNav.jsp"%>
			<div id="wrap">
				<h2>리뷰 게시판</h2>
				
				<div class="sort-options">
				    <a href="?sort=latest" class="sort-link">최신순</a>
				    <a href="?sort=high-rating" class="sort-link">별점높은순</a>
				    <a href="?sort=low-rating" class="sort-link">별점낮은순</a>
				</div>
					
				<table class="review-table">
					<tr>
						<th>NO</th>
						<th>별점</th>
						<th>이미지</th>
						<th>제목/상품</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
					
					<tr>
						<c:forEach var="review" items="${reviewList}">
								<tr>
									<td>${review.review_no}</td>
									<td>${review.review_score}</td>
									<td>${review.review_img}</td>
									<td><a href="reviewDetail?review_no=${review.review_no}"> ${ }</a></td>
									<td>${review.user_id}</td>
									<td>${review.review_date}</td>
									<td>${review.review_readcnt}</td>
								</tr>
						</c:forEach>				
						
					</tr>
					<tr>
						<td>1</td>
						<td>★★★★★</td>
						<td><img src="https://img.dogpre.com/mobile/dogpre/product/101/100681_detailView_05431052.jpg" class="fixed-size-img"></td>
						<td><a href="detail?bno=${qna.no}"> 제목 </a></td>
						<td>푸들이</td>
						<td>2024/11/14</td>
						<td>10</td>
					</tr>
					<tr>
						<td>1</td>
						<td>★★★★★</td>
						<td><img src="https://img.dogpre.com/mobile/dogpre/product/101/100681_detailView_05431052.jpg" class="fixed-size-img"></td>
						<td><a href="detail?bno=${qna.no}"> 제목 </a></td>
						<td>푸들이</td>
						<td>2024/11/14</td>
						<td>10</td>
					</tr>
					
				</table>
			
			
				<!-- 페이징 처리 -->
				<div class="paging">
				   <c:if test="${pageListNUM>1}">
						<a href="list?pageListNUM=${pageListNUM-1}&pageNUM=${pageListNUM*10-10}"> 이전 </a>
					</c:if>
				
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<a href="list?pageListNUM=${pageListNUM }&pageNUM=${i }"> ${i } </a>
					</c:forEach>
				
					<c:if test="${pageListNUM<(totalPage/10)}">
						<a href="list?pageListNUM=${pageListNUM+1}&pageNUM=${pageListNUM*10+1}"> 다음 </a>
					</c:if>
				</div>
			
				</div>
				
				<!-- 페이지네이션 테스트 -->
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
				    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item"><a class="page-link" href="#">Next</a></li>
				  </ul>
				</nav>
	

	</section>
	
	

</body>
</html>

