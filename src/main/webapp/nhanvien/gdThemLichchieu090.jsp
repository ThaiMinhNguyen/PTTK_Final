<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, java.time.*, com.nemo.btl_pttk.model.*, com.nemo.btl_pttk.dao.*" %>
<!DOCTYPE html>
<html>
    <%  
    // Lấy giá trị giờ bắt đầu, giờ kết thúc và ngày chiếu từ request
    String giobatdauStr = request.getParameter("giobatdau");
    String gioketthucStr = request.getParameter("gioketthuc");
    String ngaychieuStr = request.getParameter("ngaychieu");

    if (giobatdauStr != null && gioketthucStr != null && ngaychieuStr != null) {
        // Kết hợp ngày chiếu với giờ bắt đầu và giờ kết thúc để tạo LocalDateTime
        LocalDate ngayChieu = LocalDate.parse(ngaychieuStr);
        LocalTime gioBatDau = LocalTime.parse(giobatdauStr);
        LocalTime gioKetThuc = LocalTime.parse(gioketthucStr);
        
        LocalDateTime giobatdau = LocalDateTime.of(ngayChieu, gioBatDau);
        LocalDateTime gioketthuc = LocalDateTime.of(ngayChieu, gioKetThuc);

        // Lưu LocalDateTime vào session
        session.setAttribute("giobatdau", giobatdau);
        session.setAttribute("gioketthuc", gioketthuc);
        
        
        System.out.println("Gio bat dau da luu vao session: " + giobatdau);
        System.out.println("Gio ket thuc da luu vao session: " + gioketthuc);
        response.sendRedirect("gdChonphongchieu090.jsp");
    }
    %>
    <head>
        <meta charset="UTF-8">
        <title>Thêm lịch chiếu</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f6f9;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }


            .container {
                width: 50%;
                background-color: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                text-align: center;
            }


            h1 {
                color: #333;
                margin-bottom: 20px;
            }

            label {
                font-size: 16px;
                color: #333;
                display: block;
                margin-top: 15px;
                margin-bottom: 5px;
                text-align: left;
            }

            input[type="time"], input[type="date"] {
                width: 100%;
                padding: 10px;
                margin: 5px 0 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: 16px;
            }

            button {
                padding: 12px 25px;
                font-size: 16px;
                margin: 10px;
                border: none;
                cursor: pointer;
                border-radius: 8px;
                transition: background-color 0.3s;
            }

            button[type="submit"] {
                background-color: #3498db;
                color: white;
            }

            button[type="submit"]:hover {
                background-color: #2980b9;
            }

            button[type="button"] {
                background-color: #e74c3c;
                color: white;
            }

            button[type="button"]:hover {
                background-color: #c0392b;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Thêm lịch chiếu</h1>
            <form action="gdThemLichchieu090.jsp" method="post">
                <label>Giờ bắt đầu:</label>
                <input type="time" name="giobatdau" required>

                <label>Giờ kết thúc:</label>
                <input type="time" name="gioketthuc" required>

                <label>Ngày chiếu:</label>
                <input type="date" name="ngaychieu" required>

                <button type="submit">Tiếp tục</button>
                <button type="button" onclick="window.location.href = 'gdQuanlyLichchieu090.jsp';">Quay lại</button>
            </form>
        </div>
    </body>
</html>
