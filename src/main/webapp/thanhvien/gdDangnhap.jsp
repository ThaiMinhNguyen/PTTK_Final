<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.ArrayList, dao.*, model.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login Form</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 100%;
                max-width: 400px;
                margin: 50px auto;
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
            }
            h1 {
                text-align: center;
                margin-bottom: 20px;
            }
            table {
                width: 100%;
            }
            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 8px;
                margin: 8px 0;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px;
                width: 100%;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
            a {
                display: block;
                text-align: center;
                margin-top: 10px;
            }
            .error-message {
                color: red;
                text-align: center;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>User Login Form</h1>

            <% 
                String err = request.getParameter("err"); 
            %>

            <% if (err != null && err.equals("fail")) { %>
            <div class="error-message">Invalid username or password.</div>
            <% } %>


            <form action="${pageContext.request.contextPath}/thanhvien/gdDangnhap.jsp" method="post">
                <table>
                    <tr>
                        <td>UserName</td>
                        <td><input type="text" name="username" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" /></td>
                    </tr>
                </table>
                <input type="submit" value="LOGIN" />
            </form>
            <a href="${pageContext.request.contextPath}/thanhvien/gdDangky.jsp">REGISTER</a>
        </div>
        <%
        // Lấy username và password từ form đăng nhập
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null && password != null) {
            // Giả lập kiểm tra đăng nhập (nên sử dụng DAO để kiểm tra từ cơ sở dữ liệu)
            if (password.equals("1")) {
                if (username.equals("kh")) {
                    // Chuyển hướng đến trang dành cho sinh viên
                    response.sendRedirect("sv/gdChinhKH.jsp");
                } else if (username.equals("nv")) {
                    // Chuyển hướng đến trang dành cho nhân viên
                    response.sendRedirect("gv/gdChinhNV.jsp");
                } else {
                    // Nếu không khớp với bất kỳ vai trò nào, báo lỗi
                    response.sendRedirect("gdDangnhap.jsp?err=fail");
                }
            } else {
                // Mật khẩu sai
                response.sendRedirect("gdDangnhap.jsp?err=fail");
            }
        }
        %>

    </body>
</html>


