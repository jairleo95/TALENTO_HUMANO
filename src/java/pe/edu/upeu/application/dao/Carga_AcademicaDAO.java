/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.dao_imp.InterfaceCarga_AcademicaDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Carga_Academica;
import pe.edu.upeu.application.model.V_Detalle_Carga_Academica;
import pe.edu.upeu.application.web.controller.CConversion;

/**
 *
 * @author ALFA 3
 */
public class Carga_AcademicaDAO implements InterfaceCarga_AcademicaDAO {

    ConexionBD conn;
    CConversion c = new CConversion();

    @Override
    public String DNI_ID_TRABAJADOR(String dni) {

        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String idtr = "";
        String sql = "select *  from rhtm_trabajador  where  trim(NU_DOC)='" + dni.trim() + "'";

        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                idtr = rs.getString("id_trabajador");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR: " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());

            }
        }
        return idtr;

    }

    @Override
    public void INSERT_CARGA_ACADEMICA(String ID_CARGA_ACADEMICA, String ES_CARGA_ACADEMICA, String CAMPUS, String ES_TIPO_DOC, String NU_DOC, String AP_PATERNO, String AP_MATERNO, String NO_TRABAJADOR, String NO_FACULTAD, String NO_EAP, String DE_CARGA, String NO_CURSO, String NU_GRUPO, String DE_HORARIO, int CA_HLAB, String DE_CONDICION, String DE_TIPO_CURSO, String ES_PROCESADO, String FE_CREACION) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_CARGA_ACADEMICA( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )} ");
            cst.setString(1, null);
            cst.setString(2, null);
            cst.setString(3, CAMPUS);
            cst.setString(4, ES_TIPO_DOC);
            cst.setString(5, NU_DOC);
            cst.setString(6, AP_PATERNO);
            cst.setString(7, AP_MATERNO);
            cst.setString(8, NO_TRABAJADOR);
            cst.setString(9, NO_FACULTAD);
            cst.setString(10, NO_EAP);
            cst.setString(11, DE_CARGA);
            cst.setString(12, NO_CURSO);
            cst.setString(13, NU_GRUPO);
            cst.setString(14, DE_HORARIO);
            cst.setInt(15, CA_HLAB);
            cst.setString(16, DE_CONDICION);
            cst.setString(17, DE_TIPO_CURSO);
            cst.setString(18, ES_PROCESADO);
            cst.setString(19, null);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR: " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());

            }
        }
    }

    @Override
    public String INSERT_DGP(String ID_DGP, String FE_DESDE, String FE_HASTA, double CA_SUELDO, String DE_DIAS_TRABAJO, String ID_PUESTO, String ID_REQUERIMIENTO, String ID_TRABAJADOR, String CO_RUC, String DE_LUGAR_SERVICIO, String DE_SERVICIO, String DE_PERIODO_PAGO, String DE_DOMICILIO_FISCAL, String DE_SUBVENCION, String DE_HORARIO_CAPACITACION, String DE_HORARIO_REFRIGERIO, String DE_DIAS_CAPACITACION, String ES_DGP, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, double CA_BONO_ALIMENTARIO, double DE_BEV, String DE_ANTECEDENTES_POLICIALES, String ES_CERTIFICADO_SALUD, String DE_MONTO_HONORARIO, String FE_CESE, String FE_RECEPCION, String MO_RENUNCIA, double DI_ADQUIRIDOS, double DI_CONSUMIDOS, double DI_POR_CONSUMIR, String ES_VACACIONES, String LI_MOTIVO, String ES_MFL, double CA_BONIFICACION_P) {
        String id = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_PROCESO_CA_DGP( ?, ?, ?, ?, ?,  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,? )} ");
            cst.setString(1, null);
            cst.setString(2, c.convertFecha(FE_DESDE));
            cst.setString(3, c.convertFecha(FE_HASTA));
            cst.setDouble(4, 0.0);
            cst.setString(5, DE_DIAS_TRABAJO);
            cst.setString(6, ID_PUESTO);
            cst.setString(7, ID_REQUERIMIENTO);
            cst.setString(8, ID_TRABAJADOR);
            cst.setString(9, CO_RUC);
            cst.setString(10, DE_LUGAR_SERVICIO);
            cst.setString(11, DE_SERVICIO);
            cst.setString(12, DE_PERIODO_PAGO);
            cst.setString(13, DE_DOMICILIO_FISCAL);
            cst.setString(14, DE_SUBVENCION);
            cst.setString(15, DE_HORARIO_CAPACITACION);
            cst.setString(16, DE_HORARIO_REFRIGERIO);
            cst.setString(17, DE_DIAS_CAPACITACION);
            cst.setString(18, ES_DGP);
            cst.setString(19, US_CREACION);
            cst.setString(20, FE_CREACION);
            cst.setString(21, US_MODIF);
            cst.setString(22, FE_MODIF);
            cst.setString(23, IP_USUARIO);
            cst.setDouble(24, 0.0);
            cst.setDouble(25, 0.0);
            cst.setString(26, DE_ANTECEDENTES_POLICIALES);
            cst.setString(27, ES_CERTIFICADO_SALUD);
            cst.setString(28, DE_MONTO_HONORARIO);
            cst.setString(29, FE_CESE);
            cst.setString(30, FE_RECEPCION);
            cst.setString(31, MO_RENUNCIA);
            cst.setInt(32, 0);
            cst.setInt(33, 0);
            cst.setInt(34, 0);
            cst.setString(35, ES_VACACIONES);
            cst.setString(36, LI_MOTIVO);
            cst.setString(37, ES_MFL);
            cst.setDouble(38, CA_BONIFICACION_P);
            //  cst.setString(39, ID_PROCESO_CARGA_AC);
            cst.registerOutParameter(39, Types.CHAR);
            cst.execute();
            id = cst.getString(39);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
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
    public String INSERT_PROCESO_CARGA_ACADEMICA(String ID_PROCESO_CARGA_AC, String ES_PROCESO_CARGA_AC, double CA_TIPO_HORA_PAGO, double CA_TOTAL_HL, String FE_DESDE, String FE_HASTA, String ES_PROCESADO, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, String NO_USUARIO, String ID_DGP) {
        String id = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_PROCESO_CARGA_AC( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,? )} ");
            cst.setString(1, null);
            cst.setString(2, null);
            cst.setDouble(3, CA_TIPO_HORA_PAGO);
            cst.setDouble(4, CA_TOTAL_HL);
            cst.setString(5, c.convertFecha(FE_DESDE));
            cst.setString(6, c.convertFecha(FE_HASTA));
            cst.setString(7, ES_PROCESADO);
            cst.setString(8, US_CREACION);
            cst.setString(9, null);
            cst.setString(10, US_MODIF);
            cst.setString(11, FE_MODIF);
            cst.setString(12, IP_USUARIO);
            cst.setString(13, NO_USUARIO);
            cst.setString(14, ID_DGP);
            cst.registerOutParameter(15, Types.CHAR);
            cst.execute();
            id = cst.getString(15);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
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
    public List<Carga_Academica> ListCarAca() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHVD_CARGA_ACADEMICA";
        List<Carga_Academica> list = new ArrayList<Carga_Academica>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Carga_Academica ca = new Carga_Academica();
                ca.setId_situacion_educativa(rs.getString("id_situacion_educativa"));
                ca.setNo_s_educativa(rs.getString("no_s_educativa"));
                ca.setProfesion_docente(rs.getString("profesion_docente"));
                ca.setFe_desde(rs.getString("fe_desde"));
                ca.setFe_hasta(rs.getString("fe_hasta"));
                ca.setFe_creacion(rs.getString("fe_creacion"));
                ca.setId_trabajador(rs.getString("id_trabajador"));
                ca.setNu_doc(rs.getString("nu_doc"));
                ca.setEs_tipo_doc(rs.getString("es_tipo_doc"));
                ca.setNo_trabajador(rs.getString("no_trabajador"));
                ca.setAp_paterno(rs.getString("ap_paterno"));
                ca.setAp_materno(rs.getString("ap_materno"));
                ca.setNo_eap(rs.getString("no_eap"));
                ca.setNo_facultad(rs.getString("no_facultad"));
                ca.setDe_condicion(rs.getString("de_condicion"));
                ca.setDe_carga(rs.getString("de_carga"));
                ca.setId_proceso_carga_ac(rs.getString("id_proceso_carga_ac"));
                list.add(ca);
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
    public String INSERT_DETALLE_CARGA_ACADEMICA(String ID_DETALLE_CARGA_ACADEMICA, String ID_PROCESO_CARGA_AC, String ID_CARGA_ACADEMICA, String ES_DETALLE_CARGA) {
        String id = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_DETALLE_CARGA_ACA( ?, ?, ?, ?,? )} ");
            cst.setString(1, null);
            cst.setString(2, ID_PROCESO_CARGA_AC);
            cst.setString(3, ID_CARGA_ACADEMICA);
            cst.setString(4, null);
            cst.registerOutParameter(5, Types.CHAR);
            cst.execute();
            id = cst.getString(5);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
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
    public String INSERT_CARGA_ACADEMICA(String ID_CARGA_ACADEMICA, String ES_CARGA_ACADEMICA, String CAMPUS, String ES_TIPO_DOC, String NU_DOC, String AP_PATERNO, String AP_MATERNO, String NO_TRABAJADOR, String NO_FACULTAD, String NO_EAP, String DE_CARGA, String NO_CURSO, String NU_GRUPO, String DE_HORARIO, double CA_HLAB, String DE_CONDICION, String DE_TIPO_CURSO, String ES_PROCESADO, String FE_CREACION, String ID_PROCESO_CARGA_AC) {
        String id = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_RHTM_CARGA_ACADEMICA( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,? )} ");
            cst.setString(1, null);
            cst.setString(2, null);
            cst.setString(3, CAMPUS);
            cst.setString(4, ES_TIPO_DOC);
            cst.setString(5, NU_DOC);
            cst.setString(6, AP_PATERNO);
            cst.setString(7, AP_MATERNO);
            cst.setString(8, NO_TRABAJADOR);
            cst.setString(9, NO_FACULTAD);
            cst.setString(10, NO_EAP);
            cst.setString(11, DE_CARGA);
            cst.setString(12, NO_CURSO);
            cst.setString(13, NU_GRUPO);
            cst.setString(14, DE_HORARIO);
            cst.setDouble(15, CA_HLAB);
            cst.setString(16, DE_CONDICION);
            cst.setString(17, DE_TIPO_CURSO);
            cst.setString(18, ES_PROCESADO);
            cst.setString(19, FE_CREACION);
            cst.setString(20, ID_PROCESO_CARGA_AC);
            cst.registerOutParameter(21, Types.CHAR);
            cst.execute();
            id = cst.getString(21);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
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
    public String INSERT_PAGO_DOCENTE(String ID_PAGO_DOCENTE, String NU_CUOTA, double CA_CUOTA, String FE_PAGO, String ES_PAGO_DOCENTE, String ID_PROCESO_CARGA_AC, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, String NO_USUARIO) {
        String id = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_PAGO_DOCENTE( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,? )} ");
            cst.setString(1, null);
            cst.setString(2, NU_CUOTA);
            cst.setDouble(3, CA_CUOTA);
            cst.setString(4, FE_PAGO);
            //cst.setString(4, "27/02/15");
            cst.setString(5, ES_PAGO_DOCENTE);
            cst.setString(6, ID_PROCESO_CARGA_AC);
            cst.setString(7, null);
            cst.setString(8, US_MODIF);
            cst.setString(9, FE_MODIF);
            cst.setString(10, IP_USUARIO);
            cst.setString(11, NO_USUARIO);
            cst.registerOutParameter(12, Types.CHAR);
            cst.execute();
            id = cst.getString(12);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
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
    public List<V_Detalle_Carga_Academica> Lista_detalle_academico(String idtr, String facultad, String eap) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHVD_DETALLE_CARGA_ACADEMICA WHERE TRIM(ID_TRABAJADOR)= '" + idtr.trim() + "' AND TRIM(NO_FACULTAD) ='" + facultad.trim() + "' AND TRIM(NO_EAP)='" + eap.trim() + "' ";
        List<V_Detalle_Carga_Academica> list = new ArrayList<V_Detalle_Carga_Academica>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_Detalle_Carga_Academica ca = new V_Detalle_Carga_Academica();
                ca.setId_carga_academica(rs.getString("id_carga_academica"));
                ca.setEs_carga_academica(rs.getString("es_carga_academica"));
                ca.setCampus(rs.getString("campus"));
                ca.setEs_tipo_doc(rs.getString("es_tipo_doc"));
                ca.setNu_doc(rs.getString("nu_doc"));
                ca.setAp_paterno(rs.getString("ap_paterno"));
                ca.setAp_materno(rs.getString("ap_materno"));
                ca.setNo_trabajador(rs.getString("no_trabajador"));
                ca.setNo_facultad(rs.getString("no_facultad"));
                ca.setNo_eap(rs.getString("no_eap"));
                ca.setDe_carga(rs.getString("de_carga"));
                ca.setNo_curso(rs.getString("no_curso"));
                ca.setNu_grupo(rs.getString("nu_grupo"));
                ca.setDe_horario(rs.getString("de_horario"));
                ca.setCa_hlab(rs.getDouble("ca_hlab"));
                ca.setDe_condicion(rs.getString("de_condicion"));
                ca.setDe_tipo_curso(rs.getString("de_tipo_curso"));
                ca.setEs_procesado(rs.getString("es_procesado"));
                ca.setFe_creacion(rs.getString("fe_creacion"));
                ca.setCa_tipo_hora_pago_refeerencial(rs.getString("ca_tipo_hora_pago_refeerencial"));
                ca.setId_trabajador(rs.getString("id_trabajador"));
                list.add(ca);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
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
    public void PROCESAR_CARGA_ACADEMICA(String id_proceso, String iddgp) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL PROCESAR_CARGA_ACADEMICA( ?, ? )} ");
            cst.setString(1, id_proceso);
            cst.setString(2, iddgp.trim());
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }

    }

    @Override
    public List<Map<String, ?>> Cuotas_Pago_Docente(String fe_desde, String fe_hasta, double pago_semanal) {

        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select html  from table(rhfu_cuotas_docente(to_date('" + fe_desde + "','dd/mm/yyyy'),to_date('" + fe_hasta + "','dd/mm/yyyy')," + pago_semanal + "))";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("html", rs.getString("html"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR!");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return lista;
    }

    @Override
    public List<Map<String, ?>> List_Carga_Academica_WS(String semestre) {

        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT cat.NU_DOC, cat.AP_PATERNO , cat.AP_MATERNO , cat.NO_TRABAJADOR, cat.NO_FACULTAD,cat.DE_CARGA "
                    + "FROM RHTM_CARGA_ACADEMICA_TEMP cat "
                    + "WHERE cat.DE_CARGA = '" + semestre + "'"
                    + "GROUP BY cat.NU_DOC, cat.AP_PATERNO , cat.AP_MATERNO , cat.NO_TRABAJADOR, cat.NO_FACULTAD,cat.DE_CARGA "
                    + "ORDER BY cat.NU_DOC, cat.AP_PATERNO , cat.AP_MATERNO , cat.NO_TRABAJADOR, cat.NO_FACULTAD,cat.DE_CARGA ASC";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> cd = new HashMap<String, Object>();
                cd.put("NU_DOC", rs.getString("NU_DOC"));
                cd.put("AP_PATERNO", rs.getString("AP_PATERNO"));
                cd.put("AP_MATERNO", rs.getString("AP_MATERNO"));
                cd.put("NO_TRABAJADOR", rs.getString("NO_TRABAJADOR"));
                cd.put("NO_FACULTAD", rs.getString("NO_FACULTAD"));
                cd.put("DE_CARGA", rs.getString("DE_CARGA"));
                lista.add(cd);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR!");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return lista;
    }

    @Override
    public List<Map<String, ?>> actualizar_Carga_Academica(String semestre) {
        List<Map<String, ?>> lista = new ArrayList<>();
        List<Map<String, ?>> temp1 = new ArrayList<>();
        List<Map<String, ?>> temp = new ArrayList<>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT * FROM RHTM_CARGA_ACADEMICA_TEMP";
            String sql1 = "SELECT * FROM RHTM_CARGA_ACADEMICA_TEMP1";
            ResultSet rs = this.conn.query(sql);
            ResultSet rs1 = this.conn.query(sql1);
            while (rs.next()) {
                Map<String, Object> cd = new HashMap<>();
                cd.put("CAMPUS", rs.getString("CAMPUS"));
                cd.put("ES_TIPO_DOC", rs.getString("ES_TIPO_DOC"));
                cd.put("NU_DOC", rs.getString("NU_DOC"));
                cd.put("AP_PATERNO", rs.getString("AP_PATERNO"));
                cd.put("AP_MATERNO", rs.getString("AP_MATERNO"));
                cd.put("NO_TRABAJADOR", rs.getString("NO_TRABAJADOR"));
                cd.put("NO_FACULTAD", rs.getString("NO_FACULTAD"));
                cd.put("NO_EAP", rs.getString("NO_EAP"));
                cd.put("DE_CARGA", rs.getString("DE_CARGA"));
                cd.put("NO_CURSO", rs.getString("NO_CURSO"));
                cd.put("NU_GRUPO", rs.getString("NU_GRUPO"));
                cd.put("DE_HORARIO", rs.getString("DE_HORARIO"));
                cd.put("CA_HLAB", rs.getString("CA_HLAB"));
                cd.put("DE_CONDICION", rs.getString("DE_CONDICION"));
                cd.put("DE_TIPO_CURSO", rs.getString("DE_TIPO_CURSO"));
                temp.add(cd);
            }
            while (rs1.next()) {
                Map<String, Object> cd1 = new HashMap<>();
                cd1.put("CAMPUS", rs1.getString("CAMPUS"));
                cd1.put("ES_TIPO_DOC", rs1.getString("ES_TIPO_DOC"));
                cd1.put("NU_DOC", rs1.getString("NU_DOC"));
                cd1.put("AP_PATERNO", rs1.getString("AP_PATERNO"));
                cd1.put("AP_MATERNO", rs1.getString("AP_MATERNO"));
                cd1.put("NO_TRABAJADOR", rs1.getString("NO_TRABAJADOR"));
                cd1.put("NO_FACULTAD", rs1.getString("NO_FACULTAD"));
                cd1.put("NO_EAP", rs1.getString("NO_EAP"));
                cd1.put("DE_CARGA", rs1.getString("DE_CARGA"));
                cd1.put("NO_CURSO", rs1.getString("NO_CURSO"));
                cd1.put("NU_GRUPO", rs1.getString("NU_GRUPO"));
                cd1.put("DE_HORARIO", rs1.getString("DE_HORARIO"));
                cd1.put("CA_HLAB", rs1.getString("CA_HLAB"));
                cd1.put("DE_CONDICION", rs1.getString("DE_CONDICION"));
                cd1.put("DE_TIPO_CURSO", rs1.getString("DE_TIPO_CURSO"));
                temp1.add(cd1);
            }
            rs.close();
            rs1.close();
            //CONPARAR
            if (!temp1.isEmpty()) {
                for (int i = 0; i < temp1.size(); i++) {
                    String arr1[] = new String[15];
                    String arr2[] = new String[15];
                    arr1[0] = temp1.get(i).get("CAMPUS").toString();
                    arr1[1] = temp1.get(i).get("ES_TIPO_DOC").toString();
                    arr1[2] = temp1.get(i).get("NU_DOC").toString();
                    arr1[3] = temp1.get(i).get("AP_PATERNO").toString();
                    arr1[4] = temp1.get(i).get("AP_MATERNO").toString();
                    arr1[5] = temp1.get(i).get("NO_TRABAJADOR").toString();
                    arr1[6] = temp1.get(i).get("NO_FACULTAD").toString();
                    arr1[7] = temp1.get(i).get("NO_EAP").toString();
                    arr1[8] = temp1.get(i).get("DE_CARGA").toString();
                    arr1[9] = temp1.get(i).get("NO_CURSO").toString();
                    arr1[10] = temp1.get(i).get("NU_GRUPO").toString();
                    arr1[11] = temp1.get(i).get("DE_HORARIO").toString();
                    arr1[12] = temp1.get(i).get("CA_HLAB").toString();
                    arr1[13] = temp1.get(i).get("DE_CONDICION").toString();
                    arr1[14] = temp1.get(i).get("DE_TIPO_CURSO").toString();

                    if (!temp.isEmpty()) {
                        int nivel_s = 0;
                        for (int j = 0; j < temp.size(); j++) {
                            arr2[0] = temp.get(j).get("CAMPUS").toString();
                            arr2[1] = temp.get(j).get("ES_TIPO_DOC").toString();
                            arr2[2] = temp.get(j).get("NU_DOC").toString();
                            arr2[3] = temp.get(j).get("AP_PATERNO").toString();
                            arr2[4] = temp.get(j).get("AP_MATERNO").toString();
                            arr2[5] = temp.get(j).get("NO_TRABAJADOR").toString();
                            arr2[6] = temp.get(j).get("NO_FACULTAD").toString();
                            arr2[7] = temp.get(j).get("NO_EAP").toString();
                            arr2[8] = temp.get(j).get("DE_CARGA").toString();
                            arr2[9] = temp.get(j).get("NO_CURSO").toString();
                            arr2[10] = temp.get(j).get("NU_GRUPO").toString();
                            arr2[11] = temp.get(j).get("DE_HORARIO").toString();
                            arr2[12] = temp.get(j).get("CA_HLAB").toString();
                            arr2[13] = temp.get(j).get("DE_CONDICION").toString();
                            arr2[14] = temp.get(j).get("DE_TIPO_CURSO").toString();
                            for (int k = 0; k < arr1.length; k++) {
                                if (arr1[k].equals(arr2[k])) {
                                    nivel_s = nivel_s + 1;
                                }
                            }
                            if (nivel_s < arr1.length) {
                                Map<String, Object> cd = new HashMap<>();
                                Map<String, Object> cd1 = new HashMap<>();
                                cd = (Map<String, Object>) temp.get(i);
                                cd1 = (Map<String, Object>) temp1.get(i);
                                cd1.put("NIVEL_S", nivel_s);
                                lista.add(cd);
                                lista.add(cd1);
                                temp1.remove(i);
                            }
                        }
                    }
                }
                if (!temp1.isEmpty()) {
                    for (int i = 0; i < temp1.size(); i++) {
                        lista.add(temp1.get(i));
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return lista;
    }

}
