<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                    <input type="text" name="tenphim" placeholder="Nhập tên phim để tìm kiếm...">
                    <input type="submit" value="Tìm kiếm">
                </form>
            </div>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Tên phim</th>
                            <th>Thể loại</th>
                            <th>Năm phát hành</th>
                            <th>Chi tiết</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Các hàng hiển thị kết quả tìm kiếm -->
                        <tr>
                            <td>Phim 1</td>
                            <td>Hành động</td>
                            <td>2020</td>
                            <td><a href="#">Xem chi tiết</a></td>
                        </tr>
                        <tr>
                            <td>Phim 2</td>
                            <td>Kinh dị</td>
                            <td>2019</td>
                            <td><a href="#">Xem chi tiết</a></td>
                        </tr>
                        <tr>
                            <td>Phim 3</td>
                            <td>Hài</td>
                            <td>2021</td>
                            <td><a href="#">Xem chi tiết</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <input type="button" value="Quay lại" class="back-btn" onclick="window.history.back();">
            </div>
        </div>
    </body>
</html>
