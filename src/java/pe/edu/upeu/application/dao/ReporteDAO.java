/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.dao_imp.InterfaceReporteDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Datos_Generales;
import pe.edu.upeu.application.web.controller.CConversion;

/**
 *
 * @author ALFA 3
 */
public class ReporteDAO implements InterfaceReporteDAO {

    ConexionBD conn;
    CConversion c = new CConversion();

    @Override
    public List<Map<String, ?>> Contrato_Mes() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Datos_Generales> Reporte_Datos_Generales() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        //String sql = "select c.id_contrato, c.id_dgp, c.fe_desde, c.fe_hasta, c.fe_cese, c.id_func, pd.no_area,c.li_condicion , c.ca_sueldo,c.ca_reintegro,c.ca_asig_familiar, c.ho_semana,c.nu_horas_lab,c.dia_contrato,c.ti_trabajador,c.li_regimen_laboral,c.es_discapacidad,c.ti_contrato,c.li_regimen_pensionario, c.es_contrato_trabajador,c.us_creacion,c.fe_creacion,c.us_modif,c.fe_modif,c.us_ip,c.fe_vacacio_ini,c.fe_vacacio_fin,c.es_contrato,c.id_filial,pd.id_direccion,pd.id_departamento,pd.id_area,pd.id_seccion,pd.id_puesto,c.ca_bono_alimento,c.es_jefe,c.li_tipo_convenio,c.es_firmo_contrato,c.nu_contrato,c.de_observacion,c.es_apoyo,c.ti_hora_pago,c.nu_documento,c.id_anno,c.es_entregar_doc_reglamentos,c.es_registro_huella,c.de_registro_sistem_remu,c.id_trabajador, pd.no_puesto,pd.no_seccion, pd.no_dep,pd.no_direccion from rhtm_contrato c, RHVD_puesto_direccion pd   where c.id_puesto = pd.id_puesto and c.es_contrato='1' and c.id_trabajador='" + id_trabajador + "' and c.ID_ANNO='" + id_anno + "'";
        String sql = "SELECT CO_APS,ID_DIRECCION,NO_DIRECCION,(to_char(FE_CREACION_CONTRATO,'dd/mm/yyyy'))as FE_CREACION_CONTRATO,NO_DEP,NO_AREA,NO_SECCION,NO_PUESTO,AP_PATERNO,AP_MATERNO,NO_TRABAJADOR,(AP_PATERNO||' '||AP_MATERNO||' '||NO_TRABAJADOR)AS NO_COMPLETO,ES_SEXO,"
                + "FE_NAC,(trim(NO_NACIONALIDAD))as NO_NACIONALIDAD,ES_CIVIL,LI_GRUPO_SANGUINEO,ES_FACTOR_RH,CO_SISTEMA_PENSIONARIO,ID_NO_AFP,NO_S_EDUCATIVA,ES_INST_EDUC_PERU,"
                + "LI_REG_INST_EDUCATIVA,(trim(NO_TIPO_INSTITUCION))as NO_TIPO_INSTITUCION,(trim(NO_UNIVERSIDAD))as NO_UNIVERSIDAD,(trim(NO_CARRERA))as NO_CARRERA,DE_ANNO_EGRESO,CA_TIPO_HORA_PAGO_REFEERENCIAL,LI_DI_DOM_A_D1,"
                + "(trim(DI_DOM_A_D2))AS DI_DOM_A_D2,LI_DI_DOM_A_D3,(trim(DI_DOM_A_D4))AS DI_DOM_A_D4,LI_DI_DOM_A_D5,(trim(DI_DOM_A_D6))as DI_DOM_A_D6,NO_DISTRITO,NO_PROVINCIA,NO_DEPARTAMENTO,LI_RELIGION,NO_IGLESIA,DE_CARGO,"
                + "LI_AUTORIDAD,ID_TRABAJADOR FROM RHVD_REPORTE_EMP";
        List<Datos_Generales> list = new ArrayList<Datos_Generales>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Datos_Generales v = new Datos_Generales();
                v.setCo_aps(rs.getDouble("CO_APS"));
                v.setNo_dep(rs.getString("NO_DEP"));
                v.setNo_area(rs.getString("NO_AREA"));
                v.setNo_seccion(rs.getString("NO_SECCION"));
                v.setNo_puesto(rs.getString("NO_PUESTO"));
                v.setAp_paterno(rs.getString("AP_PATERNO"));
                v.setAp_materno(rs.getString("AP_MATERNO"));
                v.setNo_trabajador(rs.getString("NO_TRABAJADOR"));
                v.setNo_completo(rs.getString("NO_COMPLETO"));
                v.setEs_sexo(rs.getString("ES_SEXO"));
                v.setFe_nac(rs.getString("FE_NAC"));
                v.setNo_nacionalidad(rs.getString("NO_NACIONALIDAD"));
                v.setEs_civil(rs.getString("ES_CIVIL"));
                v.setLi_grupo_sanguineo(rs.getString("LI_GRUPO_SANGUINEO"));
                v.setEs_factor_rh(rs.getString("ES_FACTOR_RH"));
                v.setCo_sistema_pensionario(rs.getString("CO_SISTEMA_PENSIONARIO"));
                v.setId_no_afp(rs.getString("ID_NO_AFP"));
                v.setNo_s_educativa(rs.getString("NO_S_EDUCATIVA"));
                v.setEs_inst_educ_peru(rs.getString("ES_INST_EDUC_PERU"));
                v.setLi_reg_inst_educativa(rs.getString("LI_REG_INST_EDUCATIVA"));
                v.setNo_tipo_institucion(rs.getString("NO_TIPO_INSTITUCION"));
                v.setNo_universidad(rs.getString("NO_UNIVERSIDAD"));
                v.setNo_carrera(rs.getString("NO_CARRERA"));
                v.setDe_anno_egreso(rs.getString("DE_ANNO_EGRESO"));
                v.setCa_tipo_hora_pago_refeerencial(rs.getString("CA_TIPO_HORA_PAGO_REFEERENCIAL"));
                v.setLi_di_dom_a_d1(rs.getString("LI_DI_DOM_A_D1"));
                v.setDi_dom_a_d2(rs.getString("DI_DOM_A_D2"));
                v.setLi_di_dom_a_d3(rs.getString("LI_DI_DOM_A_D3"));
                v.setDi_dom_a_d4(rs.getString("DI_DOM_A_D4"));
                v.setLi_di_dom_a_d5(rs.getString("LI_DI_DOM_A_D5"));
                v.setDi_dom_a_d6(rs.getString("DI_DOM_A_D6"));
                v.setNo_distrito(rs.getString("NO_DISTRITO"));
                v.setNo_provincia(rs.getString("NO_PROVINCIA"));
                v.setNo_departamento(rs.getString("NO_DEPARTAMENTO"));
                v.setLi_religion(rs.getString("LI_RELIGION"));
                v.setNo_iglesia(rs.getString("NO_IGLESIA"));
                v.setDe_cargo(rs.getString("DE_CARGO"));
                v.setLi_autoridad(rs.getString("LI_AUTORIDAD"));
                v.setId_trabajador(rs.getString("ID_TRABAJADOR"));
                v.setNo_direccion(rs.getString("NO_DIRECCION"));
                v.setFe_creacion_contrato(rs.getString("FE_CREACION_CONTRATO"));
                list.add(v);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Map<String, ?>> listar_padre_hi(String desde, String hasta, String edad, String aps, String dep, String are, String sec, String pue, String nom, String pat, String mat, String num, String tip) {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT * from RHVD_FILTRO__PADRE_HIJO ";
            sql += (!desde.equals("") & !(hasta.equals(""))) ? "where EDAD_HI BETWEEN '" + desde.trim() + "' and '" + hasta.trim() + "'" : "";
            sql += (!edad.equals("")) ? "where EDAD_HI='" + edad.trim() + "'" : "";
            sql += (!aps.equals("")) ? "where APS='" + aps.trim() + "'" : "";
            sql += (!dep.equals("")) ? "where UPPER(DEPARTAMENTO)='" + dep.trim().toUpperCase() + "'" : "";
            sql += (!are.equals("")) ? "where UPPER(AREA)='" + are.trim().toUpperCase() + "'" : "";
            sql += (!sec.equals("")) ? "where UPPER(SECCION)='" + sec.trim().toUpperCase() + "'" : "";
            sql += (!pue.equals("")) ? "where UPPER(PUESTO)='" + pue.trim().toUpperCase() + "'" : "";
            sql += (!pat.equals("")) ? "where UPPER(PATERNO)='" + pat.trim().toUpperCase() + "'" : "";
            sql += (!mat.equals("")) ? "where UPPER(MATERNO)='" + mat.trim().toUpperCase() + "'" : "";
            sql += (!nom.equals("")) ? "where UPPER(NOM)='" + nom.trim().toUpperCase() + "'" : "";
            sql += (!mat.equals("")) ? "where UPPER(MATERNO)='" + mat.trim().toUpperCase() + "'" : "";
            sql += (!tip.equals("")) ? "where TI_DOC='" + tip.trim() + "'" : "";
            sql += (!num.equals("")) ? "where NU_DOC='" + num.trim() + "'" : "";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("aps", rs.getString("APS"));
                rec.put("dep", rs.getString("DEPARTAMENTO"));
                rec.put("are", rs.getString("AREA"));
                rec.put("sec", rs.getString("SECCION"));
                rec.put("pue", rs.getString("PUESTO"));
                rec.put("tip_d", rs.getString("TI_DOC"));
                rec.put("num_d", rs.getString("NU_DOC"));
                rec.put("pat", rs.getString("PATERNO"));
                rec.put("mat", rs.getString("MATERNO"));
                rec.put("nom", rs.getString("NOM"));
                rec.put("nom_e", rs.getString("NOMBRE_EMPLEADO"));
                rec.put("fec_s", rs.getString("FEC_CESE"));
                rec.put("dni_h", rs.getString("DNI_HI"));
                rec.put("nom_h", rs.getString("NOM_HI"));
                rec.put("fech_hi", rs.getString("FE_NAC_HI"));
                rec.put("edad_hi", rs.getString("EDAD_HI"));
                rec.put("fen_hi", rs.getString("GEN_HI"));
                rec.put("id_tra", rs.getString("ID_TRABAJADOR"));
                Lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return Lista;
    }

