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
import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfaceCarga_AcademicaDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Carga_Academica;
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
    public String INSERT_DGP(String ID_DGP, String FE_DESDE, String FE_HASTA, double CA_SUELDO, String DE_DIAS_TRABAJO, String ID_PUESTO, String ID_REQUERIMIENTO, String ID_TRABAJADOR, String CO_RUC, String DE_LUGAR_SERVICIO, String DE_SERVICIO, String DE_PERIODO_PAGO, String DE_DOMICILIO_FISCAL, String DE_SUBVENCION, String DE_HORARIO_CAPACITACION, String DE_HORARIO_REFRIGERIO, String DE_DIAS_CAPACITACION, String ES_DGP, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, double CA_BONO_ALIMENTARIO, double DE_BEV, String DE_ANTECEDENTES_POLICIALES, String ES_CERTIFICADO_SALUD, String DE_MONTO_HONORARIO, String FE_CESE, String FE_RECEPCION, String MO_RENUNCIA, double DI_ADQUIRIDOS, double DI_CONSUMIDOS, double DI_POR_CONSUMIR, String ES_VACACIONES, String LI_MOTIVO, String ES_MFL, double CA_BONIFICACION_P, String ID_PROCESO_CARGA_AC) {
        String id = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_PROCESO_CA_DGP( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,? )} ");
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
            cst.setString(39, ID_PROCESO_CARGA_AC);
            cst.registerOutParameter(40, Types.CHAR);
            cst.execute();
            id = cst.getString(40);
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
    public String INSERT_PROCESO_CARGA_ACADEMICA(String ID_PROCESO_CARGA_AC, String ES_PROCESO_CARGA_AC, double CA_TIPO_HORA_PAGO, double CA_TOTAL_HL, String FE_DESDE, String FE_HASTA, String ES_PROCESADO, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, String NO_USUARIO) {
        String id = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_RHTM_PROCESO_CARGA_ACADEMICA( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,? )} ");
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
            cst.registerOutParameter(14, Types.CHAR);
            cst.execute();
            id = cst.getString(14);
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
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public String INSERT_DETALLE_CARGA_ACADEMICA(String ID_DETALLE_CARGA_ACADEMICA, String ID_PROCESO_CARGA_AC, String ID_CARGA_ACADEMICA, String ES_DETALLE_CARGA) {
        String id = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_RHTD_DETALLE_CARGA_ACADEMICA( ?, ?, ?, ?,? )} ");
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
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_RHTD_PAGO_DOCENTE( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,? )} ");
            cst.setString(1, ID_PAGO_DOCENTE);
            cst.setString(2, NU_CUOTA);
            cst.setDouble(3, CA_CUOTA);
            cst.setString(4, FE_PAGO);
            cst.setString(5, ES_PAGO_DOCENTE);
            cst.setString(6, ID_PROCESO_CARGA_AC);
            cst.setString(7, FE_CREACION);
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

}
