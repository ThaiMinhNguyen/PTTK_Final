<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.nemo.btl_pttk.model.Phim090" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chính nhân viên</title>
    <style>
        
        body { 
            font-family: Arial, sans-serif; 
            background-color: #f4f6f9; 
            margin: 0; 
            padding: 0; 
        }

        
        .header {
            background-color: #4CAF50; 
            color: white;
            padding: 15px 0;
            display: flex; 
            justify-content: space-between; 
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .header h1 {
            margin-left: 20px;
            font-size: 24px;
        }
        .header form {
            margin-right: 20px;
        }
        .header button {
            padding: 10px 20px; 
            background-color: #ff4757;
            border: none;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .header button:hover {
            background-color: #ff6b81;
        }

        
        .container {
            width: 80%; 
            margin: 50px auto;
            text-align: center;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        
        .container button {
            padding: 15px 30px;
            background-color: #3498db;
            border: none;
            color: white;
            font-size: 18px;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s;
        }
        .container button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Trang chính nhân viên</h1>
        <form action="../thanhvien/gdDangnhap.jsp" method="post">
            <button type="submit">Đăng xuất</button>
        </form>
    </div>
    <div class="container">
        <form action="gdQuanlyLichchieu090.jsp" method="post">
            <button type="submit">Quản lý lịch chiếu</button>
        </form>
    </div>
</body>
</html>

