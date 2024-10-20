/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nemo.btl_pttk.model;

/**
 *
 * @author Admin
 */
public class Nhanvien090 extends Thanhvien090 {
    private float luong;

    public Nhanvien090(int id, String ten, String tendangnhap, String matkhau, String diachi, String email, String sdt) {
        super(id, ten, tendangnhap, matkhau, diachi, email, sdt);
        this.luong = luong;
    }

    public float getLuong() {
        return luong;
    }

    public void setLuong(float luong) {
        this.luong = luong;
    }
}

