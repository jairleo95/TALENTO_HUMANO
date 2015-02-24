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
import pe.edu.upeu.application.dao_imp.InterfaceCarga_AcademicaDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Carga_Academica;
import pe.edu.upeu.application.model.Carrera;

/**
 *
 * @author ALFA 3
 */
public class Carga_AcademicaDAO implements InterfaceCarga_AcademicaDAO {

    ConexionBD conn;

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
            cst.setString(19, FE_CREACION);
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
    public void INSERT_PROCESO_CARGA_ACADEMICA(String ID_PROCESO_CARGA_AC, String ES_PROCESO_CARGA_AC, int CA_TIPO_HORA_PAGO, int CA_TOTAL_HL, String FE_DESDE, String FE_HASTA, String ES_PROCESADO, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, String NO_USUARIO) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_PROCESO_CARGA_ACADEMICA( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )} ");
            cst.setString(1, null);
            cst.setString(2, ES_PROCESO_CARGA_AC);
            cst.setInt(3, CA_TIPO_HORA_PAGO);
            cst.setInt(4, CA_TOTAL_HL);
            cst.setString(5, FE_DESDE);
            cst.setString(6, FE_HASTA);
            cst.setString(7, ES_PROCESADO);
            cst.setString(8, US_CREACION);
            cst.setString(9, FE_CREACION);
            cst.setString(10, US_MODIF);
            cst.setString(11, FE_MODIF);
            cst.setString(12, IP_USUARIO);
            cst.setString(13, NO_USUARIO);
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

}
