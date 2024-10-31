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

        String sql = "INSERT INTO tblLichchieu090 (giobatdau, gioketthuc, tblPhim090id, tblPhong090id) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setTimestamp(1, Timestamp.valueOf(lichchieu.getGiobatdau()));
            ps.setTimestamp(2, Timestamp.valueOf(lichchieu.getGioketthuc()));
            ps.setInt(3, lichchieu.getPhim().getId());
            ps.setInt(4, lichchieu.getPhong().getId());

            int rowsInserted = ps.executeUpdate();
            ps.close();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Lỗi khi lưu lịch chiếu: " + e.getMessage());
            return false;
        }
    }
}
