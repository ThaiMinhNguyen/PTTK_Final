/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nemo.btl_pttk.model;

/**
 *
 * @author Admin
 */
public class Phim090 {
    private int id;
    private String ten;
    private String daodien;
    private int thoiLuong;
    private String mota;
    private boolean dangchieu;
    
    public Phim090(int id, String ten, String daodien, int thoiLuong, String mota) {
        this.id = id;
        this.ten = ten;
        this.daodien = daodien;
        this.thoiLuong = thoiLuong;
        this.mota = mota;
    }
    
    public Phim090(int id, String ten, String daodien, int thoiLuong, String mota, boolean dangchieu) {
        this.id = id;
        this.ten = ten;
        this.daodien = daodien;
        this.thoiLuong = thoiLuong;
        this.mota = mota;
        this.dangchieu = dangchieu;
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

    public String getDaodien() {
        return daodien;
    }

    public void setDaodien(String daodien) {
        this.daodien = daodien;
    }

    public int getThoiLuong() {
        return thoiLuong;
    }

    public void setThoiLuong(int thoiLuong) {
        this.thoiLuong = thoiLuong;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public boolean isDangchieu() {
        return dangchieu;
    }

    public void setDangchieu(boolean dangchieu) {
        this.dangchieu = dangchieu;
    }
    
}

