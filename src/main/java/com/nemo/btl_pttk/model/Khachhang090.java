/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nemo.btl_pttk.model;


public class Khachhang090 extends Thanhvien090 {
    private String mota;
    
    public Khachhang090(int id, String ten, String tendangnhap, String matkhau, String diachi, String email, String sdt, String mota) {
        super(id, ten, tendangnhap, matkhau, diachi, email, sdt);
        this.mota = mota;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }
    
    
    
}
