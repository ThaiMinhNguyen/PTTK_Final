/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nemo.btl_pttk.model;

/**
 *
 * @author Admin
 */
public class Lichchieu090 {
    private int id;
    private int thoigian;
    private String phongchieu;
    private Phim090 phim;
    private Phong090 phong;

    public Lichchieu090(int id, int thoigian, String phongchieu, Phim090 phim, Phong090 phong) {
        this.id = id;
        this.thoigian = thoigian;
        this.phongchieu = phongchieu;
        this.phim = phim;
        this.phong = phong;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getThoigian() {
        return thoigian;
    }

    public void setThoigian(int thoigian) {
        this.thoigian = thoigian;
    }

    public String getPhongchieu() {
        return phongchieu;
    }

    public void setPhongchieu(String phongchieu) {
        this.phongchieu = phongchieu;
    }

    public Phim090 getPhim() {
        return phim;
    }

    public void setPhim(Phim090 phim) {
        this.phim = phim;
    }

    public Phong090 getPhong() {
        return phong;
    }

    public void setPhong(Phong090 phong) {
        this.phong = phong;
    }
}

