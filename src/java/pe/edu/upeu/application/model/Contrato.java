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
public class Contrato {

    private String id_contrato;
    private String id_dgp;
    private String fe_desde;
    private String fe_hasta;
    private String fe_cese;
    private String id_func;
    private String li_condicion;
    private Double ca_sueldo;
    private Double ca_reintegro;
    private Double ca_asig_familiar;
    private Double ho_semana;
    private Double nu_horas_lab;
    private Double dia_contrato;
    private String ti_trabajador;
    private String li_regimen_laboral;
    private String es_discapacidad;
    private String ti_contrato;
    private String li_regimen_pensionario;
    private String es_contrato_trabajador;
    private String us_creacion;
    private String fe_creacion;
    private String us_modif;
    private String fe_modif;
    private String us_ip;
    private String fe_vacacio_ini;
    private String fe_vacacio_fin;
    private String es_contrato;
    private String id_filial;
    private String id_direccion;
    private String id_departamento;
    private String id_area;
    private String id_seccion;
    private String id_puesto;
    private Double ca_bono_alimento;
    private String es_jefe;
    private String li_tipo_convenio;
    private String es_firmo_contrato;
    private Double nu_contrato;
    private String de_observacion;
    private String es_apoyo;
    private String ti_hora_pago;
    private String nu_documento;
    private String es_entregar_doc_reglamentos;
    private String es_registro_huella;
    private String de_registro_sistem_remu;
    private String id_trabajador;

    public Contrato(String id_contrato, String id_dgp, String fe_desde, String fe_hasta, String fe_cese, String id_func, String li_condicion, Double ca_sueldo, Double ca_reintegro, Double ca_asig_familiar, Double ho_semana, Double nu_horas_lab, Double dia_contrato, String ti_trabajador, String li_regimen_laboral, String es_discapacidad, String ti_contrato, String li_regimen_pensionario, String es_contrato_trabajador, String us_creacion, String fe_creacion, String us_modif, String fe_modif, String us_ip, String fe_vacacio_ini, String fe_vacacio_fin, String es_contrato, String id_filial, String id_direccion, String id_departamento, String id_area, String id_seccion, String id_puesto, Double ca_bono_alimento, String es_jefe, String li_tipo_convenio, String es_firmo_contrato, Double nu_contrato, String de_observacion, String es_apoyo, String ti_hora_pago, String nu_documento, String es_entregar_doc_reglamentos, String es_registro_huella, String de_registro_sistem_remu, String id_trabajador) {
        this.id_contrato = id_contrato;
        this.id_dgp = id_dgp;
        this.fe_desde = fe_desde;
        this.fe_hasta = fe_hasta;
        this.fe_cese = fe_cese;
        this.id_func = id_func;
        this.li_condicion = li_condicion;
        this.ca_sueldo = ca_sueldo;
        this.ca_reintegro = ca_reintegro;
        this.ca_asig_familiar = ca_asig_familiar;
        this.ho_semana = ho_semana;
        this.nu_horas_lab = nu_horas_lab;
        this.dia_contrato = dia_contrato;
        this.ti_trabajador = ti_trabajador;
        this.li_regimen_laboral = li_regimen_laboral;
        this.es_discapacidad = es_discapacidad;
        this.ti_contrato = ti_contrato;
        this.li_regimen_pensionario = li_regimen_pensionario;
        this.es_contrato_trabajador = es_contrato_trabajador;
        this.us_creacion = us_creacion;
        this.fe_creacion = fe_creacion;
        this.us_modif = us_modif;
        this.fe_modif = fe_modif;
        this.us_ip = us_ip;
        this.fe_vacacio_ini = fe_vacacio_ini;
        this.fe_vacacio_fin = fe_vacacio_fin;
        this.es_contrato = es_contrato;
        this.id_filial = id_filial;
        this.id_direccion = id_direccion;
        this.id_departamento = id_departamento;
        this.id_area = id_area;
        this.id_seccion = id_seccion;
        this.id_puesto = id_puesto;
        this.ca_bono_alimento = ca_bono_alimento;
        this.es_jefe = es_jefe;
        this.li_tipo_convenio = li_tipo_convenio;
        this.es_firmo_contrato = es_firmo_contrato;
        this.nu_contrato = nu_contrato;
        this.de_observacion = de_observacion;
        this.es_apoyo = es_apoyo;
        this.ti_hora_pago = ti_hora_pago;
        this.nu_documento = nu_documento;
        this.es_entregar_doc_reglamentos = es_entregar_doc_reglamentos;
        this.es_registro_huella = es_registro_huella;
        this.de_registro_sistem_remu = de_registro_sistem_remu;
        this.id_trabajador = id_trabajador;
    }

