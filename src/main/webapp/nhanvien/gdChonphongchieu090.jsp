<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, java.time.*, com.nemo.btl_pttk.model.*, com.nemo.btl_pttk.dao.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chọn phòng chiếu</title>
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
            form {
                margin-bottom: 20px;
            }
            input[type="text"] {
                padding: 8px;
                width: 200px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 16px;
            }
            button[type="submit"] {
                padding: 8px 16px;
                font-size: 16px;
                border: none;
                background-color: #3498db;
                color: white;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            button[type="submit"]:hover {
                background-color: #2980b9;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }
            th, td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: center;
            }
            th {
                background-color: #3498db;
                color: white;
            }
            .back-button {
                margin-top: 20px;
                padding: 10px 20px;
                font-size: 16px;
                border: none;
                background-color: #e74c3c;
                color: white;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .back-button:hover {
                background-color: #c0392b;
            }
        </style>
</head>
<body>
    <%
        // Xử lý nếu có phongId trong request
        String phongIdParam = request.getParameter("phongId");
        if (phongIdParam != null) {
            int phongId = Integer.parseInt(phongIdParam);
            
            // Lấy dsPhong từ session
            List<Phong090> dsPhong = (List<Phong090>) session.getAttribute("dsPhong");
            Phong090 phongChon = null;
            
            // Tìm phòng trong dsPhong
            if (dsPhong != null) {
                for (Phong090 phong : dsPhong) {
                    if (phong.getId() == phongId) {
                        phongChon = phong;
                        break;
                    }
                }
            }
            
            // Lưu phongChon vào session và chuyển hướng
            if (phongChon != null) {
                session.setAttribute("phongChon", phongChon);
                System.out.println("phongChon: " + phongChon.getId() + " " + phongChon.getTen());
                response.sendRedirect("gdChonPhim090.jsp"); // Chuyển hướng đến trang tiếp theo
                return;
            }
        }
    %>

    <div class="container">
        <h1>Chọn phòng chiếu</h1>
        <form action="gdChonphongchieu090.jsp" method="get">
            <input type="text" name="tenPhong" placeholder="Nhập tên phòng">
            <button type="submit">Tìm kiếm</button>
        </form>
        
        <table>
            <tr>
                <th>ID</th>
                <th>Tên phòng</th>
                <th>Sức chứa</th>
                <th>Chọn phòng</th>
            </tr>
            <%-- Duyệt qua danh sách các phòng chiếu tìm được --%>
            <% 
               List<Phong090> dsPhong = new ArrayList<>();
               LocalDateTime giobatdau = (LocalDateTime) session.getAttribute("giobatdau");
               LocalDateTime gioketthuc = (LocalDateTime) session.getAttribute("gioketthuc");
               System.out.println("Giờ bắt đầu đã lưu vào session: " + giobatdau);
               
               if (giobatdau != null && gioketthuc != null) {
                   Phong090DAO dao = new Phong090DAO();
                   dsPhong = dao.getPhongtrong(giobatdau, gioketthuc);
                   session.setAttribute("dsPhong", dsPhong);
               }
               
               if (dsPhong != null) {
                   for (Phong090 phong : dsPhong) { %>
            <tr>
                <td><%= phong.getId() %></td>
                <td><%= phong.getTen() %></td>
                <td><%= phong.getSucchua() %></td>
                <td> 
                    <form action="gdChonphongchieu090.jsp" method="post">
                        <input type="hidden" name="phongId" value="<%= phong.getId() %>">
                        <button type="submit">Chọn</button>
                    </form>
                </td>
            </tr>
            <% }
               } else { %>
            <tr><td colspan="4">Không tìm thấy phòng chiếu</td></tr>
            <% } %>
        </table>
        
        <button class="back-button" onclick="window.location.href = 'gdThemLichchieu090.jsp';">Quay lại</button>
    </div>
</body>
</html>
