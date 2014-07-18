/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.model;

/**
 *
 * @author Admin
 */
public class Fotos_Trabajador {

    private String id_foto;
    private String de_foto;
    private String ar_foto;
    private String no_ar_foto;
    private String ta_ar_foto;
    private String ti_ar_foto;
    private String id_trabajador;

    public Fotos_Trabajador(String id_foto, String de_foto, String ar_foto, String no_ar_foto, String ta_ar_foto, String ti_ar_foto, String id_trabajador) {
        this.id_foto = id_foto;
        this.de_foto = de_foto;
        this.ar_foto = ar_foto;
        this.no_ar_foto = no_ar_foto;
        this.ta_ar_foto = ta_ar_foto;
        this.ti_ar_foto = ti_ar_foto;
        this.id_trabajador = id_trabajador;
    }

    public Fotos_Trabajador() {
        this.id_foto = id_foto;
        this.de_foto = de_foto;
        this.ar_foto = ar_foto;
        this.no_ar_foto = no_ar_foto;
        this.ta_ar_foto = ta_ar_foto;
        this.ti_ar_foto = ti_ar_foto;
        this.id_trabajador = id_trabajador;
    }

    public String getId_foto() {
        return id_foto;
    }

    public void setId_foto(String id_foto) {
        this.id_foto = id_foto;
    }

    public String getDe_foto() {
        return de_foto;
    }

    public void setDe_foto(String de_foto) {
        this.de_foto = de_foto;
    }

    public String getAr_foto() {
        return ar_foto;
    }

    public void setAr_foto(String ar_foto) {
        this.ar_foto = ar_foto;
    }

    public String getNo_ar_foto() {
        return no_ar_foto;
    }

    public void setNo_ar_foto(String no_ar_foto) {
        this.no_ar_foto = no_ar_foto;
    }

    public String getTa_ar_foto() {
        return ta_ar_foto;
    }

    public void setTa_ar_foto(String ta_ar_foto) {
        this.ta_ar_foto = ta_ar_foto;
    }

    public String getTi_ar_foto() {
        return ti_ar_foto;
    }

    public void setTi_ar_foto(String ti_ar_foto) {
        this.ti_ar_foto = ti_ar_foto;
    }

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajador) {
        this.id_trabajador = id_trabajador;
    }

    
}
