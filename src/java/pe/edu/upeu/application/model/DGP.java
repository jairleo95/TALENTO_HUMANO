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
public class DGP {

    private String id_dgp;
    private String fe_desde;
    private String fe_hasta;
    private Double ca_sueldo;
    private String de_dias_trabajo;
    private String id_puesto;
    private String id_requerimiento;
    private String id_trabajador;
    private String co_ruc;
    private String de_lugar_servicio;
    private String de_servicio;
    private String de_periodo_pago;
    private String de_domicilio_fiscal;
    private String de_subvencion;
    private String de_horario_capacitacion;
    private String de_horario_refrigerio;
    private String de_dias_capacitacion;
    private String es_dgp;
    private String us_creacion;
    private String fe_creacion;
    private String us_modif;
    private String fe_modif;
    private String ip_usuario;
    private Double ca_bono_alimentario;
    private Double de_bev;
    private Double ca_centro_costos;
    private String de_antecedentes_policiales;
    private String de_certificado_salud;
    private String de_monto_honorario;
    private String no_banco;
    private String nu_cuenta;
    private String nu_cuenta_banc;
    private String es_gen_nu_cuenta;
    private String no_banco_otros;

   

    public DGP(String id_dgp, String fe_desde, String fe_hasta, Double ca_sueldo, String de_dias_trabajo, String id_puesto, String id_requerimiento, String id_trabajador, String co_ruc, String de_lugar_servicio, String de_servicio, String de_periodo_pago, String de_domicilio_fiscal, String de_subvencion, String de_horario_capacitacion, String de_horario_refrigerio, String de_dias_capacitacion, String es_dgp, String us_creacion, String fe_creacion, String us_modif, String fe_modif, String ip_usuario, Double ca_bono_alimentario, Double de_bev, Double ca_centro_costos, String de_antecedentes_policiales, String de_certificado_salud, String de_monto_honorario, String no_banco, String nu_cuenta, String nu_cuenta_banc, String es_gen_nu_cuenta, String no_banco_otros) {
        this.id_dgp = id_dgp;
        this.fe_desde = fe_desde;
        this.fe_hasta = fe_hasta;
        this.ca_sueldo = ca_sueldo;
        this.de_dias_trabajo = de_dias_trabajo;
        this.id_puesto = id_puesto;
        this.id_requerimiento = id_requerimiento;
        this.id_trabajador = id_trabajador;
        this.co_ruc = co_ruc;
        this.de_lugar_servicio = de_lugar_servicio;
        this.de_servicio = de_servicio;
        this.de_periodo_pago = de_periodo_pago;
        this.de_domicilio_fiscal = de_domicilio_fiscal;
        this.de_subvencion = de_subvencion;
        this.de_horario_capacitacion = de_horario_capacitacion;
        this.de_horario_refrigerio = de_horario_refrigerio;
        this.de_dias_capacitacion = de_dias_capacitacion;
        this.es_dgp = es_dgp;
        this.us_creacion = us_creacion;
        this.fe_creacion = fe_creacion;
        this.us_modif = us_modif;
        this.fe_modif = fe_modif;
        this.ip_usuario = ip_usuario;
        this.ca_bono_alimentario = ca_bono_alimentario;
        this.de_bev = de_bev;
        this.ca_centro_costos = ca_centro_costos;
        this.de_antecedentes_policiales = de_antecedentes_policiales;
        this.de_certificado_salud = de_certificado_salud;
        this.de_monto_honorario = de_monto_honorario;
        this.no_banco = no_banco;
        this.nu_cuenta = nu_cuenta;
        this.nu_cuenta_banc = nu_cuenta_banc;
        this.es_gen_nu_cuenta = es_gen_nu_cuenta;
        this.no_banco_otros = no_banco_otros;
    }

    public DGP() {
        this.id_dgp = id_dgp;
        this.fe_desde = "";
        this.fe_hasta = "";
        this.ca_sueldo = 0.0;
        this.de_dias_trabajo = "";
        this.id_puesto = "";
        this.id_requerimiento = "";
        this.id_trabajador = "";
        this.co_ruc = "";
        this.de_lugar_servicio = "";
        this.de_servicio = "";
        this.de_periodo_pago = "";
        this.de_domicilio_fiscal = "";
        this.de_subvencion = "";
        this.de_horario_capacitacion = "";
        this.de_horario_refrigerio = "";
        this.de_dias_capacitacion = "";
        this.es_dgp = "";
        this.us_creacion = "";
        this.fe_creacion = "";
        this.us_modif = "";
        this.fe_modif = "";
        this.ip_usuario = "";
        this.ca_bono_alimentario = 0.0;
        this.de_bev = 0.0;
        this.ca_centro_costos = 0.0;
        this.de_antecedentes_policiales = "";
        this.de_certificado_salud = "";
        this.de_monto_honorario = "";
        this.no_banco = "";
        this.nu_cuenta = "";
        this.nu_cuenta_banc = "";
        this.es_gen_nu_cuenta = "";
        this.no_banco_otros = "";
    }

