<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 확인</title>
    <style>
        .container {
            padding: 20px;
            text-align: center;
        }
        input[type="password"] {
            padding: 10px;
            margin-bottom: 10px;
            width: 80%;
        }
        button {
            padding: 8px 17px;
            border: 1px solid #ff6600;
            background-color: #ffffff;
            color: #ff6600;
            cursor: pointer;
        }
        button:hover {
            background-color: #ff6600;
            color: #ffffff;
        }
    </style>
    <script>
        function pwdCheck() {
            const admin_pwd = document.getElementById('admin_pwd').value;
            if (admin_pwd === '1234') {
                alert('비밀번호가 일치합니다. 글쓰기를 진행합니다.');
                window.location.href = 'noticeRegister.jsp';
            } else {
                alert('비밀번호가 일치하지 않습니다.');
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h3>비밀번호 확인</h3>
        <input type="password" id="password" placeholder="비밀번호를 입력하세요.">
        <br>
        <button onclick="checkPassword()">확인</button>
    </div>
</body>
</html>
