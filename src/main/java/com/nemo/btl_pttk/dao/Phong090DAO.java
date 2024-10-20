/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nemo.btl_pttk.dao;

import static com.nemo.btl_pttk.dao.DAO.con;
import com.nemo.btl_pttk.model.Phim090;
import com.nemo.btl_pttk.model.Phong090;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Phong090DAO extends DAO{

    public Phong090DAO() {
        super();
    }
    
    public ArrayList<Phong090> getPhongtrong(){
         ArrayList<Phong090> kq = new ArrayList<>();
        String sql = "{call Phongtrong()}";
        try {
            CallableStatement cs = con.prepareCall(sql);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String ten = rs.getString("ten");
                int succhua = rs.getInt("succhua");
                String mota = rs.getString("mota");

                Phong090 phong = new Phong090(id, ten, succhua, mota);
                kq.add(phong);
            }
            rs.close();
            cs.close();
        } catch (Exception e) {
            e.printStackTrace();
            kq = null;
        }
        return kq;
    }
    
}