    public String getId_dgp() {
        return id_dgp;
    }

    public void setId_dgp(String id_dgp) {
        this.id_dgp = id_dgp;
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

    public String getDe_dias_trabajo() {
        return de_dias_trabajo;
    }

    public void setDe_dias_trabajo(String de_dias_trabajo) {
        this.de_dias_trabajo = de_dias_trabajo;
    }

    public String getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(String id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getId_requerimiento() {
        return id_requerimiento;
    }

    public void setId_requerimiento(String id_requerimiento) {
        this.id_requerimiento = id_requerimiento;
    }

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajador) {
        this.id_trabajador = id_trabajador;
    }

    public String getCo_ruc() {
        return co_ruc;
    }

    public void setCo_ruc(String co_ruc) {
        this.co_ruc = co_ruc;
    }

    public String getDe_lugar_servicio() {
        return de_lugar_servicio;
    }

    public void setDe_lugar_servicio(String de_lugar_servicio) {
        this.de_lugar_servicio = de_lugar_servicio;
    }

    public String getDe_servicio() {
        return de_servicio;
    }

    public void setDe_servicio(String de_servicio) {
        this.de_servicio = de_servicio;
    }

    public String getDe_periodo_pago() {
        return de_periodo_pago;
    }

    public void setDe_periodo_pago(String de_periodo_pago) {
        this.de_periodo_pago = de_periodo_pago;
    }

    public String getDe_domicilio_fiscal() {
        return de_domicilio_fiscal;
    }

    public void setDe_domicilio_fiscal(String de_domicilio_fiscal) {
        this.de_domicilio_fiscal = de_domicilio_fiscal;
    }

    public String getDe_subvencion() {
        return de_subvencion;
    }

    public void setDe_subvencion(String de_subvencion) {
        this.de_subvencion = de_subvencion;
    }

    public String getDe_horario_capacitacion() {
        return de_horario_capacitacion;
    }

    public void setDe_horario_capacitacion(String de_horario_capacitacion) {
        this.de_horario_capacitacion = de_horario_capacitacion;
    }

    public String getDe_horario_refrigerio() {
        return de_horario_refrigerio;
    }

    public void setDe_horario_refrigerio(String de_horario_refrigerio) {
        this.de_horario_refrigerio = de_horario_refrigerio;
    }

    public String getDe_dias_capacitacion() {
        return de_dias_capacitacion;
    }

    public void setDe_dias_capacitacion(String de_dias_capacitacion) {
        this.de_dias_capacitacion = de_dias_capacitacion;
    }

    public String getEs_dgp() {
        return es_dgp;
    }

    public void setEs_dgp(String es_dgp) {
        this.es_dgp = es_dgp;
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

    public Double getCa_bono_alimentario() {
        return ca_bono_alimentario;
    }

    public void setCa_bono_alimentario(Double ca_bono_alimentario) {
        this.ca_bono_alimentario = ca_bono_alimentario;
    }

    public Double getDe_bev() {
        return de_bev;
    }

    public void setDe_bev(Double de_bev) {
        this.de_bev = de_bev;
    }

    public Double getCa_centro_costos() {
        return ca_centro_costos;
    }

    public void setCa_centro_costos(Double ca_centro_costos) {
        this.ca_centro_costos = ca_centro_costos;
    }

    public String getDe_antecedentes_policiales() {
        return de_antecedentes_policiales;
    }

    public void setDe_antecedentes_policiales(String de_antecedentes_policiales) {
        this.de_antecedentes_policiales = de_antecedentes_policiales;
    }

    public String getDe_certificado_salud() {
        return de_certificado_salud;
    }

    public void setDe_certificado_salud(String de_certificado_salud) {
        this.de_certificado_salud = de_certificado_salud;
    }

    public String getDe_monto_honorario() {
        return de_monto_honorario;
    }

    public void setDe_monto_honorario(String de_monto_honorario) {
        this.de_monto_honorario = de_monto_honorario;
    }

    public String getNo_banco() {
        return no_banco;
    }

    public void setNo_banco(String no_banco) {
        this.no_banco = no_banco;
    }

    public String getNu_cuenta() {
        return nu_cuenta;
    }

    public void setNu_cuenta(String nu_cuenta) {
        this.nu_cuenta = nu_cuenta;
    }

    public String getNu_cuenta_banc() {
        return nu_cuenta_banc;
    }

    public void setNu_cuenta_banc(String nu_cuenta_banc) {
        this.nu_cuenta_banc = nu_cuenta_banc;
    }

    public String getEs_gen_nu_cuenta() {
        return es_gen_nu_cuenta;
    }

    public void setEs_gen_nu_cuenta(String es_gen_nu_cuenta) {
        this.es_gen_nu_cuenta = es_gen_nu_cuenta;
    }
     public String getNo_banco_otros() {
        return no_banco_otros;
    }

    public void setNo_banco_otros(String no_banco_otros) {
        this.no_banco_otros = no_banco_otros;
    }
    

}