    public Contrato() {
        this.id_contrato = "";
        this.id_dgp = "";
        this.fe_desde = "";
        this.fe_hasta = "";
        this.fe_cese = "";
        this.id_func = "";
        this.li_condicion = "";
        this.ca_sueldo = 0.0;
        this.ca_reintegro = 0.0;
        this.ca_asig_familiar = 0.0;
        this.ho_semana = 0.0;
        this.nu_horas_lab = 0.0;
        this.dia_contrato = 0.0 ;
        this.ti_trabajador = "";
        this.li_regimen_laboral = "";
        this.es_discapacidad = "";
        this.ti_contrato = "";
        this.li_regimen_pensionario = "";
        this.es_contrato_trabajador = "";
        this.us_creacion = "";
        this.fe_creacion = "";
        this.us_modif = "";
        this.fe_modif = "";
        this.us_ip = "";
        this.fe_vacacio_ini = "";
        this.fe_vacacio_fin = "";
        this.es_contrato = "";
        this.id_filial ="";
        this.id_direccion = "";
        this.id_departamento = "";
        this.id_area = "";
        this.id_seccion = "";
        this.id_puesto = "";
        this.ca_bono_alimento = 0.0;
        this.es_jefe = "";
        this.li_tipo_convenio = "";
        this.es_firmo_contrato = "";
        this.nu_contrato = 0.0;
        this.de_observacion = "";
        this.es_apoyo = "";
        this.ti_hora_pago = "";
        this.nu_documento = "";
        this.es_entregar_doc_reglamentos = "";
        this.es_registro_huella = "";
        this.de_registro_sistem_remu = "";
        this.id_trabajador = "";
    }

    public String getId_contrato() {
        return id_contrato;
    }

