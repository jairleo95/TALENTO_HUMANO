/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.model;

/**
 *
 * @author Jose
 */
public class X_List_det_dgp {

    private String id_dgp;
    private String id_trabajador;
    private String no_trabajador;
    private String ap_paterno;
    private String ap_materno;
    private String id_puesto;
    private String fe_desde;
    private String fe_hasta;
    private Double ca_sueldo;
    private String no_puesto;
    private String no_area;
    private String no_req;
    private String es_dgp;
    private String li_motivo;
    private double ca_bono_alimentario;
    private double ca_bonificacion_p;
    private double ca_asig_familiar;
    private String anno_procesamiento;
    private String mes_procesamiento;
    private int cod_aps;

    public int getCod_aps() {
        return cod_aps;
    }

    public void setCod_aps(int cod_aps) {
        this.cod_aps = cod_aps;
    }

    public String getNu_doc() {
        return nu_doc;
    }

    public void setNu_doc(String nu_doc) {
        this.nu_doc = nu_doc;
    }
    private String nu_doc;

    public String getLi_motivo() {
        return li_motivo;
    }

    public void setLi_motivo(String li_motivo) {
        this.li_motivo = li_motivo;
    }

    public double getCa_bono_alimentario() {
        return ca_bono_alimentario;
    }

    public void setCa_bono_alimentario(double ca_bono_alimentario) {
        this.ca_bono_alimentario = ca_bono_alimentario;
    }

    public double getCa_bonificacion_p() {
        return ca_bonificacion_p;
    }

    public void setCa_bonificacion_p(double ca_bonificacion_p) {
        this.ca_bonificacion_p = ca_bonificacion_p;
    }

    public double getCa_asig_familiar() {
        return ca_asig_familiar;
    }

    public String getAnno_procesamiento() {
        return anno_procesamiento;
    }

    public void setAnno_procesamiento(String anno_procesamiento) {
        this.anno_procesamiento = anno_procesamiento;
    }

    public String getMes_procesamiento() {
        return mes_procesamiento;
    }

    public void setMes_procesamiento(String mes_procesamiento) {
        this.mes_procesamiento = mes_procesamiento;
    }

    public void setCa_asig_familiar(double ca_asig_familiar) {
        this.ca_asig_familiar = ca_asig_familiar;
    }

    public X_List_det_dgp(String id_dgp, String id_trabajador, String no_trabajador, String ap_paterno, String ap_materno,
            String id_puesto, String fe_desde, String fe_hasta, Double ca_sueldo, String no_puesto, String no_area,
            String no_req, String es_dgp, String li_motivo, double ca_bono_alimentario, double ca_bonificacion_p,
            double ca_asig_familiar, String anno_procesamiento, String mes_procesamiento, int cod_aps, String nu_doc) {
        this.id_dgp = id_dgp;
        this.id_trabajador = id_trabajador;
        this.no_trabajador = no_trabajador;
        this.ap_paterno = ap_paterno;
        this.ap_materno = ap_materno;
        this.id_puesto = id_puesto;
        this.fe_desde = fe_desde;
        this.fe_hasta = fe_hasta;
        this.ca_sueldo = ca_sueldo;
        this.no_puesto = no_puesto;
        this.no_area = no_area;
        this.no_req = no_req;
        this.es_dgp = es_dgp;
        this.li_motivo = li_motivo;
        this.ca_bono_alimentario = ca_bono_alimentario;
        this.ca_bonificacion_p = ca_bonificacion_p;
        this.ca_asig_familiar = ca_asig_familiar;
        this.anno_procesamiento = anno_procesamiento;
        this.mes_procesamiento = mes_procesamiento;
        this.cod_aps = cod_aps;
        this.nu_doc = nu_doc;
    }

    public X_List_det_dgp() {
        this.id_dgp = "";
        this.id_trabajador = "";
        this.no_trabajador = "";
        this.ap_paterno = "";
        this.ap_materno = "";
        this.id_puesto = "";
        this.fe_desde = "";
        this.fe_hasta = "";
        this.ca_sueldo = 0.0;
        this.no_puesto = "";
        this.no_area = "";
        this.no_req = "";
        this.es_dgp = "";
        this.li_motivo = "";
        this.ca_bono_alimentario = 0.0;
        this.ca_bonificacion_p = 0.0;
        this.ca_asig_familiar = 0.0;
        this.anno_procesamiento = "";
        this.mes_procesamiento = "";
        this.cod_aps = 0;
        this.nu_doc = "";
    }

    public String getId_dgp() {
        return id_dgp;
    }

    public void setId_dgp(String id_dgp) {
        this.id_dgp = id_dgp;
    }

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajador) {
        this.id_trabajador = id_trabajador;
    }

    public String getNo_trabajador() {
        return no_trabajador;
    }

    public void setNo_trabajador(String no_trabajador) {
        this.no_trabajador = no_trabajador;
    }

    public String getAp_paterno() {
        return ap_paterno;
    }

    public void setAp_paterno(String ap_paterno) {
        this.ap_paterno = ap_paterno;
    }

    public String getAp_materno() {
        return ap_materno;
    }

    public void setAp_materno(String ap_materno) {
        this.ap_materno = ap_materno;
    }

    public String getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(String id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getFe_desde() {
        return fe_desde;
    }

    public void setFe_desde(String fe_desde) {
        this.fe_desde = fe_desde;
    }

    public String getFe_hasta() {
        return fe_hasta;
    }

    public void setFe_hasta(String fe_hasta) {
        this.fe_hasta = fe_hasta;
    }

    public Double getCa_sueldo() {
        return ca_sueldo;
    }

    public void setCa_sueldo(Double ca_sueldo) {
        this.ca_sueldo = ca_sueldo;
    }

    public String getNo_puesto() {
        return no_puesto;
    }

    public void setNo_puesto(String no_puesto) {
        this.no_puesto = no_puesto;
    }

    public String getNo_area() {
        return no_area;
    }

    public void setNo_area(String no_area) {
        this.no_area = no_area;
    }

    public String getNo_req() {
        return no_req;
    }

    public void setNo_req(String no_req) {
        this.no_req = no_req;
    }

    public String getEs_dgp() {
        return es_dgp;
    }

    public void setEs_dgp(String es_dgp) {
        this.es_dgp = es_dgp;
    }

}
