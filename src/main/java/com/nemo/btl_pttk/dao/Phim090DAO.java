/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nemo.btl_pttk.dao;

import com.nemo.btl_pttk.model.Phim090;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Phim090DAO extends DAO {

    public Phim090DAO() {
        super();
    }

    public ArrayList<Phim090> getPhimtheotukhoa(String tukhoa) {
        ArrayList<Phim090> kq = new ArrayList<>();
        String sql = "{call Phimtheotukhoa(?)}";
        try {
            CallableStatement cs = con.prepareCall(sql);
            cs.setString(1, tukhoa);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String ten = rs.getString("ten");
                String daodien = rs.getString("daodien");
                int thoiLuong = rs.getInt("thoiluong");
                String mota = rs.getString("mota");

                Phim090 phim = new Phim090(id, ten, daodien, thoiLuong, mota);
                kq.add(phim);
            }
            rs.close();
            cs.close();
        } catch (Exception e) {
            e.printStackTrace();
            kq = null;
        }
        return kq;
    }

    public ArrayList<Phim090> getDSPhimdangchieu() {
        ArrayList<Phim090> kq = new ArrayList<>();
        String sql = "{call Phimdangchieu()}";
        try {
            CallableStatement cs = con.prepareCall(sql);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String ten = rs.getString("ten");
                String daodien = rs.getString("daodien");
                int thoiLuong = rs.getInt("thoiluong");
                String mota = rs.getString("mota");

                Phim090 phim = new Phim090(id, ten, daodien, thoiLuong, mota);
                kq.add(phim);
            }
            rs.close();
            cs.close();
        } catch (Exception e) {
            e.printStackTrace();
            kq = null;
        }
        return kq;
    }

    public boolean luuPhim(Phim090 phim) {
        if (phim == null) {
            return false;
        }
        boolean result = false;
        String sql = "INSERT INTO tblPhim090 (id, ten, daodien, thoiLuong, mota, dangchieu) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, phim.getId());
            ps.setString(2, phim.getTen());
            ps.setString(3, phim.getDaodien());
            ps.setInt(4, phim.getThoiLuong());
            ps.setString(5, phim.getMota());
            ps.setBoolean(6, phim.isDangchieu());

            result = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }
}
