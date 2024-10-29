<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.nemo.btl_pttk.model.Phim090" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý lịch chiếu</title>
    <style>
        
        body { 
            font-family: Arial, sans-serif; 
            background-color: #f4f6f9; 
            margin: 0; 
            padding: 0; 
            display: flex; 
            justify-content: center; 
            align-items: center; 
            height: 100vh;
        }

        
        .header {
            width: 100%;
            background-color: #333;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            position: absolute;
            top: 0;
            left: 0;
        }

        
        .header h1 {
            margin: 0;
            font-size: 24px;
        }

        
        .header .logout-button {
            padding: 8px 16px;
            background-color: #e74c3c;
            border: none;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .header .logout-button:hover {
            background-color: #c0392b;
        }

        
        .container {
            width: 50%;
            text-align: center;
            padding: 40px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-top: 80px; 
        }

        
        button {
            padding: 12px 25px;
            background-color: #3498db;
            border: none;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border-radius: 8px;
            margin: 10px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Quản lý lịch chiếu</h1>
        <form action="../thanhvien/gdDangnhap.jsp" method="post" style="margin: 0;">
            <button type="submit" class="logout-button">Đăng xuất</button>
        </form>
    </div>
    <div class="container">
        <form action="gdThemLichchieu090.jsp" method="post">
            <button type="submit">Thêm lịch chiếu</button>
        </form>
        <form action="gdChinhNV090.jsp" method="post">
            <button type="submit">Quay lại</button>
        </form>
    </div>
</body>
</html>
