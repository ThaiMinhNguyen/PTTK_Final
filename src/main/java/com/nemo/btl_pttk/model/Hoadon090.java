/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nemo.btl_pttk.model;


import java.util.Date;

public class Hoadon090 {
    private int id;
    private float tongtien;
    private Date ngaytao;
    private NVBanhang090 nvBanHang;
    private Khachhang090 khachhang;
    private VeDuocDat090 veDuocDat;

    public Hoadon090(int id, float tongtien, Date ngaytao, NVBanhang090 nvBanHang, Khachhang090 khachhang, VeDuocDat090 veDuocDat) {
        this.id = id;
        this.tongtien = tongtien;
        this.ngaytao = ngaytao;
        this.nvBanHang = nvBanHang;
        this.khachhang = khachhang;
        this.veDuocDat = veDuocDat;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getTongtien() {
        return tongtien;
    }

    public void setTongtien(float tongtien) {
        this.tongtien = tongtien;
    }

    public Date getNgaytao() {
        return ngaytao;
    }

    public void setNgaytao(Date ngaytao) {
        this.ngaytao = ngaytao;
    }

    public NVBanhang090 getNvBanhang() {
        return nvBanHang;
    }

    public void setNvBanhang(NVBanhang090 nvBanHang) {
        this.nvBanHang = nvBanHang;
    }

    public Khachhang090 getKhachhang() {
        return khachhang;
    }

    public void setKhachhang(Khachhang090 khachhang) {
        this.khachhang = khachhang;
    }

    public VeDuocDat090 getVeDuocDat() {
        return veDuocDat;
    }

    public void setVeDuocDat(VeDuocDat090 veDuocDat) {
        this.veDuocDat = veDuocDat;
    }
}

