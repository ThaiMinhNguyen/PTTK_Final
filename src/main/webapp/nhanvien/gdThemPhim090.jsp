<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.nemo.btl_pttk.model.*, com.nemo.btl_pttk.dao.*" %>
<%
    String idStr = request.getParameter("id");
    String ten = request.getParameter("ten");
    String daodien = request.getParameter("daodien");
    String thoiluongStr = request.getParameter("thoiluong");
    String mota = request.getParameter("mota");

    int id = Integer.parseInt(idStr);
    int thoiluong = Integer.parseInt(thoiluongStr);

    Phim090 phim = new Phim090(id, ten, daodien, thoiluong, mota, true);
    Phim090DAO phimDAO = new Phim090DAO();
    phimDAO.luuPhim(phim);
    
    List<Phim090> dsPhim = (List<Phim090>) session.getAttribute("dsPhim");
    if (dsPhim == null) {
        dsPhim = new ArrayList<>(); // Khởi tạo danh sách nếu chưa có
    }
    dsPhim.add(phim); // Thêm phim mới vào danh sách

    session.setAttribute("dsPhim", dsPhim);
    
    response.sendRedirect("gdChonPhim090.jsp");
%>
