<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Item - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <!-- 
        <link href="css/styles.css" rel="stylesheet" />
        -->
          <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>
                    </ul>
             
                </div>
            </div>
        </nav>
        
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
                	<table class="table">
	        <thead>
	        <tr>
	            <th>No</th>
	            <th colspan="3" >제목/상품</th>
	            <th>작성자</th>
	            <th>등록일</th>
	            <th>조회수</th>
	            
	        </tr>
	        </thead>
	        <tbody>
        		
				 	<tr>
				 	<td>1</td>
				 	<td><img src="/resources/dist/img/91.jpg"></td>
				 	<td><a href="detail?bno=${board.board_no}">양털 후리스 네이비</a></td>
				 	<td>푸들이</td>
				 	<td>2024/11/14</td>
				 	<td><span class="badge">12</span></td>
				 	</tr>
			

        
	        </tbody>
        </table>
                </div>
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
            
            
             <div class="button_reviewDetail">           	
            	<button type="button" class="btn btn-danger">전체보기</button>
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
    </body>
</html>

