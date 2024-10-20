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

public class VeDuocDat090 {
    private int id;
    private int sove;
    private List<Ve090> ve;
    private float tongtien;
    private String trangthai;
    private String hinhthuc;

    public VeDuocDat090(int id, int sove, List<Ve090> ve, float tongtien, String trangthai, String hinhthuc) {
        this.id = id;
        this.sove = sove;
        this.ve = ve;
        this.tongtien = tongtien;
        this.trangthai = trangthai;
        this.hinhthuc = hinhthuc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSove() {
        return sove;
    }

    public void setSove(int sove) {
        this.sove = sove;
    }

    public List<Ve090> getVe() {
        return ve;
    }

    public void setVe(List<Ve090> ve) {
        this.ve = ve;
    }

    public float getTongtien() {
        return tongtien;
    }

    public void setTongtien(float tongtien) {
        this.tongtien = tongtien;
    }

    public String getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(String trangthai) {
        this.trangthai = trangthai;
    }

    public String getHinhthuc() {
        return hinhthuc;
    }

    public void setHinhthuc(String hinhthuc) {
        this.hinhthuc = hinhthuc;
    }
}