    @Override
    public List<Map<String, ?>> lirtar_trabajor_Navidad(String mes) {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT * from RHVD_FILTRO_NAVIDAD ";
            sql += (!mes.equals("")) ? "where TIEMPO_TRABAJO='" + mes.trim() + "'" : "";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("aps", rs.getString("CO_APS"));
                rec.put("dep", rs.getString("NO_DEP"));
                rec.put("are", rs.getString("NO_AREA"));
                rec.put("ti_doc", rs.getString("TI_DOC"));
                rec.put("nu_doc", rs.getString("NU_DOC"));
                rec.put("sec", rs.getString("NO_SECCION"));
                rec.put("pue", rs.getString("NO_PUESTO"));
                rec.put("pat", rs.getString("AP_PATERNO"));
                rec.put("mat", rs.getString("AP_MATERNO"));
                rec.put("nom_t", rs.getString("NO_TRABAJADOR"));
                rec.put("nom", rs.getString("NOMBRES"));
                rec.put("sex", rs.getString("ES_SEXO"));
                rec.put("fe_nac", rs.getString("FE_NAC"));
                rec.put("des", rs.getString("FE_DESDE"));
                rec.put("has", rs.getString("FE_HASTA"));
                rec.put("t_tra", rs.getString("TIEMPO_TRABAJO"));
                rec.put("ID_TRABAJADOR", rs.getString("ID_TRABAJADOR"));
                Lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return Lista;
    }

