<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>Review 게시글</title>
 <style>
        /* 전체 레이아웃 */
        body {
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            table-layout: fixed;
        }

        table th, table td {
            border: 1px solid #ccc;
            padding: 10px;
            font-size: 13px;
        }

        table th {
            background-color: #feebe1;
            font-weight: bold;
            text-align: center;
            width: 5%;
        }

        table td {
        	padding-left: 20px;
            white-space: normal; /* 줄바꿈 허용 */
            word-wrap: break-word; /* 긴 텍스트 자동 줄바꿈 */
            line-height: 1.6; /* 텍스트 줄 간격 */
            text-align: left;
        }
        
		 /* 특정 셀 스타일 */
        .content-cell {
            height: 500px; /* 원하는 높이 */
            
        }
        .stars {
			display: inline-block;
            font-size: 14px;
            color: #ffa500;
        } 
        /* 버튼 스타일 */
        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .reviewList {
            padding: 8px 17px;
            border: 1px solid #ff6600;
            background-color: #ffffff;
            border-radius: 4px;
            color: #ff6600;
            cursor: pointer;
            text-decoration: none;
            font-size: 11px;
        }

        .reviewList:hover {
            background-color: #ff6600;
            color: #ffffff;
            
        }
    </style>
</head>
<body>
	<%@ include file="include/board_nav.jsp"%>

    <div class="container">
        <!-- 리뷰 상세 테이블 -->
        <table>
            <thead>
                <tr>
                    <th>상품명</th>
                    <td>${reviewDetail.product_name}</td>
                </tr>
            </thead> 
            <tbody>
             	<tr>
                    <th>작성자</th>
                    <td>${reviewDetail.user_id}</td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>${reviewDetail.review_date}</td>
                </tr>
                <tr>
                	<th>별점</th>
                	<td>
                		<div class="stars">
                            <c:forEach begin="1" end="5" var="i">
                                <c:choose>
                                    <c:when test="${i <= reviewDetail.review_score}">
                                        ★
                                    </c:when>
                                    <c:otherwise>
                                        ☆
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </div>
                	</td>
                </tr>
                
                <tr class="content-cell">
                    <th>내용</th>
                   
                    <td>${reviewDetail.review_content}</td>
                </tr>
             
            </tbody>
        </table>

        <!-- 전체보기 버튼 -->
        <div class="button-container">
            <a href="reviewList" class="reviewList">전체보기</a>
        </div>
    </div>
</body>
</html>