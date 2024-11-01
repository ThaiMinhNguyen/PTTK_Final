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
public class Thethanhvien090 {
    private int id;
    private String loai;
    private String mota;
    private LocalDateTime ngaydangky;

    public Thethanhvien090(int id, String loai, String mota, LocalDateTime ngaydangky) {
        this.id = id;
        this.loai = loai;
        this.mota = mota;
        this.ngaydangky = ngaydangky;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLoai() {
        return loai;
    }

    public void setLoai(String loai) {
        this.loai = loai;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public LocalDateTime getNgaydangky() {
        return ngaydangky;
    }

    public void setNgaydangky(LocalDateTime ngaydangky) {
        this.ngaydangky = ngaydangky;
    }
}

