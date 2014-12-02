/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfaceContratoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.List_Rh_Contrato_Fec;
import pe.edu.upeu.application.model.Modalidad;
import pe.edu.upeu.application.model.Regimen_Laboral;
import pe.edu.upeu.application.model.X_List_Anno_Id_Tr_DGP;
import pe.edu.upeu.application.model.X_List_Id_Contrato_DGP;
import pe.edu.upeu.application.web.controller.CConversion;

/**
 *
 * @author Admin
 */
public class ContratoDAO implements InterfaceContratoDAO {
    ConexionBD conn;
    CConversion c = new CConversion();
    @Override
    public void INSERT_CONTRATO(String ID_CONTRATO, String ID_DGP, String FE_DESDE, String FE_HASTA, String FE_CESE, String ID_FUNC, String LI_CONDICION, Double CA_SUELDO, Double CA_REINTEGRO, Double CA_ASIG_FAMILIAR, Double HO_SEMANA, Double NU_HORAS_LAB, Double DIA_CONTRATO, String TI_TRABAJADOR, String LI_REGIMEN_LABORAL, String ES_DISCAPACIDAD, String TI_CONTRATO, String LI_REGIMEN_PENSIONARIO, String ES_CONTRATO_TRABAJADOR, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String US_IP, String FE_VACACIO_INI, String FE_VACACIO_FIN, String ES_CONTRATO, String ID_FILIAL, String ID_DIRECCION, String ID_DEPARTAMENTO, String ID_AREA, String ID_SECCION, String ID_PUESTO, Double CA_BONO_ALIMENTO, String LI_TIPO_CONVENIO, String ES_FIRMO_CONTRATO, Double NU_CONTRATO, String DE_OBSERVACION, String ES_APOYO, String TI_HORA_PAGO, String NU_DOCUMENTO, String ID_ANNO, String ES_ENTREGAR_DOC_REGLAMENTOS, String ES_REGISTRO_HUELLA, String DE_REGISTRO_SISTEM_REMU, String ID_TRABAJADOR, String ID_CENTRO_COSTO, Double CA_SUELDO_TOTAL, String ID_REGIMEN_LABORAL, String ID_MODALIDAD, String ID_SUB_MODALIDAD, String CO_GR_OCUPACION, String FE_SUSCRIPCION, String CO_TI_MONEDA, String CO_TI_REM_VARIAB, String DE_REMU_ESPECIE, String DE_RUC_EMP_TRAB, String CO_SUCURSAL, String DE_MYPE, String ES_TI_CONTRATACION, Double CA_BEV) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_CONTRATO( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )} ");
            cst.setString(1, null);
            cst.setString(2, ID_DGP);
            cst.setString(3, c.convertFecha(FE_DESDE));
            cst.setString(4, c.convertFecha(FE_HASTA));
            cst.setString(5, null);
            cst.setString(6, ID_FUNC);
            cst.setString(7, LI_CONDICION);
            cst.setDouble(8, CA_SUELDO);
            cst.setDouble(9, CA_REINTEGRO);
            cst.setDouble(10, CA_ASIG_FAMILIAR);
            cst.setDouble(11, HO_SEMANA);
            cst.setDouble(12, NU_HORAS_LAB);
            cst.setDouble(13, DIA_CONTRATO);
            cst.setString(14, TI_TRABAJADOR);
            cst.setString(15, LI_REGIMEN_LABORAL);
            cst.setString(16, ES_DISCAPACIDAD);
            cst.setString(17, TI_CONTRATO);
            cst.setString(18, LI_REGIMEN_PENSIONARIO);
            cst.setString(19, ES_CONTRATO_TRABAJADOR);
            cst.setString(20, US_CREACION);
            cst.setString(21, FE_CREACION);
            cst.setString(22, US_MODIF);
            cst.setString(23, FE_MODIF);
            cst.setString(24, US_IP);
            cst.setString(25, FE_VACACIO_INI);
            cst.setString(26, FE_VACACIO_FIN);
            cst.setString(27, ES_CONTRATO);
            cst.setString(28, ID_FILIAL);
            cst.setString(29, ID_DIRECCION);
            cst.setString(30, ID_DEPARTAMENTO);
            cst.setString(31, ID_AREA);
            cst.setString(32, ID_SECCION);
            cst.setString(33, ID_PUESTO);
            cst.setDouble(34, CA_BONO_ALIMENTO);
            cst.setString(35, LI_TIPO_CONVENIO);
            cst.setString(36, ES_FIRMO_CONTRATO);
            cst.setDouble(37, NU_CONTRATO);
            cst.setString(38, DE_OBSERVACION);
            cst.setString(39, ES_APOYO);
            cst.setString(40, TI_HORA_PAGO);
            cst.setString(41, NU_DOCUMENTO);
            cst.setString(42, ID_ANNO);
            cst.setString(43, ES_ENTREGAR_DOC_REGLAMENTOS);
            cst.setString(44, ES_REGISTRO_HUELLA);
            cst.setString(45, DE_REGISTRO_SISTEM_REMU);
            cst.setString(46, ID_TRABAJADOR);
            cst.setString(47, ID_CENTRO_COSTO);
            cst.setDouble(48, CA_SUELDO_TOTAL);
            cst.setString(49, ID_REGIMEN_LABORAL);
            cst.setString(50, ID_MODALIDAD);
            cst.setString(51, ID_SUB_MODALIDAD);
            cst.setString(52, CO_GR_OCUPACION);
            cst.setString(53, c.convertFecha(FE_SUSCRIPCION));
            cst.setString(54, CO_TI_MONEDA);
            cst.setString(55, CO_TI_REM_VARIAB);
            cst.setString(56, DE_REMU_ESPECIE);
            cst.setString(57, DE_RUC_EMP_TRAB);
            cst.setString(58, CO_SUCURSAL);
            cst.setString(59, DE_MYPE);
            cst.setString(60, ES_TI_CONTRATACION);
            cst.setDouble(61, CA_BEV);
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } finally {
            this.conn.close();
        }
    }

    @Override
    public List<X_List_Id_Contrato_DGP> List_id_Contrato_DGP(String id_trabajador, String id_anno) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        //  String sql = "select c.id_contrato, c.id_dgp, c.fe_desde, c.fe_hasta, c.fe_cese, c.id_func, pd.no_area,c.li_condicion , c.ca_sueldo,c.ca_reintegro,c.ca_asig_familiar, c.ho_semana,c.nu_horas_lab,c.dia_contrato,c.ti_trabajador,c.li_regimen_laboral,c.es_discapacidad,c.ti_contrato,c.li_regimen_pensionario, c.es_contrato_trabajador,c.us_creacion,c.fe_creacion,c.us_modif,c.fe_modif,c.us_ip,c.fe_vacacio_ini,c.fe_vacacio_fin,c.es_contrato,c.id_filial,pd.id_direccion,pd.id_departamento,pd.id_area,pd.id_seccion,pd.id_puesto,c.ca_bono_alimento,c.es_jefe,c.li_tipo_convenio,c.es_firmo_contrato,c.nu_contrato,c.de_observacion,c.es_apoyo,c.ti_hora_pago,c.nu_documento,c.id_anno,c.es_entregar_doc_reglamentos,c.es_registro_huella,c.de_registro_sistem_remu,c.id_trabajador, pd.no_puesto,pd.no_seccion, pd.no_dep,pd.no_direccion from rhtm_contrato c, RHVD_puesto_direccion pd   where c.id_puesto = pd.id_puesto and c.es_contrato='1' and c.id_trabajador='" + id_trabajador + "' and c.ID_ANNO='" + id_anno + "'";
        String sql = "select c.*, pd.no_puesto,pd.no_seccion,pd.no_area, pd.no_dep,pd.no_direccion from rhtm_contrato c, RHVD_puesto_direccion pd   where c.id_puesto = pd.id_puesto and c.es_contrato='1' and c.id_trabajador='" + id_trabajador + "' and c.ID_ANNO='" + id_anno + "'";
        List<X_List_Id_Contrato_DGP> list = new ArrayList<X_List_Id_Contrato_DGP>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                X_List_Id_Contrato_DGP icd = new X_List_Id_Contrato_DGP();
                icd.setId_contrato(rs.getString("id_contrato"));
                icd.setId_dgp(rs.getString("id_dgp"));
                icd.setFe_desde(rs.getString("fe_desde"));
                icd.setFe_hasta(rs.getString("fe_hasta"));
                icd.setFe_cese(rs.getString("fe_cese"));
                icd.setId_func(rs.getString("id_func"));
                icd.setNo_area(rs.getString("no_area"));
                icd.setLi_condicion(rs.getString("li_condicion"));
                icd.setCa_sueldo(rs.getDouble("ca_sueldo"));
                icd.setCa_reintegro(rs.getDouble("ca_reintegro"));
                icd.setCa_asig_familiar(rs.getDouble("ca_asig_familiar"));
                icd.setHo_semana(rs.getDouble("ho_semana"));
                icd.setNu_horas_lab(rs.getDouble("nu_horas_lab"));
                icd.setDia_contrato(rs.getDouble("dia_contrato"));
                icd.setTi_trabajador(rs.getString("ti_trabajador"));
                icd.setLi_regimen_laboral(rs.getString("li_regimen_laboral"));
                icd.setEs_discapacidad(rs.getString("es_discapacidad"));
                icd.setTi_contrato(rs.getString("ti_contrato"));
                icd.setLi_regimen_pensionario(rs.getString("li_regimen_pensionario"));
                icd.setEs_contrato_trabajador(rs.getString("es_contrato_trabajador"));
                icd.setUs_creacion(rs.getString("us_creacion"));
                icd.setFe_creacion(rs.getString("fe_creacion"));
                icd.setUs_modif(rs.getString("us_modif"));
                icd.setFe_modif(rs.getString("fe_modif"));
                icd.setUs_ip(rs.getString("us_ip"));
                icd.setFe_vacacio_ini(rs.getString("fe_vacacio_ini"));
                icd.setFe_vacacio_fin(rs.getString("fe_vacacio_fin"));
                icd.setEs_contrato(rs.getString("es_contrato"));
                icd.setId_filial(rs.getString("id_filial"));
                icd.setId_direccion(rs.getString("id_direccion"));
                icd.setId_departamento(rs.getString("id_departamento"));
                icd.setId_area(rs.getString("id_area"));
                icd.setId_seccion(rs.getString("id_seccion"));
                icd.setId_puesto(rs.getString("id_puesto"));
                icd.setCa_bono_alimento(rs.getDouble("ca_bono_alimento"));
                icd.setLi_tipo_convenio(rs.getString("li_tipo_convenio"));
                icd.setEs_firmo_contrato(rs.getString("es_firmo_contrato"));
                icd.setNu_contrato(rs.getDouble("nu_contrato"));
                icd.setDe_observacion(rs.getString("de_observacion"));
                icd.setEs_apoyo(rs.getString("es_apoyo"));
                icd.setTi_hora_pago(rs.getString("ti_hora_pago"));
                icd.setNu_documento(rs.getString("nu_documento"));
                icd.setId_anno(rs.getString("id_anno"));
                icd.setEs_entregar_doc_reglamentos(rs.getString("es_entregar_doc_reglamentos"));
                icd.setEs_registro_huella(rs.getString("es_registro_huella"));
                icd.setDe_registro_sistem_remu(rs.getString("de_registro_sistem_remu"));
                icd.setId_trabajador(rs.getString("id_trabajador"));
                icd.setNo_puesto(rs.getString("no_puesto"));
                icd.setNo_seccion(rs.getString("no_seccion"));
                icd.setNo_dep(rs.getString("no_dep"));
                icd.setNo_direccion(rs.getString("no_direccion"));
                list.add(icd);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    
    
    @Override
    public List<String> List_Rh_Contrato_Idtr() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select id_trabajador  from rhtm_contrato where id_trabajador not in (select id_trabajador from rhtd_empleado where es_empleado = 1 and id_trabajador is not null) and es_contrato=1";
        List<String> list = new ArrayList<String>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                list.add(rs.getString("id_trabajador"));
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<List_Rh_Contrato_Fec> List_Rh_Contrato_Fec(String id_departamento, String fecha_creacion) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select c.id_contrato , c.id_trabajador,dt.ap_paterno,dt.ap_materno,dt.no_trabajador , c.fe_desde,c.fe_hasta,c.ca_sueldo ,dp.no_area,dp.no_seccion,dp.no_puesto, to_char(c.fe_creacion,'dd/mm/yy') from RHTM_CONTRATO c, RHTM_TRABAJADOR dt , RHVD_PUESTO_DIRECCION dp  where dt.id_trabajador = c.id_trabajador  and dp.id_puesto = c.id_puesto AND TO_CHAR(c.fe_creacion,'dd/mm/yy') = TO_CHAR(to_date(" + fecha_creacion + "),'dd/mm/yy') and dp.id_departamento='" + id_departamento + "'";
        List<List_Rh_Contrato_Fec> list = new ArrayList<List_Rh_Contrato_Fec>();
        try {
            ResultSet rs = this.conn.query(sql);
            List_Rh_Contrato_Fec rhf = new List_Rh_Contrato_Fec();
            while (rs.next()) {
                rhf.setAp_materno(rs.getString("ap_materno"));
                rhf.setAp_paterno(rs.getString("ap_paterno"));
                rhf.setCa_sueldo(rs.getDouble("ca_sueldo"));
                rhf.setFe_creacion(rs.getString("fe_creacion"));
                rhf.setFe_desde(rs.getString("fe_desde"));
                rhf.setFe_hasta(rs.getString("fe_hasta"));
                rhf.setId_contrato(rs.getString("id_contrato"));
                rhf.setId_trabajador(rs.getString("id_trabajador"));
                rhf.setNo_area(rs.getString("no_area"));
                rhf.setNo_puesto(rs.getString("no_puesto"));
                rhf.setNo_seccion(rs.getString("no_seccion"));
                rhf.setNo_trabajador(rs.getString("no_trabajador"));
                list.add(rhf);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<X_List_Anno_Id_Tr_DGP> List_Anno_Id_Tr_DGP(String id_trabajador) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select f.id_anno,f.no_anno, dgp.* from (select a.id_anno,a.no_anno ,r.id_dgp ,r.id_trabajador from RHTR_ANNO a , RHTM_CONTRATO r  where   a.id_anno=r.id_anno and r.es_contrato=1)f left outer join RHTM_DGP dgp on (f.id_dgp =dgp.id_dgp) where f.id_trabajador='" + id_trabajador.trim() + "' order by f.no_anno desc";
        List<X_List_Anno_Id_Tr_DGP> list = new ArrayList<X_List_Anno_Id_Tr_DGP>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                X_List_Anno_Id_Tr_DGP aitd = new X_List_Anno_Id_Tr_DGP();
                aitd.setId_anno(rs.getString("id_anno"));
                aitd.setNo_anno(rs.getString("no_anno"));
                aitd.setId_dgp(rs.getString("id_dgp"));
                aitd.setFe_desde(rs.getString("fe_desde"));
                aitd.setFe_hasta(rs.getString("fe_hasta"));
                aitd.setCa_sueldo(rs.getDouble("ca_sueldo"));
                aitd.setId_puesto(rs.getString("id_puesto"));
                aitd.setId_requerimiento(rs.getString("id_requerimiento"));
                aitd.setId_trabajador(rs.getString("id_trabajador"));
                aitd.setCo_ruc(rs.getString("co_ruc"));
                aitd.setDe_lugar_servicio(rs.getString("de_lugar_servicio"));
                aitd.setDe_servicio(rs.getString("de_servicio"));
                aitd.setDe_periodo_pago(rs.getString("de_periodo_pago"));
                aitd.setDe_domicilio_fiscal(rs.getString("de_domicilio_fiscal"));
                aitd.setDe_subvencion(rs.getString("de_subvencion"));
                aitd.setDe_horario_capacitacion(rs.getString("de_horario_capacitacion"));
                aitd.setDe_horario_refrigerio(rs.getString("de_horario_refrigerio"));
                aitd.setDe_dias_capacitacion(rs.getString("de_dias_capacitacion"));
                aitd.setEs_dgp(rs.getString("es_dgp"));
                aitd.setUs_creacion(rs.getString("us_creacion"));
                aitd.setFe_creacion(rs.getString("fe_creacion"));
                aitd.setUs_modif(rs.getString("us_modif"));
                aitd.setFe_modif(rs.getString("fe_modif"));
                aitd.setIp_usuario(rs.getString("ip_usuario"));
                aitd.setCa_bono_alimentario(rs.getDouble("ca_bono_alimentario"));
                aitd.setDe_bev(rs.getDouble("de_bev"));
                aitd.setCa_centro_costos(rs.getDouble("ca_centro_costos"));
                aitd.setDe_antecedentes_policiales(rs.getString("de_antecedentes_policiales"));
                aitd.setDe_certificado_salud(rs.getString("de_certificado_salud"));
                aitd.setDe_monto_honorario(rs.getString("de_monto_honorario"));
                list.add(aitd);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public int Validar_Anno(String id_trabajador, String id_anno) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select count(*) from rhtm_contrato  where  id_anno_id='" + id_anno + "' and id_trabajador='" + id_trabajador + "'";
        int validar = 0;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                validar = rs.getInt("1");
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return validar;
    }

    @Override
    public void Venc_Cont() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        this.conn.ejecutar(" begin venc_contrato; end;");
    }

    @Override
    public List<Modalidad> List_modalidad() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = " select * from  RHTX_MODALIDAD ";
        List<Modalidad> list = new ArrayList<Modalidad>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Modalidad aitd = new Modalidad();
                aitd.setId_modalidad(rs.getString("id_modalidad"));
                aitd.setDe_modalidad(rs.getString("de_modalidad"));
                aitd.setCo_modalidad(rs.getString("co_modalidad"));
                list.add(aitd);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Regimen_Laboral> list_reg_labo() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = " select * from  RHTX_REGIMEN_LABORAL ";
        List<Regimen_Laboral> list = new ArrayList<Regimen_Laboral>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Regimen_Laboral aitd = new Regimen_Laboral();
                aitd.setId_regimen_laboral(rs.getString("id_regimen_laboral"));
                aitd.setCo_regimen_l(rs.getString("co_regimen_l"));
                aitd.setDe_regimen_l(rs.getString("de_regimen_l"));
                list.add(aitd);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

}
