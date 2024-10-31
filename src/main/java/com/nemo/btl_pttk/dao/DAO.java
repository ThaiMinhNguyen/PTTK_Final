/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nemo.btl_pttk.dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Admin
 */
public class DAO {

    public static Connection con;
    
    public DAO() {
        String userName = "root";
        String password = "22012003";
        if (con == null) {
            String dbUrl = "jdbc:mysql://localhost:3306/cineman?autoReconnect = true & useSSL = false";
            String dbClass = "com.mysql.jdbc.Driver";
            try {
                Class.forName(dbClass);
                con = DriverManager.getConnection(dbUrl, userName, password);
                System.out.println("Kết nối thành công");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
