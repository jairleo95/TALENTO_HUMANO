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
public class Detalle_Horario {

    private String id_detalle_horario;
    private String id_dgp;
    private String es_detalle_horario;
    private String us_creacion;
    private String fe_creacion;
    private String us_modificacion;
    private String fe_modificacion;

    public Detalle_Horario(String id_detalle_horario, String id_dgp, String es_detalle_horario, String us_creacion, String fe_creacion, String us_modificacion, String fe_modificacion) {
        this.id_detalle_horario = id_detalle_horario;
        this.id_dgp = id_dgp;
        this.es_detalle_horario = es_detalle_horario;
        this.us_creacion = us_creacion;
        this.fe_creacion = fe_creacion;
        this.us_modificacion = us_modificacion;
        this.fe_modificacion = fe_modificacion;
    }

    public Detalle_Horario() {
        this.id_detalle_horario = id_detalle_horario;
        this.id_dgp = id_dgp;
        this.es_detalle_horario = es_detalle_horario;
        this.us_creacion = us_creacion;
        this.fe_creacion = fe_creacion;
        this.us_modificacion = us_modificacion;
        this.fe_modificacion = fe_modificacion;
    }

    public String getId_detalle_horario() {
        return id_detalle_horario;
    }

    public void setId_detalle_horario(String id_detalle_horario) {
        this.id_detalle_horario = id_detalle_horario;
    }

    public String getId_dgp() {
        return id_dgp;
    }

    public void setId_dgp(String id_dgp) {
        this.id_dgp = id_dgp;
    }

    public String getEs_detalle_horario() {
        return es_detalle_horario;
    }

    public void setEs_detalle_horario(String es_detalle_horario) {
        this.es_detalle_horario = es_detalle_horario;
    }

    public String getUs_creacion() {
        return us_creacion;
    }

    public void setUs_creacion(String us_creacion) {
        this.us_creacion = us_creacion;
    }

    public String getFe_creacion() {
        return fe_creacion;
    }

    public void setFe_creacion(String fe_creacion) {
        this.fe_creacion = fe_creacion;
    }

    public String getUs_modificacion() {
        return us_modificacion;
    }

    public void setUs_modificacion(String us_modificacion) {
        this.us_modificacion = us_modificacion;
    }

    public String getFe_modificacion() {
        return fe_modificacion;
    }

    public void setFe_modificacion(String fe_modificacion) {
        this.fe_modificacion = fe_modificacion;
    }
    
    
}
