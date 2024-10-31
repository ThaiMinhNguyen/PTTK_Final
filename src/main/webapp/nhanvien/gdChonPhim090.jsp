<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.nemo.btl_pttk.model.*, com.nemo.btl_pttk.dao.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chọn phim</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f6f9; display: flex; justify-content: center; align-items: center; flex-direction: column; height: 100vh; margin: 0; }
        .container { width: 80%; background-color: white; padding: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); text-align: center; }
        h1 { color: #333; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th, td { padding: 12px; border: 1px solid #ddd; text-align: center; }
        th { background-color: #3498db; color: white; }
        .button { margin-top: 20px; padding: 10px 20px; font-size: 16px; border: none; color: white; border-radius: 5px; cursor: pointer; transition: background-color 0.3s; }
        .back-button { background-color: #2980b9; }
        .add-button { background-color: #3498db; }
        .back-button:hover { background-color: #1f6b93; }
        .add-button:hover { background-color: #2b8ec3; }
        .modal { display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); justify-content: center; align-items: center; }
        .modal-content { background-color: white; padding: 20px; border-radius: 10px; width: 400px; text-align: left; }
        .modal-content h2 { margin-top: 0; }
        .close { float: right; font-size: 24px; cursor: pointer; }
        .form-group { margin-bottom: 10px; }
        .form-group label { display: block; margin-bottom: 5px; }
        .form-group input, .form-group textarea { width: 100%; padding: 8px; font-size: 16px; border: 1px solid #ddd; border-radius: 5px; }
        .save-button { background-color: #27ae60; }
        .save-button:hover { background-color: #1e8449; }
    </style>
    <script>
        function openModal() {
            document.getElementById("addMovieModal").style.display = "flex";
        }

        function closeModal() {
            document.getElementById("addMovieModal").style.display = "none";
        }
    </script>
</head>
<%
    
    
    String phimIdParam = request.getParameter("phimId");
    if (phimIdParam != null) {
        try {
            Phim090 phimChon = null;
            int phimId = Integer.parseInt(phimIdParam);
            Phim090DAO dao = new Phim090DAO();
            List<Phim090> dsPhim = dao.getDSPhimdangchieu();
            if (dsPhim != null) {
                for (Phim090 phim : dsPhim) {
                    if (phim.getId() == phimId) {
                        phimChon = phim;
                        break;
                    }
                }
            }
            if (phimChon != null) {
                // Lưu thông tin phim đã chọn vào session
                session.setAttribute("phimDaChon", phimChon);
                System.out.println("Phim đã chọn: " + phimChon.getTen());

                // Chuyển hướng đến trang xác nhận lịch chiếu
                response.sendRedirect("gdXacnhanLichchieu090.jsp");
                return; // Dừng thực hiện tiếp
            } else {
                System.out.println("Không tìm thấy phim với ID: " + phimId);
            }
        } catch (NumberFormatException e) {
            System.out.println("ID phim không hợp lệ.");
        }
    }
    
    
    String idStr = request.getParameter("id");
    String ten = request.getParameter("ten");
    String daodien = request.getParameter("daodien");
    String thoiluongStr = request.getParameter("thoiluong");
    String mota = request.getParameter("mota");

    // Kiểm tra tất cả các tham số không null
    if (idStr != null && ten != null && daodien != null && thoiluongStr != null && mota != null) {
        try {
            int id = Integer.parseInt(idStr);
            int thoiluong = Integer.parseInt(thoiluongStr);
            
            // Tạo đối tượng Phim090
            Phim090 phimMoi = new Phim090(id, ten, daodien, thoiluong, mota, true);
            Phim090DAO phimDAO = new Phim090DAO();
            phimDAO.luuPhim(phimMoi);
            
            System.out.println("Lưu phim thành công!");
        } catch (NumberFormatException e) {
            System.out.println("Đã xảy ra lỗi: ID và thời lượng phải là số.");
        }
    } else {
        System.out.println("Tất cả các trường đều phải được điền đầy đủ.");
    }
%>

<body>
    <div class="container">
        <h1>Chọn phim</h1>
        
        <button class="button add-button" onclick="openModal()">Thêm phim</button>
        
        <table>
            <tr>
                <th>ID</th>
                <th>Tên</th>
                <th>Đạo diễn</th>
                <th>Thời lượng (phút)</th>
                <th>Chọn phim</th>
            </tr>
            <% Phim090DAO dao = new Phim090DAO();
               List<Phim090> dsPhim = dao.getDSPhimdangchieu();
               session.setAttribute("dsPhimDangchieu", dsPhim);
               if (dsPhim != null) {
                   for (Phim090 phim : dsPhim) { %>
                       <tr>
                           <td><%= phim.getId() %></td>
                           <td><%= phim.getTen() %></td>
                           <td><%= phim.getDaodien() %></td>
                           <td><%= phim.getThoiLuong() %></td>
                           <td>
                               <form action="gdChonPhim090.jsp" method="post">
                                   <input type="hidden" name="phimId" value="<%= phim.getId() %>">
                                   <button type="submit" class="button add-button">Chọn</button>
                               </form>
                           </td>
                       </tr>
                   <% }
               } else { %>
                   <tr><td colspan="5">Không tìm thấy phim</td></tr>
            <% } %>
        </table>
        <button class="button back-button" onclick="window.location.href='gdThemLichchieu090.jsp';">Quay lại</button>
    </div>
    
    <div id="addMovieModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>Thêm mới phim</h2>
            <form action="gdChonPhim090.jsp" method="post">
                <div class="form-group">
                    <label for="id">ID Phim:</label>
                    <input type="text" id="id" name="id" required>
                </div>
                <div class="form-group">
                    <label for="ten">Tên Phim:</label>
                    <input type="text" id="ten" name="ten" required>
                </div>
                <div class="form-group">
                    <label for="daodien">Đạo Diễn:</label>
                    <input type="text" id="daodien" name="daodien" required>
                </div>
                <div class="form-group">
                    <label for="thoiluong">Thời Lượng (phút):</label>
                    <input type="text" id="thoiluong" name="thoiluong" required>
                </div>
                <div class="form-group">
                    <label for="mota">Mô Tả:</label>
                    <textarea id="mota" name="mota" rows="3" required></textarea>
                </div>
                <button type="submit" class="button save-button">Lưu</button>
            </form>
        </div>
    </div>
</body>
</html>
