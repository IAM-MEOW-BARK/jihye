<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>Shop Item - Start Bootstrap Template</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Bootstrap icons-->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
		rel="stylesheet" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<!-- 
	        <link href="css/styles.css" rel="stylesheet" />
	        -->
	<link href="${pageContext.request.contextPath}/resources/css/styles.css"
		rel="stylesheet">
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
</head>
<body>


	<!-- Product section-->
	<section class="py-5">

		<nav class="topmenu">
			<ul class="nav">
				<li><a href="noticeList.jsp" class="notice"> 공지사항 </a></li>
				<li><a href="review.jsp" class="review"> 리뷰게시판 </a></li>
				<li><a href="qna.jsp" class="qna"> Q/A </a></li>
				<li><a href="ask.jsp" class="ask"> 자주묻는질문 </a></li>
			</ul>
		</nav>

		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">


				<div class=col-md-11>
					<table class="table">
						<thead>
							<tr>
								<th>No</th>
								<th>제목</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td>1</td>
								<td><a href="detail?bno=${board.board_no}">제목 </a></td>
								<td>2024-11-14</td>
								<td><span class="badge">10</span></td>
							</tr>

							<tr>
								<td>1</td>
								<td><a href="detail?bno=${board.board_no}">제목 </a></td>
								<td>2024-11-14</td>
								<td><span class="badge">10</span></td>
							</tr>

							<tr>
								<td>1</td>
								<td><a href="detail?bno=${board.board_no}">제목 </a></td>
								<td>2024-11-14</td>
								<td><span class="badge">10</span></td>
							</tr>

							<tr>
								<td>1</td>
								<td><a href="detail?bno=${board.board_no}">제목 </a></td>
								<td>2024-11-14</td>
								<td><span class="badge">10</span></td>
							</tr>



						</tbody>
					</table>
				</div>

			</div>
		</div>
		
	</section>

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

</body>
</html>

