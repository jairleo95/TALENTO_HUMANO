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
public class V_Det_DGP {

    private String id_dgp;
    private String fe_desde;
    private String fe_hasta;
    private Double ca_sueldo;
    private String de_dias_trabajo;
    private String no_puesto;
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
    private String no_usuario_crea;
    private String no_usuario_mod;
    private String li_motivo;
    private String es_mfl;
    private String es_presupuestado;

    private String ip_usuario;
    private String no_req;
    private Double ca_bono_alimentario;
    private Double de_bev;
    private Double ca_bonificacion_p;
    private String de_antecedentes_policiales;
    private String es_certificado_salud;

    private String id_departamento;
    private String id_direccion;
    private String id_seccion;
    private String id_area;
    private String id_tipo_planilla;
    private String ti_planilla;
    private String id_detalle_horario;
    private String no_dep;
    private String no_area;
    private String no_seccion;
    private String no_trab_us_cr;
    private String no_trab_us_mod;
    private String nombre_trabajador;
    private double ca_horas_horario;

    public double getCa_horas_horario() {
        return ca_horas_horario;
    }

    public void setCa_horas_horario(double ca_horas_horario) {
        this.ca_horas_horario = ca_horas_horario;
    }

    public String getNombre_trabajador() {
        return nombre_trabajador;
    }

    public void setNombre_trabajador(String nombre_trabajador) {
        this.nombre_trabajador = nombre_trabajador;
    }

    public String getNo_area() {
        return no_area;
    }

    public void setNo_area(String no_area) {
        this.no_area = no_area;
    }

    public String getNo_seccion() {
        return no_seccion;
    }

    public void setNo_seccion(String no_seccion) {
        this.no_seccion = no_seccion;
    }

    public String getNo_trab_us_cr() {
        return no_trab_us_cr;
    }

    public void setNo_trab_us_cr(String no_trab_us_cr) {
        this.no_trab_us_cr = no_trab_us_cr;
    }

    public String getNo_trab_us_mod() {
        return no_trab_us_mod;
    }

    public void setNo_trab_us_mod(String no_trab_us_mod) {
        this.no_trab_us_mod = no_trab_us_mod;
    }

    public double getCa_asig_familiar() {
        return ca_asig_familiar;
    }

    public void setCa_asig_familiar(double ca_asig_familiar) {
        this.ca_asig_familiar = ca_asig_familiar;
    }
    private double ca_asig_familiar;

    public V_Det_DGP(String id_dgp, String fe_desde, String fe_hasta, Double ca_sueldo, String de_dias_trabajo, String no_puesto, String id_puesto, String id_requerimiento,
            String id_trabajador, String co_ruc, String de_lugar_servicio, String de_servicio, String de_periodo_pago, String de_domicilio_fiscal, String de_subvencion,
            String de_horario_capacitacion, String de_horario_refrigerio, String de_dias_capacitacion, String es_dgp, String us_creacion, String fe_creacion, String us_modif,
            String fe_modif, String ip_usuario, String no_req, Double ca_bono_alimentario, Double de_bev, String de_antecedentes_policiales, String es_certificado_salud,
            String no_banco, String nu_cuenta, String nu_cuenta_banc, String es_gen_nu_cuenta, String no_banco_otros, String id_departamento, String id_direccion,
            String id_seccion, String id_area, String id_tipo_planilla, String ti_planilla, String id_detalle_horario, String no_dep,
            String no_usuario_crea, String no_usuario_mod, String li_motivo, String es_mfl, Double ca_bonificacion_p,
            String no_area, String no_seccion, String no_trab_us_cr, String no_trab_us_mod, double ca_asig_familiar, String nombre_trabajador, double ca_horas_horario, String es_presupuestado) {
        this.id_dgp = id_dgp;
        this.fe_desde = fe_desde;
        this.fe_hasta = fe_hasta;
        this.ca_sueldo = ca_sueldo;
        this.de_dias_trabajo = de_dias_trabajo;
        this.no_puesto = no_puesto;
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
        this.no_req = no_req;
        this.ca_bono_alimentario = ca_bono_alimentario;
        this.de_bev = de_bev;
        this.de_antecedentes_policiales = de_antecedentes_policiales;
        this.es_certificado_salud = es_certificado_salud;
        this.id_departamento = id_departamento;
        this.id_direccion = id_direccion;
        this.id_seccion = id_seccion;
        this.id_area = id_area;
        this.id_tipo_planilla = id_tipo_planilla;
        this.ti_planilla = ti_planilla;
        this.id_detalle_horario = id_detalle_horario;
        this.no_dep = no_dep;
        this.no_usuario_crea = no_usuario_crea;
        this.no_usuario_mod = no_usuario_mod;
        this.li_motivo = li_motivo;
        this.es_mfl = es_mfl;
        this.ca_bonificacion_p = ca_bonificacion_p;
        this.no_area = no_area;
        this.no_seccion = no_seccion;
        this.no_trab_us_cr = no_trab_us_cr;
        this.no_trab_us_mod = no_trab_us_mod;
        this.ca_asig_familiar = ca_asig_familiar;
        this.nombre_trabajador = nombre_trabajador;
        this.ca_horas_horario = ca_horas_horario;
        this.es_presupuestado = es_presupuestado;
    }

