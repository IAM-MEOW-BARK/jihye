<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>공지사항 게시글</title>
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
        
      	tbody {
	        height: 500px; /* 원하는 높이 설정 */
	        
	    }

        /* 버튼 스타일 */
        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .noticeList, .noticeUpdate, .noticeDelete {
            padding: 8px 17px;
            border: 1px solid #ff6600;
            background-color: #ffffff;
            border-radius: 4px;
            color: #ff6600;
            cursor: pointer;
            text-decoration: none;
            font-size: 11px;
        }

        .noticeList:hover, .noticeUpdate:hover, .noticeDelete:hover {
            background-color: #ff6600;
            color: #ffffff;
            text-decoration: none;
        }
    </style>
</head>
<body>
	<%@ include file="include/board_nav.jsp"%>

    <div class="container">
        <!-- 공지사항 상세 테이블 -->
        <table>
            <thead>
                <tr>
                    <th>제목</th>
                    <td>${noticeDetail.notice_title}</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>내용</th>
                    <td>${noticeDetail.notice_content}</td>
                </tr>
            </tbody>
        </table>

        <!-- 전체보기 버튼 -->
        <div class="button-container">
            <a href="noticeList?pageNum=${currentPage}&pageListNum=${pageListNum}" class="noticeList">목록</a>
            <a href="noticeUpdate?notice_no=${noticeDetail.notice_no}" class="noticeUpdate">수정</a>
            <a href="noticeDelete?notice_no=${noticeDetail.notice_no }" class="noticeDelete">삭제</a>
        </div>
    </div>
</body>
</html>