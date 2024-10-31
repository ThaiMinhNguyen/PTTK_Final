<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.time.LocalDateTime, com.nemo.btl_pttk.model.*, com.nemo.btl_pttk.dao.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Xác nhận lịch chiếu</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f6f9;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                height: 100vh;
                margin: 0;
            }
            .container {
                width: 80%;
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                text-align: center;
            }
            h1 {
                color: #333;
                margin-bottom: 20px;
            }
            label {
                display: block;
                font-weight: bold;
                margin-top: 10px;
            }
            .back-button, .confirm-button {
                margin-top: 20px;
                padding: 10px 20px;
                font-size: 16px;
                border: none;
                background-color: #3498db;
                color: white;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .back-button:hover, .confirm-button:hover {
                background-color: #2980b9;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Xác nhận lịch chiếu</h1>

            <%-- Lấy các thông tin từ session --%>
            <%  
                // Lấy đối tượng Phong090 từ session
                Phong090 phong = (Phong090) session.getAttribute("phongChon");

                if (phong != null) {
                    // In ra thông tin của phongChon vào console
                    System.out.println("Thông tin phòng đã chọn:");
                    System.out.println("ID: " + phong.getId());
                    System.out.println("Tên: " + phong.getTen());
                    System.out.println("Sức chứa: " + phong.getSucchua());
                    System.out.println("Mô tả: " + phong.getMota());
                } else {
                    System.out.println("Không có thông tin phòng nào trong session.");
                }
                
                
                Phim090 phim = (Phim090) session.getAttribute("phimDaChon");
                
                if (phim != null) {
                    // In ra thông tin của phongChon vào console
                    System.out.println("Thông tin phim đã chọn:");
                    System.out.println("ID: " + phim.getId());
                    System.out.println("Tên: " + phim.getTen());
                    System.out.println("Mô tả: " + phim.getMota());
                } else {
                    System.out.println("Không có thông tin phim nào trong session.");
                }
                
                LocalDateTime gioBatDau = (LocalDateTime) session.getAttribute("giobatdau");
                System.out.println("Gio bat dau:" + gioBatDau);
                
                LocalDateTime gioKetThuc = (LocalDateTime) session.getAttribute("gioketthuc");
                System.out.println("Gio ket thuc:" + gioKetThuc);
                
                if("xacnhan".equals(request.getParameter("xacnhan"))){
                    if (phim != null && gioBatDau != null && phong != null){
                        Lichchieu090DAO dao = new Lichchieu090DAO();
                        Lichchieu090 lichchieu = new Lichchieu090(gioBatDau, gioKetThuc, phim, phong);
                        boolean c = dao.luuLichchieu(lichchieu);
                        if(c){
                            System.out.println("Luu thanh cong");
                            
                            response.sendRedirect("gdChinhNV090.jsp");
                            return;
                        } else {
                            System.out.println("Luu that bai");
                        }
                    }
                } else {
                    System.out.println("Chua an submit");
                }
                
            %>

            <% if (phim != null && gioBatDau != null && phong != null) { %>
            <label>Tên phim:</label>
            <input type="text" value="<%= phim.getTen() %>" readonly>

            <label>Đạo diễn:</label>
            <input type="text" value="<%= phim.getDaodien() %>" readonly>

            <label>Thời lượng:</label>
            <input type="text" value="<%= phim.getThoiLuong() %> phút" readonly>

            <label>Mô tả:</label>
            <textarea readonly><%= phim.getMota() %></textarea>

            <label>Giờ bắt đầu:</label>
            <input type="text" value="<%= gioBatDau.toLocalTime() %>" readonly>

            <label>Giờ kết thúc:</label>
            <input type="text" value="<%= gioKetThuc.toLocalTime() %>" readonly>

            <label>Tên phòng:</label>
            <input type="text" value="<%= phong.getTen() %>" readonly>

            <form action="gdXacnhanLichchieu090.jsp" method="post">
                <input type="hidden" name="phimId" value="<%= phim.getId() %>">
                <input type="hidden" name="gioBatDau" value="<%= gioBatDau.toLocalTime() %>">
                <input type="hidden" name="gioKetThuc" value="<%= gioKetThuc.toLocalTime() %>">
                <input type="hidden" name="phongId" value="<%= phong.getId() %>">
                <input type="hidden" name="xacnhan" value="xacnhan">
                <button type="submit" class="confirm-button">Xác nhận</button>
            </form>
            <% } else { %>
            <p>Dữ liệu không hợp lệ. Vui lòng quay lại và chọn các thông tin cần thiết.</p>
            <% } %>

            <button class="back-button" onclick="window.location.href = 'gdChonphongchieu090.jsp';">Quay lại</button>
        </div>
    </body>
</html>
