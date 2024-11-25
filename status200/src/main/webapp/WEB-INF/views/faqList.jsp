<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FAQ</title>
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

        /* 네비게이션 스타일 */
        .division_nav ul {
            list-style: none;
            display: flex;
            justify-content: center;
            gap: 15px;
            margin: 20px 0;
        }
        .division_nav a {
            display: inline-block;
            padding: 8px 15px;
            border: 1px solid #ff6600;
            border-radius: 5px;
            color: #333;
            text-decoration: none;
            font-size: 12px;
            text-align: center;
        }
        .division_nav a.active {
            background-color: #ff6600;
            color: #fff;
            font-weight: bold;
        }
        .division_nav a:hover {
            background-color: #ff6600;
            color: #fff;
        }

        /* 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            table-layout: fixed;
        }
        table th, table td {
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
            padding: 10px;
            text-align: center;
            font-size: 13px;
        }
        table th {
            background-color: #feebe1;
            font-weight: bold;
        }
        table th:nth-child(1), table td:nth-child(1),
		table th:nth-child(2), table td:nth-child(2) { 
		    width: 5%; 
		}
		table th:nth-child(3), table td:nth-child(3) { 
		    width: 50%;
		    white-space: nowrap;
		    overflow: hidden; 
		    padding-left: 30px;
		    text-overflow: ellipsis; 
		}
        
        .faq-click {
            cursor: pointer;
        }
        .accordion-content {
            display: none;
            background-color: #f9f9f9;
            padding: 10px;
            text-align: left;
        }
        .active-content {
            display: table-row;
            text-align: left;
        }

        /* 페이징 및 버튼 스타일 */
        .pagination-container {
            display: flex;
            justify-content: space-between;
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
        .write_button {
            padding: 8px 17px;
            cursor: pointer;
            font-size: 11px;
            border: 1px solid #ff6600;
            border-radius: 4px;
            background-color: #ffffff;
            color: #ff6600;
            text-decoration: none;
        }
        .write_button:hover {
            background-color: #ff6600;
            color: #ffffff;
        }
    </style>
</head>
<body>
    <%@ include file="include/board_nav.jsp"%>

    <!-- 네비게이션 메뉴 -->
    <nav class="division_nav">
        <ul>
            <li><a href="#" class="active">전체</a></li>
            <li><a href="#">회원서비스</a></li>
            <li><a href="#">배송</a></li>
            <li><a href="#">주문/결제</a></li>
            <li><a href="#">반품/교환/취소</a></li>
            <li><a href="#">기타</a></li>
        </ul>
    </nav>

    <!-- FAQ 리스트 -->
    <div class="container">
        <table>
            <thead>
                <tr>
                    <th>NO</th>
                    <th>구분</th>
                    <th>내용</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="faq" items="${faqList}">
                    <!-- 질문 -->
                    <tr class="faq-click">
                        <td>${faq.faq_no}</td>
                        <td>${faq.faq_division}</td>
                        <td>${faq.faq_question}</td>
                    </tr>
                    <!-- 답변 -->
                    <tr class="accordion-content">
                        <td colspan="3">${faq.faq_reply}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- 페이징 및 글쓰기 버튼 -->
        <div class="pagination-container">
            <div class="pagination">
                <c:if test="${startPage > 1}">
                    <a href="faqList?pageNum=${startPage - 1}&pageListNum=${pageListNum - 1}">&lt;</a>
                </c:if>
                <c:forEach begin="${startPage}" end="${endPage}" var="page">
                    <a href="faqList?pageNum=${page}&pageListNum=${pageListNum}"
                       class="${currentPage == page ? 'active' : ''}">${page}</a>
                </c:forEach>
                <c:if test="${endPage < totalPage}">
                    <a href="faqList?pageNum=${endPage + 1}&pageListNum=${pageListNum + 1}">&gt;</a>
                </c:if>
            </div>
            <a class="write_button" href="faqRegister">글쓰기</a>
        </div>
    </div>

    <!-- JavaScript for Accordion -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const rows = document.querySelectorAll(".faq-click");

            rows.forEach(row => {
                row.addEventListener("click", function () {
                    const content = row.nextElementSibling;
                    if (content.classList.contains("active-content")) {
                        content.classList.remove("active-content");
                    } else {
                        document.querySelectorAll(".accordion-content").forEach(item => {
                            item.classList.remove("active-content");
                        });
                        content.classList.add("active-content");
                    }
                });
            });
        });
    </script>
</body>
</html>
