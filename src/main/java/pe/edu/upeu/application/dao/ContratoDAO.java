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
import pe.edu.upeu.application.dao_imp.InterfaceContratoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Contrato;
import pe.edu.upeu.application.model.Contrato_Adjunto;
import pe.edu.upeu.application.model.List_Rh_Contrato_Fec;
import pe.edu.upeu.application.model.Modalidad;
import pe.edu.upeu.application.model.Regimen_Laboral;
import pe.edu.upeu.application.model.Sub_Modalidad;
import pe.edu.upeu.application.model.V_Contrato_dgp;
import pe.edu.upeu.application.model.V_List_Empleado;
import pe.edu.upeu.application.model.X_List_Id_Contrato_DGP;
import pe.edu.upeu.application.util.DateFormat;

/**
 *
 * @author Admin
 */
public class ContratoDAO implements InterfaceContratoDAO {

    ConexionBD conn;
    DateFormat c = new DateFormat();

    @Override
    public void INSERT_CONTRATO(String ID_CONTRATO, String ID_DGP, String FE_DESDE, String FE_HASTA, String FE_CESE,
            String ID_FUNC, String LI_CONDICION, double CA_SUELDO, double CA_REINTEGRO, double CA_ASIG_FAMILIAR,
            double HO_SEMANA, double NU_HORAS_LAB, double DIA_CONTRATO, String TI_TRABAJADOR,
            String LI_REGIMEN_LABORAL, String ES_DISCAPACIDAD, String TI_CONTRATO, String LI_REGIMEN_PENSIONARIO,
            String ES_CONTRATO_TRABAJADOR, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF,
            String US_IP, String FE_VACACIO_INI, String FE_VACACIO_FIN, String ES_CONTRATO, String ID_FILIAL,
            String ID_PUESTO, double CA_BONO_ALIMENTO, String LI_TIPO_CONVENIO, String ES_FIRMO_CONTRATO,
            double NU_CONTRATO, String DE_OBSERVACION, String ES_APOYO, String TI_HORA_PAGO, String NU_DOCUMENTO,
            String ES_ENTREGAR_DOC_REGLAMENTOS, String ES_REGISTRO_HUELLA, String DE_REGISTRO_SISTEM_REMU,
            String ID_TRABAJADOR, double CA_SUELDO_TOTAL, String ID_REGIMEN_LABORAL, String ID_MODALIDAD,
            String ID_SUB_MODALIDAD, String CO_GR_OCUPACION, String FE_SUSCRIPCION, String CO_TI_MONEDA,
            String CO_TI_REM_VARIAB, String DE_REMU_ESPECIE, String DE_RUC_EMP_TRAB, String CO_SUCURSAL,
            String DE_MYPE, String ES_TI_CONTRATACION, double CA_BEV, String ID_TIPO_PLANILLA,
            String ES_REMUNERACION_PROCESADO, String ID_HORARIO, String ID_PLANTILLA_CONTRACTUAL,
            double ca_bonificacion_p, String ES_MFL, String PRACTICANTE, String situacionEspecial) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_CONTRATO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,? ,?,?)} ");
            cst.setString(1, null);
            cst.setString(2, ID_DGP);
            cst.setString(3, DateFormat.toFormat1(FE_DESDE));
            if (FE_HASTA == null) {
                cst.setString(4, "");
                System.out.println("enter to null condition");

            } else {
                cst.setString(4, DateFormat.toFormat1(FE_HASTA));
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
            cst.setString(38, ES_ENTREGAR_DOC_REGLAMENTOS);
            cst.setString(39, ES_REGISTRO_HUELLA);
            cst.setString(40, DE_REGISTRO_SISTEM_REMU);
            cst.setString(41, ID_TRABAJADOR);
            cst.setDouble(42, CA_SUELDO_TOTAL);
            cst.setString(43, ID_REGIMEN_LABORAL);
            cst.setString(44, ID_MODALIDAD);
            cst.setString(45, ID_SUB_MODALIDAD);
            cst.setString(46, CO_GR_OCUPACION);
            cst.setString(47, DateFormat.toFormat1(FE_SUSCRIPCION));
            cst.setString(48, CO_TI_MONEDA);
            cst.setString(49, CO_TI_REM_VARIAB);
            cst.setString(50, DE_REMU_ESPECIE);
            cst.setString(51, DE_RUC_EMP_TRAB);
            cst.setString(52, CO_SUCURSAL);
            cst.setString(53, DE_MYPE);
            cst.setString(54, ES_TI_CONTRATACION);
            cst.setDouble(55, CA_BEV);
            cst.setString(56, ID_TIPO_PLANILLA);
            cst.setString(57, "0");
            cst.setString(58, ID_HORARIO.trim());
            cst.setString(59, ID_PLANTILLA_CONTRACTUAL);
            cst.setDouble(60, ca_bonificacion_p);
            cst.setString(61, ES_MFL);
            cst.setString(62, PRACTICANTE);
            cst.setString(63, situacionEspecial);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
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
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
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
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
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
    public void Venc_Cont() {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            this.conn.ejecutar(" begin venc_contrato; end;");
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public List<Modalidad> List_modalidad() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = " select * from  RHTX_MODALIDAD order by DE_MODALIDAD ";
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
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
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
    public List<Regimen_Laboral> list_reg_labo() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = " select * from  RHTX_REGIMEN_LABORAL order by DE_REGIMEN_L";
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
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
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
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
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
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return id_Tr;
    }

    @Override
    public String Contrato_max(String id_tr) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT ID_CONTRATO FROM RHTM_CONTRATO WHERE ID_CONTRATO=  (SELECT 'CTO-'||lpad(TO_CHAR(MAX(TO_NUMBER(SUBSTR(ID_CONTRATO,5,8)))),6,'0') FROM RHTM_CONTRATO  WHERE  ID_TRABAJADOR='" + id_tr + "')";
        String id = null;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                id = rs.getString(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return id;
    }

    @Override
    public List<X_List_Id_Contrato_DGP> List_contra_x_idcto(String id_cto) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
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
                v.setEs_secre_is(rs.getString("es_secre_is"));
                v.setLi_religion(rs.getString("li_religion"));
                v.setPracticante(rs.getString("practicante"));
                v.setIdSituacionEspecial(rs.getString("id_situacion_especial"));
                v.setDeSituacionEspecial(rs.getString("de_situacion_especial"));
                list.add(v);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al insertar archivo : " + e);
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
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
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
        String sql = "select * from RHVD_LIST_EMPLEADO where ID_TRABAJADOR IN (select DISTINCT ID_TRABAJADOR from RHTM_CONTRATO where ID_DGP is null ) and  to_char(FE_CREACION_CONTRATO,'yy')  = to_char(sysdate,'yy')";
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
                v.setId_contrato(rs.getString("id_contrato"));
                list.add(v);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
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
    public List<Map<String, ?>> Listar_Contratos(String de, String al, String direccion, String dep, String area, String sec, String puesto, String sueldo_total, String nombre, String fe_i, String fe_fin, String fe_sus, String id_dep_ses) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select  *  from RHVD_FILTRO_CONTRATO_TERMINADO WHERE FE_CREACION IS NOT NULL ";
            if (!de.equals("") || !al.equals("") || !fe_i.equals("") || !fe_fin.equals("") || !fe_sus.equals("")) {//si busca por fecha
                if (!de.equals("") && !al.equals("")) {
                    sql += "AND FE_CREACION BETWEEN '" + DateFormat.toFormat1(de) + "' AND '" + DateFormat.toFormat1(al) + "' ";
                }
                if (!fe_i.equals("") && !fe_fin.equals("")) {
                    sql += "AND FE_DESDE >= '" + DateFormat.toFormat1(fe_i) + "' AND FE_HASTA <='" + DateFormat.toFormat1(fe_fin) + "' ";
                } else {
                    if (!fe_i.equals("")) {
                        sql += "AND FE_DESDE BETWEEN '" + DateFormat.toFormat1(fe_i) + "' AND (select SYSDATE from dual) ";
                    }
                    if (!fe_fin.equals("")) {
                        sql += "AND FE_HASTA BETWEEN (SELECT MIN(FE_DESDE) AND '" + DateFormat.toFormat1(fe_fin) + "' ";
                    }
                }
                if (!fe_sus.equals("")) {
                    sql += "AND FE_SUSCRIPCION = '" + DateFormat.toFormat1(fe_sus) + "' ";
                }

            }
            if (direccion != null) {
                if (!id_dep_ses.equals("")) {
                    if (!id_dep_ses.trim().equals("DPT-0019")) {
                        sql += (!id_dep_ses.equals("")) ? " and ID_DEPARTAMENTO= '" + id_dep_ses.trim() + "'" : "";
                    } else {
                        sql += (!direccion.equals("")) ? " AND ID_DIRECCION = '" + direccion.trim() + "'" : "";
                        sql += (!dep.equals("")) ? " and ID_DEPARTAMENTO= '" + dep.trim() + "'" : "";
                    }
                }
                sql += (!area.equals("")) ? " and ID_AREA= '" + area.trim() + "'" : "";
                sql += (!sec.equals("")) ? " and ID_SECCION= '" + sec.trim() + "'" : "";
                sql += (!sueldo_total.equals("")) ? " and CA_SUELDO_TOTAL= '" + sueldo_total.trim() + "'" : "";
                sql += (!puesto.equals("")) ? " and ID_PUESTO= '" + puesto.trim() + "'" : "";

            }
            if (!nombre.equals("") || !sueldo_total.equals("")) {//si busca por datos del trabajador
                if (!sueldo_total.equals("")) {
                    sql += " and CA_SUELDO_TOTAL=" + sueldo_total;
                }
                sql += (!nombre.equals("")) ? " AND  UPPER(NO_AP)  like '%" + nombre.toUpperCase() + "%'" : "";
            }
            System.out.println(sql);
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
                rec.put("fe_su", rs.getString("FE_SUSCRIPCION"));
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
            String sql = "SELECT rhfu_print_func_pri(h.ID_PUESTO) as func1,rhfu_print_func_sec(h.ID_PUESTO)as func2,h.* FROM RHVD_CONTRATOS_HISTORIAL h WHERE h.ID_CONTRATO='" + id_ctos.trim() + "'";
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
                rec.put("ca_sueldo_basico", rs.getString("ca_sueldo"));
                rec.put("ca_st", rs.getString("ca_sueldo_total"));
                rec.put("nu_ho", rs.getString("nu_horas_lab"));
                rec.put("co_tm", rs.getString("co_ti_moneda"));
                rec.put("id_pu", rs.getString("id_puesto"));
                rec.put("id_fu_1", rs.getString("func1"));
                rec.put("id_fu_2", rs.getString("func2"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
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
    public List<Contrato_Adjunto> List_doc_Contrato(String id_ctro) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHTV_CONTRATO_ADJUNTO where ID_CONTRATO='" + id_ctro.trim() + "'";
        List<Contrato_Adjunto> list = new ArrayList<Contrato_Adjunto>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Contrato_Adjunto v = new Contrato_Adjunto();
                v.setId_contrato_adjunto(rs.getString("ID_CONTRATO_ADJUNTO"));
                v.setId_contrato(rs.getString("ID_CONTRATO"));
                v.setNo_archivo(rs.getString("NO_ARCHIVO"));
                v.setNo_archivo_original(rs.getString("NO_ARCHIVO_ORIGINAL"));
                v.setEs_archivo_adjunto(rs.getString("Es_archivo_adjunto"));
                v.setFe_creacion(rs.getString("FE_CREACION"));
                list.add(v);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
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
    public int Count_doc_con(String id_ctro) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT COUNT(*) FROM RHTV_CONTRATO_ADJUNTO where ID_CONTRATO='" + id_ctro.trim() + "' and ES_CONTRATO_ADJUNTO='1'";
        int validar = 0;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                validar = rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return validar;
    }

    @Override
    public void Eliminar_Contratos_firmados(String id_contrato) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_DELETE_CONTRATOS_SUBIDOS(?)}");
            cst.setString(1, id_contrato.trim());
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public List<V_Contrato_dgp> List_contrato(String id_contrato) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHVD_CONTRATO_DGP where ID_CONTRATO='" + id_contrato.trim() + "'";
        List<V_Contrato_dgp> list = new ArrayList<V_Contrato_dgp>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_Contrato_dgp v = new V_Contrato_dgp();
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setCa_asig_familiar(rs.getDouble("ca_asig_familiar"));
                v.setCa_bev(rs.getDouble("ca_bev"));
                v.setCa_bonificacion_p(rs.getDouble("ca_bonificacion_p"));
                v.setCa_bono_alimento(rs.getDouble("ca_bono_alimento"));
                v.setCa_reintegro(rs.getDouble("ca_reintegro"));
                v.setCa_sueldo(rs.getDouble("ca_sueldo"));
                v.setCa_sueldo_total(rs.getDouble("ca_sueldo_total"));
                v.setCo_sucursal(rs.getString("co_sucursal"));
                v.setCo_ti_moneda(rs.getString("co_ti_moneda"));
                v.setCo_ti_rem_variab(rs.getString("co_ti_rem_variab"));
                v.setDe_grupo_ocupacion(rs.getString("de_grupo_ocupacion"));
                v.setDe_modalidad(rs.getString("de_modalidad"));
                v.setDe_mype(rs.getString("de_mype"));
                v.setDe_observacion(rs.getString("de_observacion"));
                v.setDe_registro_sistem_remu(rs.getString("de_registro_sistem_remu"));
                v.setDe_remu_especie(rs.getString("de_remu_especie"));
                v.setDe_ruc_emp_trab(rs.getString("de_ruc_emp_trab"));
                v.setDe_sub_modalidad(rs.getString("de_sub_modalidad"));
                v.setDia_contrato(rs.getDouble("dia_contrato"));
                v.setDi_dom_a_d2(rs.getString("di_dom_a_d2"));
                v.setDi_dom_a_d4(rs.getString("di_dom_a_d4"));
                v.setDi_dom_a_d6(rs.getString("di_dom_a_d6"));
                v.setEs_apoyo(rs.getString("es_apoyo"));
                v.setEs_contrato(rs.getString("es_contrato"));
                v.setEs_contrato_trabajador(rs.getString("es_contrato_trabajador"));
                v.setEs_discapacidad(rs.getString("es_discapacidad"));
                v.setEs_entregar_doc_reglamentos(rs.getString("es_entregar_doc_reglamentos"));
                v.setEs_firmo_contrato(rs.getString("es_firmo_contrato"));
                v.setEs_registro_huella(rs.getString("es_registro_huella"));
                v.setEs_ti_contratacion(rs.getString("es_ti_contratacion"));
                v.setFe_cese(rs.getString("fe_cese"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setFe_des(rs.getString("fe_des"));
                v.setFe_desde(rs.getString("fe_desde"));
                v.setFe_has(rs.getString("fe_has"));
                v.setFe_hasta(rs.getString("fe_hasta"));
                v.setFe_modif(rs.getString("fe_modif"));
                v.setFe_sus(rs.getString("fe_sus"));
                v.setFe_suscripcion(rs.getString("fe_suscripcion"));
                v.setFe_vacacio_fin(rs.getString("fe_vacacio_fin"));
                v.setFe_vacacio_ini(rs.getString("fe_vacacio_ini"));
                v.setHo_semana(rs.getDouble("ho_semana"));

                v.setId_area(rs.getString("id_area"));
                v.setId_contrato(rs.getString("id_contrato"));
                v.setId_departamento(rs.getString("id_departamento"));
                v.setId_dgp(rs.getString("id_dgp"));
                v.setId_direccion(rs.getString("id_direccion"));
                v.setId_filial(rs.getString("id_filial"));
                v.setId_func(rs.getString("id_func"));
                v.setId_grupo_ocupacion(rs.getString("id_grupo_ocupacion"));
                v.setId_plantilla_contractual(rs.getString("id_plantilla_contractual"));
                v.setId_puesto(rs.getString("id_puesto"));
                v.setId_regimen_laboral(rs.getString("id_regimen_laboral"));
                v.setId_seccion(rs.getString("id_seccion"));
                v.setId_sub_modalidad(rs.getString("id_sub_modalidad"));
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setLi_condicion(rs.getString("li_condicion"));
                v.setLi_di_dom_a_d1(rs.getString("li_di_dom_a_d1"));
                v.setLi_di_dom_a_d3(rs.getString("li_di_dom_a_d3"));
                v.setLi_di_dom_a_d5(rs.getString("li_di_dom_a_d5"));
                v.setLi_motivo(rs.getString("li_motivo"));
                v.setLi_regimen_laboral(rs.getString("li_regimen_laboral"));
                v.setLi_regimen_pensionario(rs.getString("li_regimen_pensionario"));
                v.setLi_tipo_convenio(rs.getString("li_tipo_convenio"));
                v.setNo_area(rs.getString("no_area"));
                v.setNo_dep(rs.getString("no_dep"));
                v.setNo_direccion(rs.getString("no_direccion"));
                v.setNo_distrito(rs.getString("no_distrito"));
                v.setNo_provincia(rs.getString("no_provincia"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setNo_seccion(rs.getString("no_seccion"));
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setNu_contrato(rs.getDouble("nu_contrato"));
                v.setNu_documento(rs.getString("nu_documento"));
                v.setNu_horas_lab(rs.getDouble("nu_horas_lab"));
                v.setTi_contrato(rs.getString("ti_contrato"));
                v.setTi_hora_pago(rs.getString("ti_hora_pago"));
                v.setTi_trabajador(rs.getString("ti_trabajador"));
                v.setUs_creacion(rs.getString("us_creacion"));
                v.setUs_ip(rs.getString("us_ip"));
                v.setUs_modif(rs.getString("us_modif"));
                v.setEs_mfl(rs.getString("es_mfl"));
                v.setPracticante(rs.getString("practicante"));
                v.setDeSituacionEspecial(rs.getString("de_situacion_especial"));
                v.setIdSituacionEspecial(rs.getString("id_situacion_especial"));
                list.add(v);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
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
    public void MODIFICAR_CONTRATO(String ID_CONTRATO, String ID_DGP, String FE_DESDE, String FE_HASTA, String FE_CESE, String ID_FUNC, String LI_CONDICION, Double CA_SUELDO, Double CA_REINTEGRO,
            Double CA_ASIG_FAMILIAR, Double HO_SEMANA, Double NU_HORAS_LAB, Double DIA_CONTRATO, String TI_TRABAJADOR, String LI_REGIMEN_LABORAL, String ES_DISCAPACIDAD, String TI_CONTRATO,
            String LI_REGIMEN_PENSIONARIO, String ES_CONTRATO_TRABAJADOR, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String US_IP, String FE_VACACIO_INI, String FE_VACACIO_FIN, String ES_CONTRATO, String ID_FILIAL, String ID_PUESTO, Double CA_BONO_ALIMENTO, String LI_TIPO_CONVENIO, String ES_FIRMO_CONTRATO, Double NU_CONTRATO,
            String DE_OBSERVACION, String ES_APOYO, String TI_HORA_PAGO, String NU_DOCUMENTO, String ES_ENTREGAR_DOC_REGLAMENTOS, String ES_REGISTRO_HUELLA, String DE_REGISTRO_SISTEM_REMU,
            String ID_TRABAJADOR, Double CA_SUELDO_TOTAL, String ID_REGIMEN_LABORAL, String ID_MODALIDAD, String ID_SUB_MODALIDAD, String CO_GR_OCUPACION, String FE_SUSCRIPCION, String CO_TI_MONEDA,
            String CO_TI_REM_VARIAB, String DE_REMU_ESPECIE, String DE_RUC_EMP_TRAB, String CO_SUCURSAL, String DE_MYPE, String ES_TI_CONTRATACION, Double CA_BEV, String ID_TIPO_PLANILLA,
            String ES_REMUNERACION_PROCESADO, String ID_HORARIO, String ID_PLANTILLA_CONTRACTUAL, Double ca_bonificacion_p, String PRACTICANTE, String idSituacionEspecial) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_MODIF_CONTRATO( ?,?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,? ,?)} ");
            cst.setString(1, ID_CONTRATO);
            cst.setString(2, ID_DGP);
            cst.setString(3, DateFormat.toFormat1(FE_DESDE));
            if (FE_HASTA == null) {
                cst.setString(4, "");
                System.out.println("enter to null condition");
            } else {
                cst.setString(4, DateFormat.toFormat1(FE_HASTA));
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

            cst.setString(38, ES_ENTREGAR_DOC_REGLAMENTOS);
            cst.setString(39, ES_REGISTRO_HUELLA);
            cst.setString(40, DE_REGISTRO_SISTEM_REMU);
            cst.setString(41, ID_TRABAJADOR);
            cst.setDouble(42, CA_SUELDO_TOTAL);
            cst.setString(43, ID_REGIMEN_LABORAL);
            cst.setString(44, ID_MODALIDAD);
            cst.setString(45, ID_SUB_MODALIDAD);
            cst.setString(46, CO_GR_OCUPACION);
            cst.setString(47, DateFormat.toFormat1(FE_SUSCRIPCION));
            cst.setString(48, CO_TI_MONEDA);
            cst.setString(49, CO_TI_REM_VARIAB);
            cst.setString(50, DE_REMU_ESPECIE);
            cst.setString(51, DE_RUC_EMP_TRAB);
            cst.setString(52, CO_SUCURSAL);
            cst.setString(53, DE_MYPE);
            cst.setString(54, ES_TI_CONTRATACION);
            cst.setDouble(55, CA_BEV);
            cst.setString(56, ID_TIPO_PLANILLA);
            cst.setString(57, "0");
            cst.setString(58, ID_HORARIO);
            cst.setString(59, ID_PLANTILLA_CONTRACTUAL);
            cst.setDouble(60, ca_bonificacion_p);
            cst.setString(61, PRACTICANTE);
            cst.setString(62, idSituacionEspecial);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (ParseException e) {
            throw new RuntimeException("Error :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public void VALIDAR_FE_CESE_CON() {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("UPDATE RHTM_CONTRATO SET ES_CONTRATO = '0' WHERE FE_CESE <= SYSDATE");
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
    public void HABILITAR_SI(String idc, String estado) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall(" {CALL RHSP_HABILITAR_SI( ?,?)}   ");
            cst.setString(1, idc);
            cst.setString(2, estado);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public void VALIDAR_FE_HASTA_CON() {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_VAL_ESTADO_CONTRATO}");
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al validar fecha hasta del contrato");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public void validar_contrato(String id_cto) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("UPDATE RHTM_CONTRATO SET ES_CONTRATO = '0' WHERE  ID_CONTRATO = '" + id_cto + "'");
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
    public boolean validar_editar_contrato(String iduser, String idcontrato) {
        boolean x = false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ResultSet rs = this.conn.query("select  count(*)  from RHTV_AUTORIZACION where US_CREACION ='" + iduser + "' and ID_DGP in (select ID_DGP from rhtm_contrato where ID_CONTRATO='" + idcontrato + "')");
            if (rs.next()) {
                x = (rs.getInt(1) == 0);
            }
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
        return x;
    }

    @Override
    public List<Contrato> ListaSelectorContrato(String id_trabajador) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT ID_CONTRATO ,  TO_CHAR(FE_DESDE,'dd/mm/yyyy') AS FE_DESDE,  TO_CHAR(FE_HASTA,'dd/mm/yyyy')   AS FE_HASTA FROM RHTM_CONTRATO  where ID_TRABAJADOR='" + id_trabajador + "'  order by TO_NUMBER(SUBSTR(ID_CONTRATO,5,8)) desc";
        List<Contrato> list = new ArrayList<Contrato>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Contrato v = new Contrato();
                v.setFe_desde(rs.getString("fe_desde"));
                v.setFe_hasta(rs.getString("fe_hasta"));
                v.setId_contrato(rs.getString("id_contrato"));
                list.add(v);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return list;

    }
}
