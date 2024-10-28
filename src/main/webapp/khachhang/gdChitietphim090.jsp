<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.nemo.btl_pttk.model.Phim090" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết phim</title>
    <style>
        .container { width: 60%; margin: auto; padding: 20px; border: 1px solid #ccc; border-radius: 8px; background-color: #f9f9f9; }
        .field { margin-bottom: 15px; }
        label { display: inline-block; width: 100px; font-weight: bold; }
        input[type="text"] { width: calc(100% - 110px); padding: 5px; }
        .back-btn { display: inline-block; padding: 8px 12px; background-color: #4285f4; color: white; text-decoration: none; border-radius: 4px; }
        .back-btn:hover { background-color: #3066c5; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Thông tin chi tiết phim</h1>

        <%
            List<Phim090> dsPhim = (List<Phim090>) session.getAttribute("dsPhim");
            int index = Integer.parseInt(request.getParameter("phimIndex"));
            Phim090 phim = dsPhim.get(index);
            if (phim != null) {
        %>
            <div class="field">
                <label for="title">Tên phim</label>
                <input type="text" id="title" name="title" value="<%= phim.getTen() %>" readonly />
            </div>
            <div class="field">
                <label for="director">Đạo diễn</label>
                <input type="text" id="director" name="director" value="<%= phim.getDaodien() %>" readonly />
            </div>
            <div class="field">
                <label for="duration">Thời lượng</label>
                <input type="text" id="duration" name="duration" value="<%= phim.getThoiLuong() %> phút" readonly />
            </div>
            <div class="field">
                <label for="description">Mô tả</label>
                <input type="text" id="description" name="description" value="<%= phim.getMota()%>" readonly />
            </div>
            <a href="gdTimkiemphim090.jsp" class="back-btn">Quay lại</a>
        <%
            } else {
        %>
            <p>Không tìm thấy thông tin phim.</p>
            <a href="gdTimkiemphim090.jsp" class="back-btn">Quay lại</a>
        <%
            }
        %>
    </div>
</body>
</html>
