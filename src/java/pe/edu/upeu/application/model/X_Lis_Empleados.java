/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.model;

/**
 *
 * @author joserodrigo
 */
public class X_Lis_Empleados {
    private String id_empleado;
    private String id_trabajador;
    private String no_trabajador;
    private String ap_materno;
    private String ap_paterno;
    private String nu_doc;
    private String ar_foto;

    public X_Lis_Empleados(String id_empleado, String id_trabajador, String no_trabajador, String ap_materno, String ap_paterno, String nu_doc, String ar_foto) {
        this.id_empleado = id_empleado;
        this.id_trabajador = id_trabajador;
        this.no_trabajador = no_trabajador;
        this.ap_materno = ap_materno;
        this.ap_paterno = ap_paterno;
        this.nu_doc = nu_doc;
        this.ar_foto = ar_foto;
        
    }
    public X_Lis_Empleados() {
        this.id_empleado = "";
        this.id_trabajador = "";
        this.no_trabajador = "";
        this.ap_materno = "";
        this.ap_paterno = "";
        this.nu_doc = "";
        this.ar_foto = "";
    }

    public String getAr_foto() {
        return ar_foto;
    }

    public void setAr_foto(String ar_foto) {
        this.ar_foto = ar_foto;
    }

    public String getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(String id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajadp) {
        this.id_trabajador = id_trabajadp;
    }

    public String getNo_trabajador() {
        return no_trabajador;
    }

    public void setNo_trabajador(String no_trabajador) {
        this.no_trabajador = no_trabajador;
    }

    public String getAp_materno() {
        return ap_materno;
    }

    public void setAp_materno(String ap_materno) {
        this.ap_materno = ap_materno;
    }

    public String getAp_paterno() {
        return ap_paterno;
    }

    public void setAp_paterno(String ap_paterno) {
        this.ap_paterno = ap_paterno;
    }

    public String getNu_doc() {
        return nu_doc;
    }

    public void setNu_doc(String nu_doc) {
        this.nu_doc = nu_doc;
    }
    
}