    @Override
    public List<Map<String, ?>> Reporte_Datos_Gen(String aps, String dep, String are, String sec, String puesto, String edad, String ape, String mat, String nom, String num) {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT * FROM RHVD_FILTRO_DATOS_GENERALES ";
            sql += (!aps.equals("")) ? "Where CO_APS='" + aps.trim() + "'" : "";
            sql += (!dep.equals("")) ? "Where UPPER(NO_DEP)='" + dep.trim().toUpperCase() + "'" : "";
            sql += (!are.equals("")) ? "Where UPPER(NO_AREA)='" + are.trim().toUpperCase() + "'" : "";
            sql += (!sec.equals("")) ? "Where UPPER(NO_SECCION)='" + sec.trim().toUpperCase() + "'" : "";
            sql += (!puesto.equals("")) ? "Where UPPER(NO_PUESTO)='" + puesto.trim().toUpperCase() + "'" : "";
            //sql += (!fec.equals("")) ? "Where FE_NAC='" + fec.trim() + "'" : "";
            sql += (!ape.equals("")) ? "Where UPPER(AP_PATERNO)='" + ape.trim().toUpperCase() + "'" : "";
            sql += (!mat.equals("")) ? "Where UPPER(AP_MATERNO)='" + mat.trim().toUpperCase() + "'" : "";
            sql += (!nom.equals("")) ? "Where UPPER(NO_TRABAJADOR)='" + nom.trim() + "'" : "";
            sql += (!num.equals("")) ? "Where NU_DOC='" + num.trim() + "'" : "";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("aps", rs.getString("CO_APS"));
                rec.put("dep", rs.getString("NO_DEP"));
                rec.put("are", rs.getString("NO_AREA"));
                rec.put("sec", rs.getString("NO_SECCION"));
                rec.put("pue", rs.getString("NO_PUESTO"));
                rec.put("doc", rs.getString("TI_DOC"));
                rec.put("n_doc", rs.getString("NU_DOC"));
                rec.put("ape", rs.getString("AP_PATERNO"));
                rec.put("mat", rs.getString("AP_MATERNO"));
                rec.put("nom", rs.getString("NO_TRABAJADOR"));
                rec.put("has", rs.getString("FE_HASTA"));
                rec.put("nom_hi", rs.getString("NOMBRE"));
                rec.put("dni_hi", rs.getString("DNI"));
                rec.put("gen_hi", rs.getString("GENERO"));
                rec.put("nac_hi", rs.getString("FECHA_NAC"));
                rec.put("eda_hi", rs.getString("EDAD"));
                Lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return Lista;
    }

