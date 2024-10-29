<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.time.LocalDateTime, com.nemo.btl_pttk.model.Phim090, com.nemo.btl_pttk.model.Phong090" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xác nhận lịch chiếu</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f6f9; display: flex; justify-content: center; align-items: center; flex-direction: column; height: 100vh; margin: 0; }
        .container { width: 80%; background-color: white; padding: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); text-align: center; }
        h1 { color: #333; margin-bottom: 20px; }
        label { display: block; font-weight: bold; margin-top: 10px; }
        .back-button, .confirm-button { margin-top: 20px; padding: 10px 20px; font-size: 16px; border: none; background-color: #3498db; color: white; border-radius: 5px; cursor: pointer; transition: background-color 0.3s; }
        .back-button:hover, .confirm-button:hover { background-color: #2980b9; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Xác nhận lịch chiếu</h1>
        
        <%-- Lấy các thông tin từ request hoặc session --%>
        <% 
            Phim090 phim = (Phim090) request.getAttribute("phimDaChon");
            LocalDateTime ngayChieu = (LocalDateTime) request.getAttribute("ngayChieu");
            LocalDateTime gioBatDau = (LocalDateTime) request.getAttribute("gioBatDau");
            LocalDateTime gioKetThuc = (LocalDateTime) request.getAttribute("gioKetThuc");
            Phong090 phong = (Phong090) request.getAttribute("phongDaChon");
        %>
        
        <% if (phim != null && ngayChieu != null && gioBatDau != null && phong != null) { %>
            <label>Tên phim:</label>
            <input type="text" value="<%= phim.getTen() %>" readonly>
            
            <label>Đạo diễn:</label>
            <input type="text" value="<%= phim.getDaodien() %>" readonly>
            
            <label>Thời lượng:</label>
            <input type="text" value="<%= phim.getThoiLuong() %> phút" readonly>
            
            <label>Mô tả:</label>
            <textarea readonly><%= phim.getMota() %></textarea>
            
            <label>Ngày chiếu:</label>
            <input type="text" value="<%= ngayChieu.toLocalDate() %>" readonly>
            
            <label>Giờ bắt đầu:</label>
            <input type="text" value="<%= gioBatDau.toLocalTime() %>" readonly>
            
            <label>Giờ kết thúc:</label>
            <input type="text" value="<%= gioKetThuc.toLocalTime() %>" readonly>
            
            <label>Tên phòng:</label>
            <input type="text" value="<%= phong.getTen() %>" readonly>
            
            <form action="luuLichchieu.jsp" method="post">
                <input type="hidden" name="phimId" value="<%= phim.getId() %>">
                <input type="hidden" name="ngayChieu" value="<%= ngayChieu.toLocalDate() %>">
                <input type="hidden" name="gioBatDau" value="<%= gioBatDau.toLocalTime() %>">
                <input type="hidden" name="gioKetThuc" value="<%= gioKetThuc.toLocalTime() %>">
                <input type="hidden" name="phongId" value="<%= phong.getId() %>">
                <button type="submit" class="confirm-button">Xác nhận</button>
            </form>
        <% } else { %>
            <p>Dữ liệu không hợp lệ. Vui lòng quay lại và chọn các thông tin cần thiết.</p>
        <% } %>

        <button class="back-button" onclick="window.location.href='gdChonphongchieu090.jsp';">Quay lại</button>
    </div>
</body>
</html>