    public void setId_contrato(String id_contrato) {
        this.id_contrato = id_contrato;
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

    public String getFe_cese() {
        return fe_cese;
    }

    public void setFe_cese(String fe_cese) {
        this.fe_cese = fe_cese;
    }

    public String getId_func() {
        return id_func;
    }

    public void setId_func(String id_func) {
        this.id_func = id_func;
    }

    public String getLi_condicion() {
        return li_condicion;
    }

    public void setLi_condicion(String li_condicion) {
        this.li_condicion = li_condicion;
    }

    public Double getCa_sueldo() {
        return ca_sueldo;
    }

    public void setCa_sueldo(Double ca_sueldo) {
        this.ca_sueldo = ca_sueldo;
    }

    public Double getCa_reintegro() {
        return ca_reintegro;
    }

    public void setCa_reintegro(Double ca_reintegro) {
        this.ca_reintegro = ca_reintegro;
    }

    public Double getCa_asig_familiar() {
        return ca_asig_familiar;
    }

    public void setCa_asig_familiar(Double ca_asig_familiar) {
        this.ca_asig_familiar = ca_asig_familiar;
    }

    public Double getHo_semana() {
        return ho_semana;
    }

    public void setHo_semana(Double ho_semana) {
        this.ho_semana = ho_semana;
    }

    public Double getNu_horas_lab() {
        return nu_horas_lab;
    }

    public void setNu_horas_lab(Double nu_horas_lab) {
        this.nu_horas_lab = nu_horas_lab;
    }

    public Double getDia_contrato() {
        return dia_contrato;
    }

    public void setDia_contrato(Double dia_contrato) {
        this.dia_contrato = dia_contrato;
    }

    public String getTi_trabajador() {
        return ti_trabajador;
    }

    public void setTi_trabajador(String ti_trabajador) {
        this.ti_trabajador = ti_trabajador;
    }

    public String getLi_regimen_laboral() {
        return li_regimen_laboral;
    }

    public void setLi_regimen_laboral(String li_regimen_laboral) {
        this.li_regimen_laboral = li_regimen_laboral;
    }

    public String getEs_discapacidad() {
        return es_discapacidad;
    }

    public void setEs_discapacidad(String es_discapacidad) {
        this.es_discapacidad = es_discapacidad;
    }

    public String getTi_contrato() {
        return ti_contrato;
    }

    public void setTi_contrato(String ti_contrato) {
        this.ti_contrato = ti_contrato;
    }

    public String getLi_regimen_pensionario() {
        return li_regimen_pensionario;
    }

    public void setLi_regimen_pensionario(String li_regimen_pensionario) {
        this.li_regimen_pensionario = li_regimen_pensionario;
    }

    public String getEs_contrato_trabajador() {
        return es_contrato_trabajador;
    }

    public void setEs_contrato_trabajador(String es_contrato_trabajador) {
        this.es_contrato_trabajador = es_contrato_trabajador;
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

    public String getUs_ip() {
        return us_ip;
    }

    public void setUs_ip(String us_ip) {
        this.us_ip = us_ip;
    }

    public String getFe_vacacio_ini() {
        return fe_vacacio_ini;
    }

    public void setFe_vacacio_ini(String fe_vacacio_ini) {
        this.fe_vacacio_ini = fe_vacacio_ini;
    }

    public String getFe_vacacio_fin() {
        return fe_vacacio_fin;
    }

    public void setFe_vacacio_fin(String fe_vacacio_fin) {
        this.fe_vacacio_fin = fe_vacacio_fin;
    }

    public String getEs_contrato() {
        return es_contrato;
    }

    public void setEs_contrato(String es_contrato) {
        this.es_contrato = es_contrato;
    }

    public String getId_filial() {
        return id_filial;
    }

    public void setId_filial(String id_filial) {
        this.id_filial = id_filial;
    }

    public String getId_direccion() {
        return id_direccion;
    }

    public void setId_direccion(String id_direccion) {
        this.id_direccion = id_direccion;
    }

    public String getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(String id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getId_area() {
        return id_area;
    }

    public void setId_area(String id_area) {
        this.id_area = id_area;
    }

    public String getId_seccion() {
        return id_seccion;
    }

    public void setId_seccion(String id_seccion) {
        this.id_seccion = id_seccion;
    }

    public String getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(String id_puesto) {
        this.id_puesto = id_puesto;
    }

    public Double getCa_bono_alimento() {
        return ca_bono_alimento;
    }

    public void setCa_bono_alimento(Double ca_bono_alimento) {
        this.ca_bono_alimento = ca_bono_alimento;
    }

    public String getEs_jefe() {
        return es_jefe;
    }

    public void setEs_jefe(String es_jefe) {
        this.es_jefe = es_jefe;
    }

    public String getLi_tipo_convenio() {
        return li_tipo_convenio;
    }

    public void setLi_tipo_convenio(String li_tipo_convenio) {
        this.li_tipo_convenio = li_tipo_convenio;
    }

    public String getEs_firmo_contrato() {
        return es_firmo_contrato;
    }

    public void setEs_firmo_contrato(String es_firmo_contrato) {
        this.es_firmo_contrato = es_firmo_contrato;
    }

    public Double getNu_contrato() {
        return nu_contrato;
    }

    public void setNu_contrato(Double nu_contrato) {
        this.nu_contrato = nu_contrato;
    }

    public String getDe_observacion() {
        return de_observacion;
    }

    public void setDe_observacion(String de_observacion) {
        this.de_observacion = de_observacion;
    }

    public String getEs_apoyo() {
        return es_apoyo;
    }

    public void setEs_apoyo(String es_apoyo) {
        this.es_apoyo = es_apoyo;
    }

    public String getTi_hora_pago() {
        return ti_hora_pago;
    }

    public void setTi_hora_pago(String ti_hora_pago) {
        this.ti_hora_pago = ti_hora_pago;
    }

    public String getNu_documento() {
        return nu_documento;
    }

    public void setNu_documento(String nu_documento) {
        this.nu_documento = nu_documento;
    }



    public String getEs_entregar_doc_reglamentos() {
        return es_entregar_doc_reglamentos;
    }

    public void setEs_entregar_doc_reglamentos(String es_entregar_doc_reglamentos) {
        this.es_entregar_doc_reglamentos = es_entregar_doc_reglamentos;
    }

    public String getEs_registro_huella() {
        return es_registro_huella;
    }

    public void setEs_registro_huella(String es_registro_huella) {
        this.es_registro_huella = es_registro_huella;
    }

    public String getDe_registro_sistem_remu() {
        return de_registro_sistem_remu;
    }

    public void setDe_registro_sistem_remu(String de_registro_sistem_remu) {
        this.de_registro_sistem_remu = de_registro_sistem_remu;
    }

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajador) {
        this.id_trabajador = id_trabajador;
    }
    
    
    
}
