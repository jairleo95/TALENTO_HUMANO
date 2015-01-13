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
public class Formato_Horario {
    private String id_formato_horario;  
    private String no_turno; 
    private String no_dia; 
    private String ho_desde; 
    private String ho_hasta;
    private String es_f_horario;
    private String id_tipo_horario;

    public Formato_Horario(String id_formato_horario, String no_turno, String no_dia, String ho_desde, String ho_hasta, String es_f_horario, String id_tipo_horario) {
        this.id_formato_horario = id_formato_horario;
        this.no_turno = no_turno;
        this.no_dia = no_dia;
        this.ho_desde = ho_desde;
        this.ho_hasta = ho_hasta;
        this.es_f_horario = es_f_horario;
        this.id_tipo_horario = id_tipo_horario;
    }
    
    public Formato_Horario() {
        this.id_formato_horario = "";
        this.no_turno = "";
        this.no_dia = "";
        this.ho_desde = "";
        this.ho_hasta = "";
        this.es_f_horario = "";
        this.id_tipo_horario = "";
    }

    public String getId_formato_horario() {
        return id_formato_horario;
    }

    public void setId_formato_horario(String id_formato_horario) {
        this.id_formato_horario = id_formato_horario;
    }

    public String getNo_turno() {
        return no_turno;
    }

    public void setNo_turno(String no_turno) {
        this.no_turno = no_turno;
    }

    public String getNo_dia() {
        return no_dia;
    }

    public void setNo_dia(String no_dia) {
        this.no_dia = no_dia;
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

    public String getEs_f_horario() {
        return es_f_horario;
    }

    public void setEs_f_horario(String es_f_horario) {
        this.es_f_horario = es_f_horario;
    }

    public String getId_tipo_horario() {
        return id_tipo_horario;
    }

    public void setId_tipo_horario(String id_tipo_horario) {
        this.id_tipo_horario = id_tipo_horario;
    }
     
}
