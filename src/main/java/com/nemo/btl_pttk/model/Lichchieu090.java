/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nemo.btl_pttk.model;

import java.time.LocalDateTime;

/**
 *
 * @author Admin
 */
public class Lichchieu090 {
    private int id;
    private LocalDateTime giobatdau;
    private LocalDateTime gioketthuc;
    private Phim090 phim;
    private Phong090 phong;

    public Lichchieu090(int id, LocalDateTime giobatdau, LocalDateTime gioketthuc, Phim090 phim, Phong090 phong) {
        this.id = id;
        this.giobatdau = giobatdau;
        this.gioketthuc = gioketthuc;
        this.phim = phim;
        this.phong = phong;
    }
    
    public Lichchieu090(LocalDateTime giobatdau, LocalDateTime gioketthuc, Phim090 phim, Phong090 phong) {
        this.giobatdau = giobatdau;
        this.gioketthuc = gioketthuc;
        this.phim = phim;
        this.phong = phong;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDateTime getGiobatdau() {
        return giobatdau;
    }

    public void setGiobatdau(LocalDateTime giobatdau) {
        this.giobatdau = giobatdau;
    }

    public LocalDateTime getGioketthuc() {
        return gioketthuc;
    }

    public void setGioketthuc(LocalDateTime gioketthuc) {
        this.gioketthuc = gioketthuc;
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

