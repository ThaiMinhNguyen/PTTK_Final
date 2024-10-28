/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nemo.btl_pttk.dao;

import com.nemo.btl_pttk.model.Lichchieu090;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

public class Lichchieu090DAO extends DAO {

    public Lichchieu090DAO() {
        super();
    }

    public boolean luuLichchieu(Lichchieu090 lichchieu) {
        if (lichchieu == null) {
            return false;
        }

        String sql = "INSERT INTO Lichchieu090 (id, giobatdau, gioketthuc, phim, phong) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, lichchieu.getId());
            ps.setTimestamp(2, Timestamp.valueOf(lichchieu.getGiobatdau()));  // Lưu giobatdau dưới dạng TIMESTAMP
            ps.setTimestamp(3, Timestamp.valueOf(lichchieu.getGioketthuc()));  // Lưu gioketthuc dưới dạng TIMESTAMP
            ps.setInt(4, lichchieu.getPhim().getId());
            ps.setInt(5, lichchieu.getPhong().getId());

            int rowsInserted = ps.executeUpdate();
            ps.close();
            return rowsInserted > 0; // Trả về true nếu có ít nhất một dòng được chèn
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
