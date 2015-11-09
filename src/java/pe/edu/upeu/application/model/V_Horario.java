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
public class V_Horario {

    private String id_dgp;
    private String id_detalle_horario;
    private String dia_horario;
    private String ho_desde;
    private String ho_hasta;
    private String id_horario;
    private String no_ti_horario;

    public V_Horario() {
    }

    public V_Horario(String id_dgp, String id_detalle_horario, String dia_horario, String ho_desde, String ho_hasta, String id_horario, String no_ti_horario) {
        this.id_dgp = id_dgp;
        this.id_detalle_horario = id_detalle_horario;
        this.dia_horario = dia_horario;
        this.ho_desde = ho_desde;
        this.ho_hasta = ho_hasta;
        this.id_horario = id_horario;
        this.no_ti_horario = no_ti_horario;
    }

    public String getId_dgp() {
        return id_dgp;
    }

    public void setId_dgp(String id_dgp) {
        this.id_dgp = id_dgp;
    }

    public String getId_detalle_horario() {
        return id_detalle_horario;
    }

    public void setId_detalle_horario(String id_detalle_horario) {
        this.id_detalle_horario = id_detalle_horario;
    }

    public String getDia_horario() {
        return dia_horario;
    }

    public void setDia_horario(String dia_horario) {
        this.dia_horario = dia_horario;
    }

    public String getHo_desde() {
        return ho_desde;
    }

    public void setHo_desde(String ho_desde) {
        this.ho_desde = ho_desde;
    }

    public String getHo_hasta() {
        return ho_hasta;
    }

    public void setHo_hasta(String ho_hasta) {
        this.ho_hasta = ho_hasta;
    }

    public String getId_horario() {
        return id_horario;
    }

    public void setId_horario(String id_horario) {
        this.id_horario = id_horario;
    }

    public String getNo_ti_horario() {
        return no_ti_horario;
    }

    public void setNo_ti_horario(String no_ti_horario) {
        this.no_ti_horario = no_ti_horario;
    }

    
    
}
