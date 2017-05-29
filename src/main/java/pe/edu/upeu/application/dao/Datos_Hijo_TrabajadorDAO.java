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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.dao_imp.InterfaceDatos_Hijo_Trabajador;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Datos_Hijo_Trabajador;
import pe.edu.upeu.application.properties.UserMachineProperties;
import pe.edu.upeu.application.util.DateFormat;

/**
 *
 * @author Jose
 */
public class Datos_Hijo_TrabajadorDAO implements InterfaceDatos_Hijo_Trabajador {

    ConexionBD conn;
    DateFormat c = new DateFormat();

    @Override
    public void INSERT_DATOS_HIJO_TRABAJADOR(String ID_DATOS_HIJOS_TRABAJADOR, String ID_TRABAJADOR, String AP_PATERNO, String AP_MATERNO, String NO_HIJO_TRABAJADOR, String FE_NACIMIENTO, String ES_SEXO, String ES_TIPO_DOC, String NU_DOC, String ES_PRESENTA_DOCUMENTO, String ES_INSCRIPCION_VIG_ESSALUD, String ES_ESTUDIO_NIV_SUPERIOR, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, String ES_DATOS_HIJO_TRABAJADOR) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_INSERT_DA_HI_TRA( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, null);
            cst.setString(2, ID_TRABAJADOR);
            cst.setString(3, AP_PATERNO);
            cst.setString(4, AP_MATERNO);
            cst.setString(5, NO_HIJO_TRABAJADOR);
            cst.setString(6, DateFormat.toFormat1(FE_NACIMIENTO));
            cst.setString(7, ES_SEXO);
            cst.setString(8, ES_TIPO_DOC.trim());
            cst.setString(9, NU_DOC);
            cst.setString(10, ES_PRESENTA_DOCUMENTO);
            cst.setString(11, ES_INSCRIPCION_VIG_ESSALUD);
            cst.setString(12, ES_ESTUDIO_NIV_SUPERIOR);
            cst.setString(13, US_CREACION);
            cst.setString(14, null);
            cst.setString(15, null);
            cst.setString(16, null);
            cst.setString(17, UserMachineProperties.getAll());
            cst.setString(18, "1");
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
    public List<Datos_Hijo_Trabajador> LISTA_HIJOS(String id) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select ID_DATOS_HIJOS_TRABAJADOR, ID_TRABAJADOR,AP_PATERNO,AP_MATERNO,NO_HIJO_TRABAJADOR,TO_CHAR(FE_NACIMIENTO,'yyyy-mm-dd') AS FE_NACIMIENTO, ES_SEXO, ES_TIPO_DOC, NU_DOC, ES_PRESENTA_DOCUMENTO, ES_INSCRIPCION_VIG_ESSALUD, ES_ESTUDIO_NIV_SUPERIOR, US_CREACION,FE_CREACION,US_MODIF,FE_MODIF,IP_USUARIO,ES_DATOS_HIJO_TRABAJADOR from RHTD_DATOS_HIJO_TRABAJADOR where ID_TRABAJADOR='" + id + "'";
        List<Datos_Hijo_Trabajador> Lista = new ArrayList<Datos_Hijo_Trabajador>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Datos_Hijo_Trabajador t = new Datos_Hijo_Trabajador();
                t.setId_datos_hijos_trabajador(rs.getString("id_datos_hijos_trabajador"));
                t.setId_trabajador(rs.getString("id_trabajador"));
                t.setAp_paterno(rs.getString("ap_paterno"));
                t.setAp_materno(rs.getString("ap_materno"));
                t.setNo_hijo_trabajador(rs.getString("no_hijo_trabajador"));
                t.setFe_nacimiento(rs.getString("fe_nacimiento"));
                t.setEs_sexo(rs.getString("es_sexo"));
                t.setEs_tipo_doc(rs.getString("es_tipo_doc"));
                t.setNu_doc(rs.getString("nu_doc"));
                t.setEs_presenta_documento(rs.getString("es_presenta_documento"));
                t.setEs_inscripcion_vig_essalud(rs.getString("es_inscripcion_vig_essalud"));
                t.setEs_estudio_niv_superior(rs.getString("es_estudio_niv_superior"));
                t.setUs_creacion(rs.getString("us_creacion"));
                t.setFe_creacion(rs.getString("fe_creacion"));
                t.setUs_modif(rs.getString("us_modif"));
                t.setFe_modif(rs.getString("fe_modif"));
                t.setIp_usuario(rs.getString("ip_usuario"));
                t.setEs_datos_hijo_trabajador(rs.getString("es_datos_hijo_trabajador"));
                Lista.add(t);
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
        return Lista;
    }

    @Override
    public int ASIGNACION_F(String idtr) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select count(*) from RHTD_DATOS_HIJO_TRABAJADOR where to_number((sysdate - FE_NACIMIENTO)/365 ) <18  and ID_TRABAJADOR='" + idtr.trim() + "'";
        int TOTAL = 0;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                TOTAL = Integer.parseInt(rs.getString(1));
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
        return TOTAL;
    }

    @Override
    public void MOD_HIJOS_TRAB(String ID_DATOS_HIJOS_TRABAJADOR, String AP_PATERNO, String AP_MATERNO, String NO_HIJO_TRABAJADOR, String FE_NACIMIENTO, String ES_SEXO, String ES_TIPO_DOC, String NU_DOC, String ES_INSCRIPCION_VIG_ESSALUD, String ES_ESTUDIO_NIV_SUPERIOR, String id_usuario) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_MOD_HIJOS( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,? )}");
            cst.setString(1, ID_DATOS_HIJOS_TRABAJADOR);
            cst.setString(2, AP_PATERNO);
            cst.setString(3, AP_MATERNO);
            cst.setString(4, NO_HIJO_TRABAJADOR);
            cst.setString(5, DateFormat.toFormat1(FE_NACIMIENTO));
            cst.setString(6, ES_SEXO);
            cst.setString(7, ES_TIPO_DOC);
            cst.setString(8, NU_DOC);
            cst.setString(9, ES_INSCRIPCION_VIG_ESSALUD);
            cst.setString(10, ES_ESTUDIO_NIV_SUPERIOR);
            cst.setString(11, id_usuario);
            cst.setString(12, UserMachineProperties.getAll());
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
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
    public void ELIMINAR_HIJO(String id_hijo, String id_id_trabajador) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "UPDATE RHTD_DATOS_HIJO_TRABAJADOR SET ES_DATOS_HIJO_TRABAJADOR = '0' WHERE ID_TRABAJADOR = '" + id_id_trabajador + "' and ID_DATOS_HIJOS_TRABAJADOR = '" + id_hijo + "'";
            this.conn.query(sql);
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
    public List<Datos_Hijo_Trabajador> LISTA_HIJO(String idHijo, String idtr) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT ID_DATOS_HIJOS_TRABAJADOR,ID_TRABAJADOR,AP_PATERNO,AP_MATERNO,NO_HIJO_TRABAJADOR,to_char(FE_NACIMIENTO,'yyyy-mm-dd')fe_nacimiento , ES_SEXO,ES_TIPO_DOC,NU_DOC, ES_PRESENTA_DOCUMENTO, ES_INSCRIPCION_VIG_ESSALUD, ES_ESTUDIO_NIV_SUPERIOR, US_CREACION, FE_CREACION, US_MODIF, FE_MODIF, IP_USUARIO, ES_DATOS_HIJO_TRABAJADOR from RHTD_DATOS_HIJO_TRABAJADOR where ID_TRABAJADOR='" + idtr.trim() + "' and ID_DATOS_HIJOS_TRABAJADOR ='" + idHijo.trim() + "'";
        List<Datos_Hijo_Trabajador> Lista = new ArrayList<Datos_Hijo_Trabajador>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Datos_Hijo_Trabajador t = new Datos_Hijo_Trabajador();
                t.setId_datos_hijos_trabajador(rs.getString("id_datos_hijos_trabajador"));
                t.setId_trabajador(rs.getString("id_trabajador"));
                t.setAp_paterno(rs.getString("ap_paterno"));
                t.setAp_materno(rs.getString("Ap_materno"));
                t.setNo_hijo_trabajador(rs.getString("no_hijo_trabajador"));
                t.setFe_nacimiento(rs.getString("fe_nacimiento"));
                t.setEs_sexo(rs.getString("es_sexo"));
                t.setEs_tipo_doc(rs.getString("es_tipo_doc"));
                t.setNu_doc(rs.getString("nu_doc"));
                t.setEs_presenta_documento(rs.getString("es_presenta_documento"));
                t.setEs_inscripcion_vig_essalud(rs.getString("es_inscripcion_vig_essalud"));
                t.setEs_estudio_niv_superior(rs.getString("es_estudio_niv_superior"));
                t.setUs_creacion(rs.getString("us_creacion"));
                t.setFe_creacion(rs.getString("fe_creacion"));
                t.setUs_modif(rs.getString("us_modif"));
                t.setFe_modif(rs.getString("fe_modif"));
                t.setIp_usuario(rs.getString("ip_usuario"));
                t.setEs_datos_hijo_trabajador(rs.getString("es_datos_hijo_trabajador"));
                Lista.add(t);
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
        return Lista;

    }

    @Override
    public List<Map<String, ?>> Listar_hijo_filtro(String desde, String hasta, String edad, String nom, String pat, String mat, String dn, String gen) {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT * FROM RHVD_FILTRO_EDAD ";
            sql += (!desde.equals("") & !(hasta.equals(""))) ? "where EDAD BETWEEN '" + desde.trim() + "' and '" + hasta.trim() + "'" : "";
            sql += (!edad.equals("")) ? "where EDAD='" + edad.trim() + "'" : "";
            sql += (!nom.equals("")) ? "where UPPER(NO_HIJO_TRABAJADOR)='" + nom.trim().toUpperCase() + "'" : "";
            sql += (!pat.equals("")) ? "where UPPER(AP_PATERNO)='" + pat.trim().toUpperCase() + "'" : "";
            sql += (!mat.equals("")) ? "where UPPER(AP_MATERNO)='" + mat.trim().toUpperCase() + "'" : "";
            sql += (!dn.equals("")) ? "where DNI='" + dn.trim() + "'" : "";
            sql += (!gen.equals("")) ? "where genero='" + gen.trim() + "'" : "";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("nom", rs.getString("nombre"));
                rec.put("dni", rs.getString("dni"));
                rec.put("gen", rs.getString("genero"));
                rec.put("fec_na", rs.getString("fecha_nac"));
                rec.put("edad", rs.getString("edad"));
                rec.put("id_tr", rs.getString("ID_TRABAJADOR"));
                rec.put("id_hi", rs.getString("ID_DATOS_HIJOS_TRABAJADOR"));
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
    public List<Map<String, ?>> Listar_Cumpleaños(String mes, String dia, String aps, String dep, String are, String sec, String pue, String fec, String edad, String ape, String mat, String nom, String tip, String num) {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT * FROM RHVD_FILTRO_CUMPL_TRAB ";
            sql += (!aps.equals("")) ? "Where UPPER(CO_APS)='" + aps.trim().toUpperCase() + "'" : "";
            sql += (!dep.equals("")) ? "Where UPPER(DEPARTAMENTO)='" + dep.trim().toUpperCase() + "'" : "";
            sql += (!are.equals("")) ? "Where UPPER(AREA)='" + are.trim().toUpperCase() + "'" : "";
            sql += (!sec.equals("")) ? "Where UPPER(SECCION)='" + sec.trim().toUpperCase() + "'" : "";
            sql += (!pue.equals("")) ? "Where UPPER(PUESTO)='" + pue.trim().toUpperCase() + "'" : "";
            //sql += (!fec.equals("")) ? "Where FECHA_NAC='" + fec.trim() + "'" : "";            
            sql += (!edad.equals("")) ? "Where EDAD='" + edad.trim() + "'" : "";
            sql += (!ape.equals("")) ? "Where UPPER(AP_PATERNO)='" + ape.trim().toUpperCase() + "'" : "";
            sql += (!mat.equals("")) ? "Where UPPER(AP_MATERNO)='" + mat.trim().toUpperCase() + "'" : "";
            sql += (!nom.equals("")) ? "Where UPPER(NO_TRABAJADOR)='" + nom.trim().toUpperCase() + "'" : "";
            sql += (!tip.equals("")) ? "Where UPPER(TIPO)='" + tip.trim().toUpperCase() + "'" : "";
            sql += (!num.equals("")) ? "Where NU_DOC='" + num.trim() + "'" : "";
            //buscar por rango de mes de cumpleaños*/

            sql += (!mes.equals("") & !mes.equals("13")) ? "where mes='" + mes.trim() + "' " : "";
            sql += (!mes.equals("") & mes.equals("13")) ? "" : "";
            sql += (!dia.equals("")) ? "and dia='" + dia.trim() + "'" : "";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("aps", rs.getString("APS"));
                rec.put("dep", rs.getString("DEPARTAMENTO"));
                rec.put("are", rs.getString("AREA"));
                rec.put("secc", rs.getString("SECCION"));
                rec.put("pue", rs.getString("PUESTO"));
                rec.put("fec_na", rs.getString("FECHA_NAC"));
                rec.put("edad", rs.getString("EDAD"));
                rec.put("nom", rs.getString("NOMBRE"));
                rec.put("tip", rs.getString("TIPO"));
                rec.put("dni", rs.getString("NU_DOC"));
                rec.put("dia", rs.getString("DIA"));
                rec.put("mes", rs.getString("MES"));
                rec.put("id_tr", rs.getString("ID_TRABAJADOR"));
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
    public List<Map<String, ?>> Lis_Hijos_id_tr(String idtr) {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select ID_DATOS_HIJOS_TRABAJADOR, ID_TRABAJADOR, AP_PATERNO, AP_MATERNO, NO_HIJO_TRABAJADOR,TO_CHAR( TO_DATE(FE_NACIMIENTO,'YYYY/MM/DD'),'DD/MM/YYYY') AS FE_NACIMIENTO , SEXO, NU_DOC, ES_PRESENTA_DOCUMENTO, ESSALUD, SUPERIOR, US_CREACION, FE_CREACION, US_MODIF, FE_MODIF, IP_USUARIO, ES_DATOS_HIJO_TRABAJADOR, DE_TIP_DOC from rhvd_detalle_hijo where ID_TRABAJADOR='" + idtr + "' and ES_DATOS_HIJO_TRABAJADOR = '1' ";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("idh", rs.getString("ID_DATOS_HIJOS_TRABAJADOR"));
                rec.put("idtr", rs.getString("ID_TRABAJADOR"));
                rec.put("ap_p", rs.getString("AP_PATERNO"));
                rec.put("ap_m", rs.getString("AP_MATERNO"));
                rec.put("no_hijo", rs.getString("NO_HIJO_TRABAJADOR"));
                rec.put("fe_nac", rs.getString("FE_NACIMIENTO"));
                rec.put("sexo", rs.getString("SEXO"));
                rec.put("ti_doc", rs.getString("DE_TIP_DOC"));
                rec.put("nu_doc", rs.getString("NU_DOC"));
                rec.put("essalud", rs.getString("ESSALUD"));
                rec.put("superior", rs.getString("SUPERIOR"));

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
                throw new RuntimeException(e.getMessage());
            }
        }
        return Lista;
    }

}
