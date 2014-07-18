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
public class Padre_Madre_Conyugue {

    private String id_padre_madre_conyugue;
    private String ap_nombres_padre;
    private String ap_nombres_madre;
    private String es_trabaja_upeu_conyugue;
    private String ap_nombres_conyugue;
    private String fe_nac_conyugue;
    private String ti_doc_id;
    private String nu_doc;
    private String li_inscripcion_vig_essalud;
    private String us_creacion;
    private String fe_creacion;
    private String us_modif;
    private String fe_modif;
    private String ip_usuario;
    private String id_trabajador;

    public Padre_Madre_Conyugue(String id_padre_madre_conyugue, String ap_nombres_padre, String ap_nombres_madre, String es_trabaja_upeu_conyugue, String ap_nombres_conyugue, String fe_nac_conyugue, String ti_doc_id, String nu_doc, String li_inscripcion_vig_essalud, String us_creacion, String fe_creacion, String us_modif, String fe_modif, String ip_usuario, String id_trabajador) {
        this.id_padre_madre_conyugue = id_padre_madre_conyugue;
        this.ap_nombres_padre = ap_nombres_padre;
        this.ap_nombres_madre = ap_nombres_madre;
        this.es_trabaja_upeu_conyugue = es_trabaja_upeu_conyugue;
        this.ap_nombres_conyugue = ap_nombres_conyugue;
        this.fe_nac_conyugue = fe_nac_conyugue;
        this.ti_doc_id = ti_doc_id;
        this.nu_doc = nu_doc;
        this.li_inscripcion_vig_essalud = li_inscripcion_vig_essalud;
        this.us_creacion = us_creacion;
        this.fe_creacion = fe_creacion;
        this.us_modif = us_modif;
        this.fe_modif = fe_modif;
        this.ip_usuario = ip_usuario;
        this.id_trabajador = id_trabajador;
    }

    public Padre_Madre_Conyugue() {
        this.id_padre_madre_conyugue = "";
        this.ap_nombres_padre = "";
        this.ap_nombres_madre = "";
        this.es_trabaja_upeu_conyugue ="";
        this.ap_nombres_conyugue = "";
        this.fe_nac_conyugue = "";
        this.ti_doc_id = "";
        this.nu_doc = "";
        this.li_inscripcion_vig_essalud = "";
        this.us_creacion = "";
        this.fe_creacion = "";
        this.us_modif = "";
        this.fe_modif = "";
        this.ip_usuario = "";
        this.id_trabajador = "";
    }

    public String getId_padre_madre_conyugue() {
        return id_padre_madre_conyugue;
    }

    public void setId_padre_madre_conyugue(String id_padre_madre_conyugue) {
        this.id_padre_madre_conyugue = id_padre_madre_conyugue;
    }

    public String getAp_nombres_padre() {
        return ap_nombres_padre;
    }

    public void setAp_nombres_padre(String ap_nombres_padre) {
        this.ap_nombres_padre = ap_nombres_padre;
    }

    public String getAp_nombres_madre() {
        return ap_nombres_madre;
    }

    public void setAp_nombres_madre(String ap_nombres_madre) {
        this.ap_nombres_madre = ap_nombres_madre;
    }

    public String getEs_trabaja_upeu_conyugue() {
        return es_trabaja_upeu_conyugue;
    }

    public void setEs_trabaja_upeu_conyugue(String es_trabaja_upeu_conyugue) {
        this.es_trabaja_upeu_conyugue = es_trabaja_upeu_conyugue;
    }

    public String getAp_nombres_conyugue() {
        return ap_nombres_conyugue;
    }

    public void setAp_nombres_conyugue(String ap_nombres_conyugue) {
        this.ap_nombres_conyugue = ap_nombres_conyugue;
    }

    public String getFe_nac_conyugue() {
        return fe_nac_conyugue;
    }

    public void setFe_nac_conyugue(String fe_nac_conyugue) {
        this.fe_nac_conyugue = fe_nac_conyugue;
    }

    public String getTi_doc_id() {
        return ti_doc_id;
    }

    public void setTi_doc_id(String ti_doc_id) {
        this.ti_doc_id = ti_doc_id;
    }

    public String getNu_doc() {
        return nu_doc;
    }

    public void setNu_doc(String nu_doc) {
        this.nu_doc = nu_doc;
    }

    public String getLi_inscripcion_vig_essalud() {
        return li_inscripcion_vig_essalud;
    }

    public void setLi_inscripcion_vig_essalud(String li_inscripcion_vig_essalud) {
        this.li_inscripcion_vig_essalud = li_inscripcion_vig_essalud;
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

    public String getUs_modif() {
        return us_modif;
    }

    public void setUs_modif(String us_modif) {
        this.us_modif = us_modif;
    }

    public String getFe_modif() {
        return fe_modif;
    }

    public void setFe_modif(String fe_modif) {
        this.fe_modif = fe_modif;
    }

    public String getIp_usuario() {
        return ip_usuario;
    }

    public void setIp_usuario(String ip_usuario) {
        this.ip_usuario = ip_usuario;
    }

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajador) {
        this.id_trabajador = id_trabajador;
    }
    
    
}
