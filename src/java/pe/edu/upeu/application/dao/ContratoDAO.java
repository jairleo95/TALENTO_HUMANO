/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.spi.DirStateFactory;
import pe.edu.upeu.application.dao_imp.InterfaceContratoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Anno;
import pe.edu.upeu.application.model.List_Rh_Contrato_Fec;
import pe.edu.upeu.application.model.Modalidad;
import pe.edu.upeu.application.model.Plantilla_Contractual;
import pe.edu.upeu.application.model.Regimen_Laboral;
import pe.edu.upeu.application.model.Sub_Modalidad;
import pe.edu.upeu.application.model.V_List_Empleado;
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
    public void INSERT_CONTRATO(String ID_CONTRATO, String ID_DGP, String FE_DESDE, String FE_HASTA, String FE_CESE, String ID_FUNC, String LI_CONDICION, Double CA_SUELDO, Double CA_REINTEGRO, Double CA_ASIG_FAMILIAR, Double HO_SEMANA, Double NU_HORAS_LAB, Double DIA_CONTRATO, String TI_TRABAJADOR, String LI_REGIMEN_LABORAL, String ES_DISCAPACIDAD, String TI_CONTRATO, String LI_REGIMEN_PENSIONARIO, String ES_CONTRATO_TRABAJADOR, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String US_IP, String FE_VACACIO_INI, String FE_VACACIO_FIN, String ES_CONTRATO, String ID_FILIAL, String ID_PUESTO, Double CA_BONO_ALIMENTO, String LI_TIPO_CONVENIO, String ES_FIRMO_CONTRATO, Double NU_CONTRATO, String DE_OBSERVACION, String ES_APOYO, String TI_HORA_PAGO, String NU_DOCUMENTO, String ID_ANNO, String ES_ENTREGAR_DOC_REGLAMENTOS, String ES_REGISTRO_HUELLA, String DE_REGISTRO_SISTEM_REMU, String ID_TRABAJADOR, Double CA_SUELDO_TOTAL, String ID_REGIMEN_LABORAL, String ID_MODALIDAD, String ID_SUB_MODALIDAD, String CO_GR_OCUPACION, String FE_SUSCRIPCION, String CO_TI_MONEDA, String CO_TI_REM_VARIAB, String DE_REMU_ESPECIE, String DE_RUC_EMP_TRAB, String CO_SUCURSAL, String DE_MYPE, String ES_TI_CONTRATACION, Double CA_BEV, String ID_TIPO_PLANILLA, String ES_REMUNERACION_PROCESADO, String ID_HORARIO,String ID_PLANTILLA_CONTRACTUAL, Double ca_bonificacion_p) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_CONTRATO( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,? )} ");
            cst.setString(1, null);
            cst.setString(2, ID_DGP);
            cst.setString(3, c.convertFecha(FE_DESDE));
            if (FE_HASTA.equals("")) {
                cst.setString(4, FE_HASTA);
            } else {
                cst.setString(4, c.convertFecha(FE_HASTA));
            }
            cst.setString(5, FE_CESE);
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
            cst.setString(19, "1");
            cst.setString(20, US_CREACION);
            cst.setString(21, FE_CREACION);
            cst.setString(22, US_MODIF);
            cst.setString(23, FE_MODIF);
            cst.setString(24, US_IP);
            cst.setString(25, FE_VACACIO_INI);
            cst.setString(26, FE_VACACIO_FIN);
            cst.setString(27, "1");
            cst.setString(28, ID_FILIAL);
            cst.setString(29, ID_PUESTO);
            cst.setDouble(30, CA_BONO_ALIMENTO);
            cst.setString(31, LI_TIPO_CONVENIO);
            cst.setString(32, ES_FIRMO_CONTRATO);
            cst.setDouble(33, NU_CONTRATO);
            cst.setString(34, DE_OBSERVACION);
            cst.setString(35, ES_APOYO);
            cst.setString(36, TI_HORA_PAGO);
            cst.setString(37, NU_DOCUMENTO);
            cst.setString(38, ID_ANNO);
            cst.setString(39, ES_ENTREGAR_DOC_REGLAMENTOS);
            cst.setString(40, ES_REGISTRO_HUELLA);
            cst.setString(41, DE_REGISTRO_SISTEM_REMU);
            cst.setString(42, ID_TRABAJADOR);
            cst.setDouble(43, CA_SUELDO_TOTAL);
            cst.setString(44, ID_REGIMEN_LABORAL);
            cst.setString(45, ID_MODALIDAD);
            cst.setString(46, ID_SUB_MODALIDAD);
            cst.setString(47, CO_GR_OCUPACION);
            cst.setString(48, c.convertFecha(FE_SUSCRIPCION));
            cst.setString(49, CO_TI_MONEDA);
            cst.setString(50, CO_TI_REM_VARIAB);
            cst.setString(51, DE_REMU_ESPECIE);
            cst.setString(52, DE_RUC_EMP_TRAB);
            cst.setString(53, CO_SUCURSAL);
            cst.setString(54, DE_MYPE);
            cst.setString(55, ES_TI_CONTRATACION);
            cst.setDouble(56, CA_BEV);
            cst.setString(57, ID_TIPO_PLANILLA);
            cst.setString(58, "0");
            cst.setString(59, ID_HORARIO);
            cst.setString(60, ID_PLANTILLA_CONTRACTUAL);
            cst.setDouble(61, ca_bonificacion_p);
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());

        } catch (ParseException ex) {
            Logger.getLogger(ContratoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.conn.close();
        }
    }

    @Override
    public List<X_List_Id_Contrato_DGP> List_id_Contrato_DGP(String id_trabajador, String id_anno) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        //String sql = "select c.id_contrato, c.id_dgp, c.fe_desde, c.fe_hasta, c.fe_cese, c.id_func, pd.no_area,c.li_condicion , c.ca_sueldo,c.ca_reintegro,c.ca_asig_familiar, c.ho_semana,c.nu_horas_lab,c.dia_contrato,c.ti_trabajador,c.li_regimen_laboral,c.es_discapacidad,c.ti_contrato,c.li_regimen_pensionario, c.es_contrato_trabajador,c.us_creacion,c.fe_creacion,c.us_modif,c.fe_modif,c.us_ip,c.fe_vacacio_ini,c.fe_vacacio_fin,c.es_contrato,c.id_filial,pd.id_direccion,pd.id_departamento,pd.id_area,pd.id_seccion,pd.id_puesto,c.ca_bono_alimento,c.es_jefe,c.li_tipo_convenio,c.es_firmo_contrato,c.nu_contrato,c.de_observacion,c.es_apoyo,c.ti_hora_pago,c.nu_documento,c.id_anno,c.es_entregar_doc_reglamentos,c.es_registro_huella,c.de_registro_sistem_remu,c.id_trabajador, pd.no_puesto,pd.no_seccion, pd.no_dep,pd.no_direccion from rhtm_contrato c, RHVD_puesto_direccion pd   where c.id_puesto = pd.id_puesto and c.es_contrato='1' and c.id_trabajador='" + id_trabajador + "' and c.ID_ANNO='" + id_anno + "'";
        String sql = "select * from RHVD_LIST_CONTRATO where ID_TRABAJADOR='" + id_trabajador + "' and ID_ANNO='" + id_anno + "'";
        List<X_List_Id_Contrato_DGP> list = new ArrayList<X_List_Id_Contrato_DGP>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                X_List_Id_Contrato_DGP v = new X_List_Id_Contrato_DGP();

                v.setId_filial(rs.getString("id_filial"));
                v.setId_puesto(rs.getString("id_puesto"));
                v.setCa_bono_alimento(rs.getDouble("ca_bono_alimento"));
                v.setLi_tipo_convenio(rs.getString("li_tipo_convenio"));
                v.setEs_firmo_contrato(rs.getString("es_firmo_contrato"));
                v.setNu_contrato(rs.getDouble("nu_contrato"));
                v.setDe_observacion(rs.getString("de_observacion"));
                v.setEs_apoyo(rs.getString("es_apoyo"));
                v.setTi_hora_pago(rs.getString("ti_hora_pago"));
                v.setNu_documento(rs.getString("nu_documento"));
                v.setId_anno(rs.getString("id_anno"));
                v.setEs_entregar_doc_reglamentos(rs.getString("es_entregar_doc_reglamentos"));
                v.setEs_registro_huella(rs.getString("es_registro_huella"));
                v.setDe_registro_sistem_remu(rs.getString("de_registro_sistem_remu"));
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setCa_sueldo_total(rs.getDouble("ca_sueldo_total"));
                v.setId_regimen_laboral(rs.getString("id_regimen_laboral"));
                v.setId_sub_modalidad(rs.getString("id_sub_modalidad"));
                v.setId_grupo_ocupacion(rs.getString("id_grupo_ocupacion"));
                v.setFe_suscripcion(rs.getString("fe_suscripcion"));
                v.setCo_ti_moneda(rs.getString("co_ti_moneda"));
                v.setCo_ti_rem_variab(rs.getString("co_ti_rem_variab"));
                v.setDe_remu_especie(rs.getString("de_remu_especie"));
                v.setDe_ruc_emp_trab(rs.getString("de_ruc_emp_trab"));
                v.setCo_sucursal(rs.getString("co_sucursal"));
                v.setDe_mype(rs.getString("de_mype"));
                v.setEs_ti_contratacion(rs.getString("es_ti_contratacion"));
                v.setCa_bev(rs.getDouble("ca_bev"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setNo_seccion(rs.getString("no_seccion"));
                v.setNo_area(rs.getString("no_area"));
                v.setNo_dep(rs.getString("no_dep"));
                v.setNo_direccion(rs.getString("no_direccion"));
                v.setDe_grupo_ocupacion(rs.getString("de_grupo_ocupacion"));
                v.setId_contrato(rs.getString("id_contrato"));
                v.setId_dgp(rs.getString("id_dgp"));
                v.setFe_desde(rs.getString("fe_desde"));
                v.setFe_hasta(rs.getString("fe_hasta"));
                v.setFe_cese(rs.getString("fe_cese"));
                v.setId_func(rs.getString("id_func"));
                v.setLi_condicion(rs.getString("li_condicion"));
                v.setCa_sueldo(rs.getDouble("ca_sueldo"));
                v.setCa_reintegro(rs.getDouble("ca_reintegro"));
                v.setCa_asig_familiar(rs.getDouble("ca_asig_familiar"));
                v.setHo_semana(rs.getDouble("ho_semana"));
                v.setNu_horas_lab(rs.getDouble("nu_horas_lab"));
                v.setDia_contrato(rs.getDouble("dia_contrato"));
                v.setTi_trabajador(rs.getString("ti_trabajador"));
                v.setLi_regimen_laboral(rs.getString("li_regimen_laboral"));
                v.setEs_discapacidad(rs.getString("es_discapacidad"));
                v.setTi_contrato(rs.getString("ti_contrato"));
                v.setLi_regimen_pensionario(rs.getString("li_regimen_pensionario"));
                v.setEs_contrato_trabajador(rs.getString("es_contrato_trabajador"));
                v.setUs_creacion(rs.getString("us_creacion"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setUs_modif(rs.getString("us_modif"));
                v.setFe_modif(rs.getString("fe_modif"));
                v.setUs_ip(rs.getString("us_ip"));
                v.setFe_vacacio_ini(rs.getString("fe_vacacio_ini"));
                v.setEs_contrato(rs.getString("es_contrato"));
                v.setFe_vacacio_fin(rs.getString("fe_vacacio_fin"));
                v.setDe_sub_modalidad(rs.getString("de_sub_modalidad"));
                v.setDe_modalidad(rs.getString("de_modalidad"));
                v.setCa_bonificacion_p(rs.getDouble("ca_bonificacion_p"));

                list.add(v);
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
                // aitd.setDe_certificado_salud(rs.getString("de_certificado_salud"));
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

    @Override
    public List<Sub_Modalidad> List_submodalidad() {
        List<Sub_Modalidad> list = new ArrayList<Sub_Modalidad>();
        return list;
    }

    @Override
    public String Buscar_id_tr(String id_dgp) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT ID_CONTRATO FROM RHTM_CONTRATO WHERE ID_DGP='" + id_dgp + "'";
        String id_con = null;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                id_con = rs.getString(1);
            }
        } catch (SQLException e) {

        } finally {
            this.conn.close();
        }
        return id_con;
    }

    @Override
    public String Buscar_id_contrato_x_idtr(String idtr) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT ID_CONTRATO FROM RHTM_CONTRATO where ID_TRABAJADOR='" + idtr.trim() + "' and ES_CONTRATO='1'";
        String id_Tr = null;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                id_Tr = rs.getString(1);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return id_Tr;
    }

    @Override
    public String ID_MAX_ANNO() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select 'ANN-'||lpad(to_char(MAX(TO_NUMBER(SUBSTR(ID_ANNO,5,8)))),6,'0') from RHTR_ANNO ";
        String id_anno = null;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                id_anno = rs.getString(1);
            }
        } catch (SQLException e) {

        } finally {
            this.conn.close();
        }
        return id_anno;
    }

    @Override
    public List<Anno> LIST_ANNO() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = " select * from RHTR_ANNO  ";
        List<Anno> list = new ArrayList<Anno>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Anno a = new Anno();
                a.setId_anno(rs.getString("id_anno"));
                a.setNo_anno(rs.getString("no_anno"));
                a.setDe_anno(rs.getString("de_anno"));
                a.setFe_desde(rs.getString("fe_desde"));
                a.setFe_hasta(rs.getString("fe_hasta"));
                a.setDe_observacion(rs.getString("de_observacion"));
                list.add(a);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public String Contrato_max(String id_tr) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT ID_CONTRATO FROM RHTM_CONTRATO where ID_CONTRATO=(SELECT 'CTO-'||lpad(to_char(MAX(TO_NUMBER(SUBSTR(cc.ID_CONTRATO,5,8)))),6,'0')  FROM RHTM_CONTRATO cc where ID_ANNO=(SELECT ID_ANNO FROM RHTR_ANNO WHERE ID_ANNO=(SELECT 'ANN-'||lpad(TO_CHAR(MAX(TO_NUMBER(SUBSTR(ID_ANNO,5,8)))),6,'0')FROM(SELECT f.id_anno,f.no_anno,f.id_trabajador FROM (SELECT a.id_anno, a.no_anno , r.id_dgp , r.id_trabajador FROM RHTR_ANNO a ,RHTM_CONTRATO r WHERE a.id_anno=r.id_anno AND r.ES_CONTRATO_TRABAJADOR=1)f WHERE f.id_trabajador='" + id_tr.trim() + "' ORDER BY f.no_anno DESC))) and cc.ID_TRABAJADOR='" + id_tr.trim() + "')";
        String id_anno = null;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                id_anno = rs.getString(1);
            }
        } catch (SQLException e) {

        } finally {
            this.conn.close();
        }
        return id_anno;
    }

    @Override
    public List<X_List_Id_Contrato_DGP> List_contra_x_idcto(String id_cto) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        //String sql = "select c.id_contrato, c.id_dgp, c.fe_desde, c.fe_hasta, c.fe_cese, c.id_func, pd.no_area,c.li_condicion , c.ca_sueldo,c.ca_reintegro,c.ca_asig_familiar, c.ho_semana,c.nu_horas_lab,c.dia_contrato,c.ti_trabajador,c.li_regimen_laboral,c.es_discapacidad,c.ti_contrato,c.li_regimen_pensionario, c.es_contrato_trabajador,c.us_creacion,c.fe_creacion,c.us_modif,c.fe_modif,c.us_ip,c.fe_vacacio_ini,c.fe_vacacio_fin,c.es_contrato,c.id_filial,pd.id_direccion,pd.id_departamento,pd.id_area,pd.id_seccion,pd.id_puesto,c.ca_bono_alimento,c.es_jefe,c.li_tipo_convenio,c.es_firmo_contrato,c.nu_contrato,c.de_observacion,c.es_apoyo,c.ti_hora_pago,c.nu_documento,c.id_anno,c.es_entregar_doc_reglamentos,c.es_registro_huella,c.de_registro_sistem_remu,c.id_trabajador, pd.no_puesto,pd.no_seccion, pd.no_dep,pd.no_direccion from rhtm_contrato c, RHVD_puesto_direccion pd   where c.id_puesto = pd.id_puesto and c.es_contrato='1' and c.id_trabajador='" + id_trabajador + "' and c.ID_ANNO='" + id_anno + "'";
        String sql = "SELECT * FROM RHVD_CONTRATOS_HISTORIAL WHERE ID_CONTRATO='" + id_cto + "'";
        List<X_List_Id_Contrato_DGP> list = new ArrayList<X_List_Id_Contrato_DGP>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                X_List_Id_Contrato_DGP v = new X_List_Id_Contrato_DGP();

                v.setId_filial(rs.getString("id_filial"));
                v.setId_puesto(rs.getString("id_puesto"));
                v.setCa_bono_alimento(rs.getDouble("ca_bono_alimento"));
                v.setLi_tipo_convenio(rs.getString("li_tipo_convenio"));
                v.setEs_firmo_contrato(rs.getString("es_firmo_contrato"));
                v.setNu_contrato(rs.getDouble("nu_contrato"));
                v.setDe_observacion(rs.getString("de_observacion"));
                v.setEs_apoyo(rs.getString("es_apoyo"));
                v.setTi_hora_pago(rs.getString("ti_hora_pago"));
                v.setNu_documento(rs.getString("nu_documento"));
                v.setId_anno(rs.getString("id_anno"));
                v.setEs_entregar_doc_reglamentos(rs.getString("es_entregar_doc_reglamentos"));
                v.setEs_registro_huella(rs.getString("es_registro_huella"));
                v.setDe_registro_sistem_remu(rs.getString("de_registro_sistem_remu"));
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setCa_sueldo_total(rs.getDouble("ca_sueldo_total"));
                v.setId_regimen_laboral(rs.getString("id_regimen_laboral"));
                v.setId_sub_modalidad(rs.getString("id_sub_modalidad"));
                v.setId_grupo_ocupacion(rs.getString("id_grupo_ocupacion"));
                v.setFe_suscripcion(rs.getString("fe_suscripcion"));
                v.setCo_ti_moneda(rs.getString("co_ti_moneda"));
                v.setCo_ti_rem_variab(rs.getString("co_ti_rem_variab"));
                v.setDe_remu_especie(rs.getString("de_remu_especie"));
                v.setDe_ruc_emp_trab(rs.getString("de_ruc_emp_trab"));
                v.setCo_sucursal(rs.getString("co_sucursal"));
                v.setDe_mype(rs.getString("de_mype"));
                v.setEs_ti_contratacion(rs.getString("es_ti_contratacion"));
                v.setCa_bev(rs.getDouble("ca_bev"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setNo_seccion(rs.getString("no_seccion"));
                v.setNo_area(rs.getString("no_area"));
                v.setNo_dep(rs.getString("no_dep"));
                v.setNo_direccion(rs.getString("no_direccion"));
                v.setDe_grupo_ocupacion(rs.getString("de_grupo_ocupacion"));
                v.setId_contrato(rs.getString("id_contrato"));
                v.setId_dgp(rs.getString("id_dgp"));
                v.setFe_desde(rs.getString("fe_desde"));
                v.setFe_hasta(rs.getString("fe_hasta"));
                v.setFe_cese(rs.getString("fe_cese"));
                v.setId_func(rs.getString("id_func"));
                v.setLi_condicion(rs.getString("li_condicion"));
                v.setCa_sueldo(rs.getDouble("ca_sueldo"));
                v.setCa_reintegro(rs.getDouble("ca_reintegro"));
                v.setCa_asig_familiar(rs.getDouble("ca_asig_familiar"));
                v.setHo_semana(rs.getDouble("ho_semana"));
                v.setNu_horas_lab(rs.getDouble("nu_horas_lab"));
                v.setDia_contrato(rs.getDouble("dia_contrato"));
                v.setTi_trabajador(rs.getString("ti_trabajador"));
                v.setLi_regimen_laboral(rs.getString("li_regimen_laboral"));
                v.setEs_discapacidad(rs.getString("es_discapacidad"));
                v.setTi_contrato(rs.getString("ti_contrato"));
                v.setLi_regimen_pensionario(rs.getString("li_regimen_pensionario"));
                v.setEs_contrato_trabajador(rs.getString("es_contrato_trabajador"));
                v.setUs_creacion(rs.getString("us_creacion"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setUs_modif(rs.getString("us_modif"));
                v.setFe_modif(rs.getString("fe_modif"));
                v.setUs_ip(rs.getString("us_ip"));
                v.setFe_vacacio_ini(rs.getString("fe_vacacio_ini"));
                v.setEs_contrato(rs.getString("es_contrato"));
                v.setFe_vacacio_fin(rs.getString("fe_vacacio_fin"));
                v.setDe_sub_modalidad(rs.getString("de_sub_modalidad"));
                v.setDe_modalidad(rs.getString("de_modalidad"));
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setLi_di_dom_a_d1(rs.getString("li_di_dom_a_d1"));
                v.setDi_dom_a_d2(rs.getString("di_dom_a_d2"));
                v.setLi_di_dom_a_d3(rs.getString("li_di_dom_a_d3"));
                v.setDi_dom_a_d4(rs.getString("di_dom_a_d4"));
                v.setLi_di_dom_a_d5(rs.getString("li_di_dom_a_d5"));
                v.setDi_dom_a_d6(rs.getString("di_dom_a_d6"));
                v.setNo_distrito(rs.getString("no_distrito"));
                v.setNo_provincia(rs.getString("no_provincia"));
                v.setFe_sus(rs.getString("fe_sus"));
                v.setId_plantilla_contractual(rs.getString("id_plantilla_contractual"));
                v.setFe_has(rs.getString("fe_has"));
                v.setFe_des(rs.getString("fe_des"));
                v.setCa_bonificacion_p(rs.getDouble("ca_bonificacion_p"));
                list.add(v);
            }
        }catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al insertar archivo");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return list;
    }

    @Override
    public String MAX_ID_CONTRATO() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECt 'CTO-'||MAX(SUBSTR(ID_CONTRATO,5,8)) FROM RHTM_CONTRATO";
        String Maxcto = null;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Maxcto = rs.getString(1);
            }
        } catch (Exception e) {
        } finally {
            this.conn.close();
        }
        return Maxcto;
    }

    @Override
    public void INSERT_CONTRATO_ADJUNTO(String ID_CONTRATO_ADJUNTO, String ID_CONTRATO, String NO_ARCHIVO, String NO_ARCHIVO_ORIGINAL, String ES_CONTRATO_ADJUNTO, String IP_USUARIO, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_CONTRATO_ADJUNTO ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )} ");
            cst.setString(1, null);
            cst.setString(2, ID_CONTRATO);
            cst.setString(3, NO_ARCHIVO);
            cst.setString(4, NO_ARCHIVO_ORIGINAL);
            cst.setString(5, "1");
            cst.setString(6, IP_USUARIO);
            cst.setString(7, US_CREACION);
            cst.setString(8, FE_CREACION);
            cst.setString(9, US_MODIF);
            cst.setString(10, FE_MODIF);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al insertar archivo");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public void UPDATE_FIRMA(String ID_TR, String IDDGP) {

        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_UPDATE_ES_FIRMA( ?,?)} ");
            cst.setString(1, IDDGP);
            cst.setString(2, ID_TR.trim());
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al ACTUALIZAR CONTRATO");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
}
        }

    }

    @Override
    public List<V_List_Empleado> LIST_CASOS_ESPECIALES() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from RHVD_LIST_EMPLEADO where ID_TRABAJADOR IN (select DISTINCT ID_TRABAJADOR from RHTM_CONTRATO where ID_DGP is null ) and FE_CREACION_CONTRATO  like '%15'";
        List<V_List_Empleado> list = new ArrayList<V_List_Empleado>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_List_Empleado v = new V_List_Empleado();
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setNo_area(rs.getString("no_area"));
                v.setNo_seccion(rs.getString("no_seccion"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setFe_desde(rs.getString("fe_desde"));
                v.setFe_hasta(rs.getString("fe_hasta"));
                v.setFe_hasta(rs.getString("fe_hasta"));
                v.setCa_sueldo(rs.getDouble("ca_sueldo"));
                list.add(v);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Map<String, ?>> Listar_Contratos(String de, String al, String direccion, String dep, String area, String sec, String puesto, String sueldo_total,String nombre,String fe_i,String fe_fin) {
      List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select  *  from RHVD_FILTRO_CONTRATO_TERMINADO WHERE FE_CREACION IS NOT NULL";
           // if(sueldo_total!=null ){sql+=" and CA_SUELDO_TOTAL="+sueldo_total;}else{}
           sql += (!nombre.equals("")) ? " AND  UPPER(NO_AP)  like '%" + nombre.toUpperCase() + "%'" : "";
           sql += (!de.equals("") & !al.equals("")) ? " AND FE_CREACION BETWEEN '"+c.convertFecha(de.trim())+"' and '"+c.convertFecha(al.trim())+"'" : "";
           sql += (!direccion.equals("")) ? " AND ID_DIRECCION = '"+direccion.trim()+"'" : "";
           sql += (!dep.equals("")) ? " and ID_DEPARTAMENTO= '"+dep.trim()+"'" : "";
           sql += (!area.equals("")) ?" and ID_AREA= '"+area.trim()+"'" : "";
           sql += (!sec.equals("")) ? " and ID_SECCION= '"+sec.trim()+"'" : "";
           sql += (!sueldo_total.equals("")) ? " and CA_SUELDO_TOTAL= '"+sueldo_total.trim()+"'" : "";
           sql += (!puesto.equals("")) ? " and ID_PUESTO= '"+puesto.trim()+"'" : "";
           sql += (!fe_i.equals("")) ? " and FE_DESDE= '"+c.convertFecha(fe_i.trim())+"'" : "";
           sql += (!fe_fin.equals("")) ? " and FE_HASTA= '"+c.convertFecha(fe_fin.trim())+"'" : "";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("nombre", rs.getString("NO_AP"));
                rec.put("id_co", rs.getString("ID_CONTRATO"));
                rec.put("no_pu", rs.getString("NO_PUESTO"));
                rec.put("no_ar", rs.getString("NO_AREA"));
                rec.put("no_se", rs.getString("NO_SECCION"));
                rec.put("no_di", rs.getString("NO_DIRECCION"));
                rec.put("no_de", rs.getString("NO_DEP"));
                rec.put("ca_su", rs.getString("CA_SUELDO_TOTAL"));
                rec.put("id_pl", rs.getString("ID_PLANTILLA_CONTRACTUAL"));
                rec.put("fe_cr", rs.getString("FE_CREACION"));
                rec.put("id_tr", rs.getString("ID_TRABAJADOR"));
                rec.put("fe_de", rs.getString("FE_DESDE"));
                rec.put("fe_ha", rs.getString("FE_HASTA"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al cargar la lista de puestos");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return lista;
    }

    @Override
    public List<Map<String, ?>> List_contra_x_idcto_json(String id_ctos) {
      List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT * FROM RHVD_CONTRATOS_HISTORIAL WHERE ID_CONTRATO='" + id_ctos + "'";
           // if(sueldo_total!=null ){sql+=" and CA_SUELDO_TOTAL="+sueldo_total;}else{}
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("no_tr", rs.getString("no_trabajador"));
                rec.put("ap_pa", rs.getString("ap_paterno"));
                rec.put("ap_ma", rs.getString("ap_materno"));
                rec.put("nu_do", rs.getString("nu_documento"));
                rec.put("li_d1", rs.getString("li_di_dom_a_d1"));
                rec.put("li_d3", rs.getString("li_di_dom_a_d3"));
                rec.put("li_d5", rs.getString("li_di_dom_a_d5"));
                rec.put("di_d2", rs.getString("di_dom_a_d2"));
                rec.put("di_d4", rs.getString("di_dom_a_d4"));
                rec.put("di_d6", rs.getString("di_dom_a_d6"));
                rec.put("no_pr", rs.getString("no_provincia"));
                rec.put("no_di", rs.getString("no_distrito"));
                rec.put("no_dp", rs.getString("no_dep"));
                rec.put("fe_de", rs.getString("fe_des"));
                rec.put("fe_ha", rs.getString("fe_has"));
                rec.put("no_pu", rs.getString("no_puesto"));
                rec.put("fe_su", rs.getString("fe_sus"));
                rec.put("ca_st", rs.getString("ca_sueldo_total"));
                rec.put("nu_ho", rs.getString("nu_horas_lab"));
                rec.put("co_tm", rs.getString("co_ti_moneda"));
                rec.put("id_pu", rs.getString("id_puesto"));
                /*
                 v.setId_filial(rs.getString("id_filial"));
                v.setId_puesto(rs.getString("id_puesto"));
                v.setCa_bono_alimento(rs.getDouble("ca_bono_alimento"));
                v.setLi_tipo_convenio(rs.getString("li_tipo_convenio"));
                v.setEs_firmo_contrato(rs.getString("es_firmo_contrato"));
                v.setNu_contrato(rs.getDouble("nu_contrato"));
                v.setDe_observacion(rs.getString("de_observacion"));
                v.setEs_apoyo(rs.getString("es_apoyo"));
                v.setTi_hora_pago(rs.getString("ti_hora_pago"));
                v.setNu_documento(rs.getString("nu_documento"));
                v.setId_anno(rs.getString("id_anno"));
                v.setEs_entregar_doc_reglamentos(rs.getString("es_entregar_doc_reglamentos"));
                v.setEs_registro_huella(rs.getString("es_registro_huella"));
                v.setDe_registro_sistem_remu(rs.getString("de_registro_sistem_remu"));
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setCa_sueldo_total(rs.getDouble("ca_sueldo_total"));
                v.setId_regimen_laboral(rs.getString("id_regimen_laboral"));
                v.setId_sub_modalidad(rs.getString("id_sub_modalidad"));
                v.setId_grupo_ocupacion(rs.getString("id_grupo_ocupacion"));
                v.setFe_suscripcion(rs.getString("fe_suscripcion"));
                v.setCo_ti_moneda(rs.getString("co_ti_moneda"));
                v.setCo_ti_rem_variab(rs.getString("co_ti_rem_variab"));
                v.setDe_remu_especie(rs.getString("de_remu_especie"));
                v.setDe_ruc_emp_trab(rs.getString("de_ruc_emp_trab"));
                v.setCo_sucursal(rs.getString("co_sucursal"));
                v.setDe_mype(rs.getString("de_mype"));
                v.setEs_ti_contratacion(rs.getString("es_ti_contratacion"));
                v.setCa_bev(rs.getDouble("ca_bev"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setNo_seccion(rs.getString("no_seccion"));
                v.setNo_area(rs.getString("no_area"));
                v.setNo_dep(rs.getString("no_dep"));
                v.setNo_direccion(rs.getString("no_direccion"));
                v.setDe_grupo_ocupacion(rs.getString("de_grupo_ocupacion"));
                v.setId_contrato(rs.getString("id_contrato"));
                v.setId_dgp(rs.getString("id_dgp"));
                v.setFe_desde(rs.getString("fe_desde"));
                v.setFe_hasta(rs.getString("fe_hasta"));
                v.setFe_cese(rs.getString("fe_cese"));
                v.setId_func(rs.getString("id_func"));
                v.setLi_condicion(rs.getString("li_condicion"));
                v.setCa_sueldo(rs.getDouble("ca_sueldo"));
                v.setCa_reintegro(rs.getDouble("ca_reintegro"));
                v.setCa_asig_familiar(rs.getDouble("ca_asig_familiar"));
                v.setHo_semana(rs.getDouble("ho_semana"));
                v.setNu_horas_lab(rs.getDouble("nu_horas_lab"));
                v.setDia_contrato(rs.getDouble("dia_contrato"));
                v.setTi_trabajador(rs.getString("ti_trabajador"));
                v.setLi_regimen_laboral(rs.getString("li_regimen_laboral"));
                v.setEs_discapacidad(rs.getString("es_discapacidad"));
                v.setTi_contrato(rs.getString("ti_contrato"));
                v.setLi_regimen_pensionario(rs.getString("li_regimen_pensionario"));
                v.setEs_contrato_trabajador(rs.getString("es_contrato_trabajador"));
                v.setUs_creacion(rs.getString("us_creacion"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setUs_modif(rs.getString("us_modif"));
                v.setFe_modif(rs.getString("fe_modif"));
                v.setUs_ip(rs.getString("us_ip"));
                v.setFe_vacacio_ini(rs.getString("fe_vacacio_ini"));
                v.setEs_contrato(rs.getString("es_contrato"));
                v.setFe_vacacio_fin(rs.getString("fe_vacacio_fin"));
                v.setDe_sub_modalidad(rs.getString("de_sub_modalidad"));
                v.setDe_modalidad(rs.getString("de_modalidad"));
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setLi_di_dom_a_d1(rs.getString("li_di_dom_a_d1"));
                v.setDi_dom_a_d2(rs.getString("di_dom_a_d2"));
                v.setLi_di_dom_a_d3(rs.getString("li_di_dom_a_d3"));
                v.setDi_dom_a_d4(rs.getString("di_dom_a_d4"));
                v.setLi_di_dom_a_d5(rs.getString("li_di_dom_a_d5"));
                v.setDi_dom_a_d6(rs.getString("di_dom_a_d6"));
                v.setNo_distrito(rs.getString("no_distrito"));
                v.setNo_provincia(rs.getString("no_provincia"));
                v.setFe_sus(rs.getString("fe_sus"));
                v.setId_plantilla_contractual(rs.getString("id_plantilla_contractual"));
                v.setFe_has(rs.getString("fe_has"));
                v.setFe_des(rs.getString("fe_des"));
                v.setCa_bonificacion_p(rs.getDouble("ca_bonificacion_p"));
                */
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al cargar la lista de puestos");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return lista;
    }

}
