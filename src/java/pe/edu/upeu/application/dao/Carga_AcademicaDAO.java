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
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;
import org.json.JSONArray;
import pe.edu.upeu.application.dao_imp.InterfaceCarga_AcademicaDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Carga_Academica;
import pe.edu.upeu.application.model.DGP;
import pe.edu.upeu.application.model.ProcesoCargaAcademica;
import pe.edu.upeu.application.model.V_Detalle_Carga_Academica;
import pe.edu.upeu.application.properties.UserMachineProperties;
import pe.edu.upeu.application.util.DateFormat;
import pe.edu.upeu.application.util.CCriptografiar;
import pe.edu.upeu.application.util.WebServiceClient;

/**
 *
 * @author ALFA 3
 */
public class Carga_AcademicaDAO implements InterfaceCarga_AcademicaDAO {

    ConexionBD conn;
    DateFormat c = new DateFormat();

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
    public String insertDGP(DGP d) {
        String id = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_PROCESO_CA_DGP( ?, ?, ?, ?, ?,  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,? )} ");
            cst.setString(1, null);
            cst.setString(2, DateFormat.toFormat1(d.getFe_desde()));
            cst.setString(3, DateFormat.toFormat1(d.getFe_hasta()));
            cst.setDouble(4, 0.0);
            cst.setString(5, d.getDe_dias_trabajo());
            cst.setString(6, d.getId_puesto());
            cst.setString(7, d.getId_requerimiento());
            cst.setString(8, d.getId_trabajador());
            cst.setString(9, d.getCo_ruc());
            cst.setString(10, d.getDe_lugar_servicio());
            cst.setString(11, d.getDe_servicio());
            cst.setString(12, d.getDe_periodo_pago());
            cst.setString(13, d.getDe_domicilio_fiscal());
            cst.setString(14, d.getDe_subvencion());
            cst.setString(15, d.getDe_horario_capacitacion());
            cst.setString(16, d.getDe_horario_refrigerio());
            cst.setString(17, d.getDe_dias_capacitacion());
            cst.setString(18, d.getEs_dgp());
            cst.setString(19, d.getUs_creacion());
            cst.setString(20, d.getFe_creacion());
            cst.setString(21, d.getUs_modif());
            cst.setString(22, d.getFe_modif());
            cst.setString(23, UserMachineProperties.getAll());
            cst.setDouble(24, 0.0);
            cst.setDouble(25, 0.0);
            cst.setString(26, d.getDe_antecedentes_policiales());
            cst.setString(27, d.getDe_certificado_salud());
            cst.setString(28, d.getDe_monto_honorario());
            //cst.setString(29, FE_CESE);
            cst.setString(29, null);
            //cst.setString(30, FE_RECEPCION);
            cst.setString(30, null);
//            cst.setString(31, MO_RENUNCIA);
            cst.setString(31, null);
            cst.setInt(32, 0);
            cst.setInt(33, 0);
            cst.setInt(34, 0);
//            cst.setString(35, ES_VACACIONES);
            cst.setString(35, null);
//            cst.setString(36, LI_MOTIVO);
            cst.setString(36, null);
//            cst.setString(37, ES_MFL);
            cst.setString(37, null);
//            cst.setDouble(38, CA_BONIFICACION_P);
            cst.setDouble(38, 0.0);
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
    public String INSERT_PROCESO_CARGA_ACADEMICA(String ID_PROCESO_CARGA_AC, String ES_PROCESO_CARGA_AC, String CA_TIPO_HORA_PAGO, double CA_TOTAL_HL, String FE_DESDE, String FE_HASTA, String ES_PROCESADO, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, String NO_USUARIO, String ID_DGP) {
        String id = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_PROCESO_CARGA_AC( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,? )} ");
            cst.setString(1, null);
            cst.setString(2, null);
            cst.setString(3, CA_TIPO_HORA_PAGO);
            cst.setDouble(4, CA_TOTAL_HL);
            cst.setString(5, DateFormat.toFormat1(FE_DESDE));
            cst.setString(6, DateFormat.toFormat1(FE_HASTA));
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
        String sql = "SELECT * FROM RHVD_CARGA_ACADEMICA where es_procesado is null or es_procesado ='0'";
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
                ca.setId_trabajador(CCriptografiar.Encriptar(rs.getString("id_trabajador")));
                ca.setNu_doc(rs.getString("nu_doc"));
                ca.setEs_tipo_doc(rs.getString("es_tipo_doc"));
                ca.setNo_trabajador(rs.getString("no_trabajador"));
                ca.setAp_paterno(rs.getString("ap_paterno"));
                ca.setAp_materno(rs.getString("ap_materno"));
                ca.setNo_eap(rs.getString("no_eap"));
                ca.setNo_facultad(rs.getString("no_facultad"));
                ca.setDe_condicion(rs.getString("de_condicion").trim());
                ca.setDe_carga(rs.getString("de_carga").trim());
                ca.setId_proceso_carga_ac(CCriptografiar.Encriptar(rs.getString("id_proceso_carga_ac")));
                ca.setCountCursos(rs.getInt("countCursos"));
                ca.setValidateExistTrabajador(CCriptografiar.Encriptar(rs.getString("validateExistTrabajador")));
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
            cst.setString(4, DateFormat.toFormat1(FE_PAGO));
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
    public List<V_Detalle_Carga_Academica> Lista_detalle_academico(String idtr, String facultad, String eap, String ciclo, String dni) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHVD_DETALLE_CARGA_ACADEMICA WHERE campus is not null";
        sql += (idtr.equals("")) ? "" : " and TRIM(ID_TRABAJADOR)= '" + idtr + "' ";
        sql += (facultad.trim().equals("")) ? "" : " and TRIM(NO_FACULTAD)='" + facultad.trim() + "' ";
        sql += (eap.equals("")) ? "" : "  AND TRIM(NO_EAP)='" + eap.trim() + "' ";
        sql += (ciclo.trim().equals("")) ? "" : "  AND TRIM(DE_CARGA)='" + ciclo.trim() + "' ";
        sql += (dni.trim().equals("")) ? "" : "  AND TRIM(NU_DOC)='" + dni.trim() + "' ";
        List<V_Detalle_Carga_Academica> list = new ArrayList<V_Detalle_Carga_Academica>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_Detalle_Carga_Academica ca = new V_Detalle_Carga_Academica();
                ca.setId_carga_academica(CCriptografiar.Encriptar(rs.getString("id_carga_academica")));
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
                ca.setId_trabajador(CCriptografiar.Encriptar(rs.getString("id_trabajador")));
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
            throw new RuntimeException("Error!" + e.getMessage());
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
    public ProcesoCargaAcademica getProcesoCargaAcademciaById(String id) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select ID_PROCESO_CARGA_AC,ES_PROCESO_CARGA_AC,ID_TIPO_HORA_PAGO,CA_TOTAL_HL,to_char(FE_DESDE,'dd/mm/yyyy') as fe_desde ,to_char(FE_HASTA,'dd/mm/yyyy') as fe_hasta,ES_PROCESADO,ID_DGP from RHTM_PROCESO_CARGA_ACADEMICA where ID_PROCESO_CARGA_AC='" + id + "'";
        ProcesoCargaAcademica x = new ProcesoCargaAcademica();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                x.setIdProcesoCargaAc(CCriptografiar.Encriptar(rs.getString("ID_PROCESO_CARGA_AC")));
                x.setEsProcesoCargaAc(rs.getString("ES_PROCESO_CARGA_AC"));
                x.getIdTipoHoraPago().setIdTiHoraPago(CCriptografiar.Encriptar(rs.getString("ID_TIPO_HORA_PAGO")));
                x.setCaTotalHl(rs.getDouble("CA_TOTAL_HL"));
                x.setFeDesde(rs.getString("fe_desde"));
                x.setFeHasta(rs.getString("fe_hasta"));
                x.setEsProcesado(rs.getString("es_procesado"));
                x.getIdDgp().setId_dgp(CCriptografiar.Encriptar(rs.getString("id_dgp")));
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
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
    public String syncupCargaAcademica(String semestre, String methodProperties[]) {
        JSONArray arr = null;
        ConexionBD conn = null;
        String response = null;
        try {
            arr = WebServiceClient.getData(semestre, methodProperties);
            int length = arr.length();
            String[] campus = new String[length];
            String[] tipo_doc = new String[length];
            String[] nu_doc = new String[length];
            String[] app = new String[length];
            String[] apm = new String[length];
            String[] nombre = new String[length];
            String[] facu = new String[length];
            String[] eap = new String[length];
            String[] de_carga = new String[length];
            String[] curso = new String[length];
            String[] grupo = new String[length];
            String[] horario = new String[length];
            double[] hb_lab = new double[length];
            String[] hb_de_condicion = new String[length];
            String[] hb_ti_curso = new String[length];
            System.out.println("registros aceptados:" + length);

            for (int i = 0; i < arr.length(); i++) {
                hb_ti_curso[i] = (arr.getJSONObject(i).getJSONObject("tipocurso").has("content")) ? String.valueOf(arr.getJSONObject(i).getJSONObject("tipocurso").get("content")) : "";
                horario[i] = (arr.getJSONObject(i).getJSONObject("horario").has("content")) ? String.valueOf(arr.getJSONObject(i).getJSONObject("horario").get("content")) : "";
                campus[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("campus").get("content"));
                grupo[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("grupo").get("content"));
                nu_doc[i] = (arr.getJSONObject(i).getJSONObject("numerodocumento").has("content")) ? String.valueOf(arr.getJSONObject(i).getJSONObject("numerodocumento").get("content")) : "";
                nombre[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("nombre").get("content"));
                //System.out.println(nombre[i]);
                hb_de_condicion[i] = (arr.getJSONObject(i).getJSONObject("condicion").has("content")) ? String.valueOf(arr.getJSONObject(i).getJSONObject("condicion").get("content")) : "";
                de_carga[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("carga").get("content"));
                curso[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("nombrecurso").get("content"));
                app[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("apepat").get("content"));
                apm[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("apemat").get("content"));
                eap[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("eap").get("content"));
                hb_lab[i] = (arr.getJSONObject(i).getJSONObject("hlab").has("content")) ? Double.parseDouble(String.valueOf(arr.getJSONObject(i).getJSONObject("hlab").get("content"))) : 0.0;
                tipo_doc[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("tipodocumento").get("content"));
                facu[i] = String.valueOf(arr.getJSONObject(i).getJSONObject("facultad").get("content"));
                //  eapId=...
            }

            conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ArrayDescriptor des = ArrayDescriptor.createDescriptor("ARR_WS_CAMPUS", conn.conex);
            ArrayDescriptor des2 = ArrayDescriptor.createDescriptor("ARR_WS_ES_TIPO_DOC", conn.conex);
            ArrayDescriptor des3 = ArrayDescriptor.createDescriptor("ARR_WS_NU_DOC", conn.conex);
            ArrayDescriptor des4 = ArrayDescriptor.createDescriptor("ARR_WS_AP_PATERNO", conn.conex);
            ArrayDescriptor des5 = ArrayDescriptor.createDescriptor("ARR_WS_AP_MATERNO", conn.conex);
            ArrayDescriptor des6 = ArrayDescriptor.createDescriptor("ARR_WS_NO_TRABAJADOR", conn.conex);
            ArrayDescriptor des7 = ArrayDescriptor.createDescriptor("ARR_WS_NO_FACULTAD", conn.conex);
            ArrayDescriptor des8 = ArrayDescriptor.createDescriptor("ARR_WS_NO_EAP", conn.conex);
            ArrayDescriptor des9 = ArrayDescriptor.createDescriptor("ARR_WS_DE_CARGA", conn.conex);
            ArrayDescriptor des10 = ArrayDescriptor.createDescriptor("ARR_WS_NO_CURSO", conn.conex);
            ArrayDescriptor des11 = ArrayDescriptor.createDescriptor("ARR_WS_NU_GRUPO", conn.conex);
            ArrayDescriptor des12 = ArrayDescriptor.createDescriptor("ARR_WS_DE_HORARIO", conn.conex);
            ArrayDescriptor des13 = ArrayDescriptor.createDescriptor("ARR_WS_CA_HLAB", conn.conex);
            ArrayDescriptor des14 = ArrayDescriptor.createDescriptor("ARR_WS_DE_CONDICION", conn.conex);
            ArrayDescriptor des15 = ArrayDescriptor.createDescriptor("ARR_WS_DE_TIPO_CURSO", conn.conex);

            ARRAY array_to_pass1 = new ARRAY(des, conn.conex, campus);
            ARRAY array_to_pass2 = new ARRAY(des2, conn.conex, tipo_doc);
            ARRAY array_to_pass3 = new ARRAY(des3, conn.conex, nu_doc);
            ARRAY array_to_pass4 = new ARRAY(des4, conn.conex, app);
            ARRAY array_to_pass5 = new ARRAY(des5, conn.conex, apm);
            ARRAY array_to_pass6 = new ARRAY(des6, conn.conex, nombre);
            ARRAY array_to_pass7 = new ARRAY(des7, conn.conex, facu);
            ARRAY array_to_pass8 = new ARRAY(des8, conn.conex, eap);
            ARRAY array_to_pass9 = new ARRAY(des9, conn.conex, de_carga);
            ARRAY array_to_pass10 = new ARRAY(des10, conn.conex, curso);
            ARRAY array_to_pass11 = new ARRAY(des11, conn.conex, grupo);
            ARRAY array_to_pass12 = new ARRAY(des12, conn.conex, horario);
            ARRAY array_to_pass13 = new ARRAY(des13, conn.conex, hb_lab);
            ARRAY array_to_pass14 = new ARRAY(des14, conn.conex, hb_de_condicion);
            ARRAY array_to_pass15 = new ARRAY(des15, conn.conex, hb_ti_curso);
            System.out.println(":::register in BD... ");
            CallableStatement st = conn.conex.prepareCall("{CALL rhsp_ws_carga_academica(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            st.setArray(1, array_to_pass1);
            st.setArray(2, array_to_pass2);
            st.setArray(3, array_to_pass3);
            st.setArray(4, array_to_pass4);
            st.setArray(5, array_to_pass5);
            st.setArray(6, array_to_pass6);
            st.setArray(7, array_to_pass7);
            st.setArray(8, array_to_pass8);
            st.setArray(9, array_to_pass9);
            st.setArray(10, array_to_pass10);
            st.setArray(11, array_to_pass11);
            st.setArray(12, array_to_pass12);
            st.setArray(13, array_to_pass13);
            st.setArray(14, array_to_pass14);
            st.setArray(15, array_to_pass15);
            st.registerOutParameter(16, Types.VARCHAR);
            st.executeUpdate();
            response = st.getString(16);
            System.out.println(response);
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error : " + e.getMessage());
        } finally {
            try {
                conn.conex.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return arr.toString();
    }

}
