/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nemo.btl_pttk.model;

/**
 *
 * @author Admin
 */
import java.util.Date;

public class Ve090 {
    private int id;
    private Date ngaymua;
    private float giatien;
    private Lichchieu090 lichchieu;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getNgaymua() {
        return ngaymua;
    }

    public void setNgaymua(Date ngaymua) {
        this.ngaymua = ngaymua;
    }

    public float getGiatien() {
        return giatien;
    }

    public void setGiatien(float giatien) {
        this.giatien = giatien;
    }

    public Lichchieu090 getLichchieu() {
        return lichchieu;
    }

    public void setLichchieu(Lichchieu090 lichchieu) {
        this.lichchieu = lichchieu;
    }
}