    public V_Det_DGP() {
        this.id_dgp = "";
        this.fe_desde = "";
        this.fe_hasta = "";
        this.ca_sueldo = 0.0;
        this.de_dias_trabajo = "";
        this.no_puesto = "";
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
        this.no_req = "";
        this.ca_bono_alimentario = 0.0;
        this.de_bev = 0.0;
        this.de_antecedentes_policiales = "";
        this.es_certificado_salud = "";
        this.id_departamento = "";
        this.id_direccion = "";
        this.id_seccion = "";
        this.id_area = "";
        this.id_tipo_planilla = "";
        this.ti_planilla = "";
        this.id_detalle_horario = "";
        this.no_dep = "";
        this.no_usuario_crea = "";
        this.no_usuario_mod = "";
        this.li_motivo = "";
        this.es_mfl = "";
        this.ca_bonificacion_p = 0.0;
        this.no_area = "";
        this.no_seccion = "";
        this.no_trab_us_cr = "";
        this.no_trab_us_mod = "";
        this.ca_asig_familiar = 0.0;
        this.nombre_trabajador = "";
        this.ca_horas_horario = 0.0;
        this.es_presupuestado = "";
    }

    public Double getCa_bonificacion_p() {
        return ca_bonificacion_p;
    }

    public void setCa_bonificacion_p(Double ca_bonificacion_p) {
        this.ca_bonificacion_p = ca_bonificacion_p;
    }

    public String getNo_usuario_crea() {
        return no_usuario_crea;
    }

    public void setNo_usuario_crea(String no_usuario_crea) {
        this.no_usuario_crea = no_usuario_crea;
    }

    public String getNo_usuario_mod() {
        return no_usuario_mod;
    }

    public void setNo_usuario_mod(String no_usuario_mod) {
        this.no_usuario_mod = no_usuario_mod;
    }

    public String getNo_dep() {
        return no_dep;
    }

    public void setNo_dep(String no_dep) {
        this.no_dep = no_dep;
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

    public String getNo_puesto() {
        return no_puesto;
    }

    public void setNo_puesto(String no_puesto) {
        this.no_puesto = no_puesto;
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

    public String getNo_req() {
        return no_req;
    }

    public void setNo_req(String no_req) {
        this.no_req = no_req;
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

    public String getDe_antecedentes_policiales() {
        return de_antecedentes_policiales;
    }

    public void setDe_antecedentes_policiales(String de_antecedentes_policiales) {
        this.de_antecedentes_policiales = de_antecedentes_policiales;
    }

    public String getEs_certificado_salud() {
        return es_certificado_salud;
    }

    public void setEs_certificado_salud(String es_certificado_salud) {
        this.es_certificado_salud = es_certificado_salud;
    }

    public String getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(String id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getId_direccion() {
        return id_direccion;
    }

    public void setId_direccion(String id_direccion) {
        this.id_direccion = id_direccion;
    }

    public String getId_seccion() {
        return id_seccion;
    }

    public void setId_seccion(String id_seccion) {
        this.id_seccion = id_seccion;
    }

    public String getId_area() {
        return id_area;
    }

    public void setId_area(String id_area) {
        this.id_area = id_area;
    }

    public String getId_tipo_planilla() {
        return id_tipo_planilla;
    }

    public void setId_tipo_planilla(String id_tipo_planilla) {
        this.id_tipo_planilla = id_tipo_planilla;
    }

    public String getTi_planilla() {
        return ti_planilla;
    }

    public void setTi_planilla(String ti_planilla) {
        this.ti_planilla = ti_planilla;
    }

    public String getLi_motivo() {
        return li_motivo;
    }

    public void setLi_motivo(String li_motivo) {
        this.li_motivo = li_motivo;
    }

    public String getEs_mfl() {
        return es_mfl;
    }

    public void setEs_mfl(String es_mfl) {
        this.es_mfl = es_mfl;
    }

    public String getEs_presupuestado() {
        return es_presupuestado;
    }

    public void setEs_presupuestado(String es_presupuestado) {
        this.es_presupuestado = es_presupuestado;
    }
}
