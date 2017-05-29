/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.model;

/**
 *
 * @author Alex
 */
public class Hist_Estado_Civil {
    
    private String id_estado_civil;
    private String li_estado_civil;
    private String fe_modificacion;
    private String us_modificacion;
    private String id_trabajador;

    public Hist_Estado_Civil(String id_estado_civil, String li_estado_civil, String fe_modificacion, String us_modificacion, String id_trabajador) {
        this.id_estado_civil = id_estado_civil;
        this.li_estado_civil = li_estado_civil;
        this.fe_modificacion = fe_modificacion;
        this.us_modificacion = us_modificacion;
        this.id_trabajador = id_trabajador;
    }

    public Hist_Estado_Civil() {
        this.id_estado_civil = "";
        this.li_estado_civil = "";
        this.fe_modificacion = "";
        this.us_modificacion = "";
        this.id_trabajador = "";
    }

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajador) {
        this.id_trabajador = id_trabajador;
    }
     
    public String getId_estado_civil() {
        return id_estado_civil;
    }

    public void setId_estado_civil(String id_estado_civil) {
        this.id_estado_civil = id_estado_civil;
    }

    public String getLi_estado_civil() {
        return li_estado_civil;
    }

    public void setLi_estado_civil(String li_estado_civil) {
        this.li_estado_civil = li_estado_civil;
    }

    public String getFe_modificacion() {
        return fe_modificacion;
    }

    public void setFe_modificacion(String fe_modificacion) {
        this.fe_modificacion = fe_modificacion;
    }

    public String getUs_modificacion() {
        return us_modificacion;
    }

    public void setUs_modificacion(String us_modificacion) {
        this.us_modificacion = us_modificacion;
    }
    
 }
