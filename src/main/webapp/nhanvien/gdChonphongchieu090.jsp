<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.nemo.btl_pttk.model.*" %>
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
<%
    List<Phong090> dsPhong = new ArrayList<>();

        // Thêm 5 phòng vào danh sách
        dsPhong.add(new Phong090(1, "Phòng A", 100, "Phòng chiếu hiện đại với âm thanh vòm."));
        dsPhong.add(new Phong090(2, "Phòng B", 150, "Phòng chiếu dành cho sự kiện lớn."));
        dsPhong.add(new Phong090(3, "Phòng C", 80, "Phòng chiếu cho các bộ phim indie."));
        dsPhong.add(new Phong090(4, "Phòng D", 120, "Phòng chiếu với ghế ngồi thoải mái."));
        dsPhong.add(new Phong090(5, "Phòng E", 200, "Phòng chiếu VIP với dịch vụ riêng."));
    %>
<body>
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
               if (dsPhong != null) {
                   for (Phong090 phong : dsPhong) { %>
                       <tr>
                           <td><%= phong.getId() %></td>
                           <td><%= phong.getTen() %></td>
                           <td><%= phong.getSucchua() %></td>
                           <td> 
                               <form action="gdChonPhim090.jsp" method="post">
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
        <button class="back-button" onclick="window.location.href='gdThemLichchieu090.jsp';">Quay lại</button>
    </div>
</body>
</html>
