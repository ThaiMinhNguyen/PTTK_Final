<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.nemo.btl_pttk.model.*, com.nemo.btl_pttk.dao.*" %>

<!DOCTYPE html>

<%
    String tuKhoa = request.getParameter("tenphim");
    List<Phim090> dsPhim = null;
    if (tuKhoa != null && !tuKhoa.isEmpty()) {
        
        //dsPhim = new ArrayList<Phim090>();
        //dsPhim.add(new Phim090(1, "Phim 1", "Đạo diễn 1", 120, "Mô tả phim 1"));
        //dsPhim.add(new Phim090(2, "Phim 2", "Đạo diễn 2", 90, "Mô tả phim 2"));
        //dsPhim.add(new Phim090(3, "Phim 3", "Đạo diễn 3", 150, "Mô tả phim 3"));
        //dsPhim.add(new Phim090(4, "Phim 4", "Đạo diễn 4", 110, "Mô tả phim 4"));
        //dsPhim.add(new Phim090(5, "Phim 5", "Đạo diễn 5", 135, "Mô tả phim 5"));
        //dsPhim.add(new Phim090(6, "Phim 6", "Đạo diễn 6", 105, "Mô tả phim 6"));
        
        Phim090DAO dao = new Phim090DAO();
        dsPhim = dao.getPhimtheotukhoa(tuKhoa);
        
        session.setAttribute("dsPhim", dsPhim);
    }
%>



<html>
    <head>
        <meta charset="UTF-8">
        <title>Tìm kiếm phim</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 80%;
                margin: 50px auto;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            .search-bar {
                text-align: center;
                margin-bottom: 20px;
            }
            .search-bar input[type="text"] {
                padding: 10px;
                width: 300px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            .search-bar input[type="submit"] {
                padding: 10px 20px;
                font-size: 16px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .search-bar input[type="submit"]:hover {
                background-color: #0056b3;
            }
            .table-container {
                margin-top: 30px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 10px;
                text-align: center;
            }
            th {
                background-color: #007bff;
                color: white;
            }
            td a {
                color: #007bff;
                text-decoration: none;
            }
            td a:hover {
                text-decoration: underline;
            }
            .buttons {
                text-align: center;
                margin-top: 20px;
            }
            .buttons input[type="button"] {
                padding: 10px 20px;
                font-size: 16px;
                margin: 0 10px;
                background-color: #28a745;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .buttons input[type="button"]:hover {
                background-color: #218838;
            }
            .buttons .back-btn {
                background-color: #dc3545;
            }
            .buttons .back-btn:hover {
                background-color: #c82333;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Tìm kiếm phim</h1>
            <div class="search-bar">
                <form action="gdTimkiemphim090.jsp" method="post">
                    <input type="text" name="tenphim" placeholder="Nhập tên phim để tìm kiếm..." value="<%= tuKhoa != null ? tuKhoa : "" %>">
                    <input type="submit" value="Tìm kiếm">
                </form>
            </div>

            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Tên phim</th>
                            <th>Đạo diễn</th>
                            <th>Thời lượng</th>
                            <th>Chi tiết</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (dsPhim != null && !dsPhim.isEmpty()) {
                           for (Phim090 phim : dsPhim) { %>
                        <tr>
                            <td><%= phim.getTen() %></td>
                            <td><%= phim.getDaodien() %></td>
                            <td><%= phim.getThoiLuong() %></td>
                            <td>
                                <!-- Đưa phim vào session và chuyển sang gdChitietphim090.jsp -->
                                <form action="gdChitietphim090.jsp" method="post">
                                    <input type="hidden" name="phimIndex" value="<%= dsPhim.indexOf(phim) %>">
                                    <input type="submit" value="Xem chi tiết">
                                </form>
                            </td>
                        </tr>
                        <% }} else { %>
                        <tr>
                            <td colspan="4">Không tìm thấy phim nào</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <input type="button" value="Quay lại" class="back-btn" onclick="window.location.href = 'gdChinhKH090.jsp';">
            </div>
        </div>
    </body>
</html>