    @Override
    public List<Map<String, ?>> reporte_hijos(String sql) {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("AP_PATERNO", rs.getString("AP_PATERNO"));
                rec.put("AP_MATERNO", rs.getString("AP_MATERNO"));
                rec.put("NO_TRABAJADOR", rs.getString("NO_TRABAJADOR"));
                rec.put("TI_DOC", rs.getString("TI_DOC"));
                rec.put("NU_DOC", rs.getString("NU_DOC"));
                rec.put("ID_TRABAJADOR", rs.getString("ID_TRABAJADOR"));
                rec.put("NO_DEP", rs.getString("NO_DEP"));
                rec.put("ID_AREA", rs.getString("ID_AREA"));
                rec.put("NO_AREA", rs.getString("NO_AREA"));
                rec.put("ID_SECCION", rs.getString("ID_SECCION"));
                rec.put("NO_SECCION", rs.getString("NO_SECCION"));
                rec.put("ID_PUESTO", rs.getString("ID_PUESTO"));
                rec.put("NO_PUESTO", rs.getString("NO_PUESTO"));
                rec.put("ID_EMPLEADO", rs.getString("ID_EMPLEADO"));
                rec.put("CO_APS", rs.getString("CO_APS"));
                rec.put("ID_CONTRATO", rs.getString("ID_CONTRATO"));
                rec.put("TI_CONTRATO", rs.getString("TI_CONTRATO"));
                rec.put("ID_DATOS_HIJOS_TRABAJADOR", rs.getString("ID_DATOS_HIJOS_TRABAJADOR"));
                rec.put("AP_PATERNO_HIJO", rs.getString("AP_PATERNO_HIJO"));
                rec.put("AP_MATERNO_HIJO", rs.getString("AP_MATERNO_HIJO"));
                rec.put("NO_HIJO_TRABAJADOR", rs.getString("NO_HIJO_TRABAJADOR"));
                rec.put("ES_SEXO", rs.getString("ES_SEXO"));
                rec.put("FE_NACIMIENTO_HIJO", rs.getString("FE_NACIMIENTO_HIJO"));
                rec.put("ES_TIPO_DOC", rs.getString("ES_TIPO_DOC"));
                rec.put("NU_DOC_HIJO", rs.getString("NU_DOC_HIJO"));
                rec.put("AP_NOMBRES_C", rs.getString("AP_NOMBRES_C"));
                rec.put("NU_DOC_C", rs.getString("NU_DOC_C"));
                rec.put("ES_TRABAJA_UPEU_C", rs.getString("ES_TRABAJA_UPEU_C"));
                rec.put("EDAD_HIJO", rs.getString("EDAD_HIJO"));
                Lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return Lista;
    }

}
