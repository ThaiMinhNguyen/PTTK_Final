<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chính KH</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        h1 {
            color: #333;
        }
        .navbar {
            background-color: #007bff;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar h1 {
            color: white;
            margin: 0;
            padding-left: 20px;
        }
        .logout {
            margin-right: 20px;
        }
        .logout a {
            text-decoration: none;
            color: white;
            background-color: #dc3545;
            padding: 10px 20px;
            border-radius: 5px;
            display: inline-block;
        }
        .logout a:hover {
            background-color: #c82333;
        }
        .container {
            text-align: center;
            margin-top: 50px;
        }
        .menu {
            margin-top: 30px;
            display: flex;
            justify-content: center;
        }
        .menu li {
            list-style-type: none;
            margin: 0 10px;
            flex: 1;
        }
        .menu li a {
            text-decoration: none;
            color: white;
            background-color: #007bff;
            padding: 10px 20px;
            border-radius: 5px;
            display: inline-block;
            width: 100%;
            box-sizing: border-box;
            text-align: center;
        }
        .menu li a:hover {
            background-color: #0056b3;
        }
        .menu li {
            width: 150px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1>Chào mừng đến với hệ thống quản lý phim</h1>
        <div class="logout">
            <a href="#">Đăng xuất</a>
        </div>
    </div>

    <div class="container">
        <ul class="menu">
            <li><a href="gdTimkiemphim090.jsp">Tìm kiếm phim</a></li>
            <li><a href="#">Xem phim yêu thích</a></li>
            <li><a href="#">Danh sách đã xem</a></li>
            <li><a href="#">Quản lý tài khoản</a></li>
        </ul>
    </div>
</body>
</html>
