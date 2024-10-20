/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nemo.btl_pttk.model;

/**
 *
 * @author Admin
 */
import java.util.List;

public class Rapphim090 {
    private int id;
    private String ten;
    private String diachi;
    private String mota;
    private List<Phong090> phong;
    private List<Thanhvien090> thanhvien;

    public Rapphim090(int id, String ten, String diachi, String mota, List<Phong090> phong, List<Thanhvien090> thanhvien) {
        this.id = id;
        this.ten = ten;
        this.diachi = diachi;
        this.mota = mota;
        this.phong = phong;
        this.thanhvien = thanhvien;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public List<Phong090> getPhong() {
        return phong;
    }

    public void setPhong(List<Phong090> phong) {
        this.phong = phong;
    }

    public List<Thanhvien090> getThanhvien() {
        return thanhvien;
    }

    public void setThanhvien(List<Thanhvien090> thanhvien) {
        this.thanhvien = thanhvien;
    }
}
