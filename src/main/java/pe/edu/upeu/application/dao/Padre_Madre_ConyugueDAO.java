/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.dao_imp.InterfacePadre_Madre_ConyugueDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.properties.UserMachineProperties;
import pe.edu.upeu.application.util.DateFormat;

/**
 *
 * @author Admin
 */
public class Padre_Madre_ConyugueDAO implements InterfacePadre_Madre_ConyugueDAO {

    ConexionBD conn;
    DateFormat c = new DateFormat();

    @Override
    public void INSERT_CONYUGUE(String ES_TRABAJA_UPEU_CONYUGUE, String AP_NOMBRES_CONYUGUE, String FE_NAC_CONYUGUE, String TI_DOC_ID, String NU_DOC, String LI_INSCRIPCION_VIG_ESSALUD, String US_MODIF, String IP_USUARIO, String ID_TRABAJADOR, String ID_CONYUGUE) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_INSERT_CONYUGUE(  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, ES_TRABAJA_UPEU_CONYUGUE);
            cst.setString(2, AP_NOMBRES_CONYUGUE);
            cst.setString(3, DateFormat.toFormat1(FE_NAC_CONYUGUE));
            cst.setString(4, TI_DOC_ID);
            cst.setString(5, NU_DOC);
            cst.setString(6, LI_INSCRIPCION_VIG_ESSALUD);
            cst.setString(7, US_MODIF);
            cst.setString(8, InetAddress.getLocalHost().getHostAddress());
            //cst.setString(9, null);
            cst.setString(9, ID_TRABAJADOR);
            cst.setString(10, ID_CONYUGUE);
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (UnknownHostException ex) {
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
    }
    @Override
    public void MOD_PADRE_MADRE_CONYUGUE(String AP_NOMBRES_PADRE, String AP_NOMBRES_MADRE, String ES_TRABAJA_UPEU_CONYUGUE, String AP_NOMBRES_C, String FE_NAC_C, String ID_TIPO_DOC_C, String NU_DOC_C, String LI_INSCRIPCION_VIG_ESSALUD_C, String ID_TRABAJADOR, String US_MODIF, String IP_USUARIO) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_MOD_PADRE_MAD_CON( ?, ?, ?, ?, ?, ?, ?, ? ,?, ?, ?)}");
            cst.setString(1, AP_NOMBRES_PADRE);
            cst.setString(2, AP_NOMBRES_MADRE);
            cst.setString(3, ES_TRABAJA_UPEU_CONYUGUE);
            cst.setString(4, AP_NOMBRES_C);
            cst.setString(5, FE_NAC_C);
            cst.setString(6, ID_TIPO_DOC_C);
            cst.setString(7, NU_DOC_C);
            cst.setString(8, LI_INSCRIPCION_VIG_ESSALUD_C);
            cst.setString(9, ID_TRABAJADOR);
            cst.setString(10, US_MODIF);
            cst.setString(11, IP_USUARIO);
            cst.execute();
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
    }

    @Override
    public boolean MOD_PADRES(String AP_NOMBRES_PADRE, String AP_NOMBRES_MADRE, String ID_TRABAJADOR, String USER) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_MOD_PADRES( ?, ?, ?, ?, ?)}");
            cst.setString(1, AP_NOMBRES_PADRE);
            cst.setString(2, AP_NOMBRES_MADRE);
            cst.setString(3, ID_TRABAJADOR);
            cst.setString(4, USER);
            cst.setString(5, UserMachineProperties.getAll());
            cst.execute();
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
        return true;
    }

    @Override
    public List<Map<String, ?>> Listar_Padres(String id) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select  id_trabajador,AP_NOMBRES_PADRE,AP_NOMBRES_MADRE  from RHTM_TRABAJADOR where id_trabajador='" + id + "'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_trabajador"));
                rec.put("padre", rs.getString("AP_NOMBRES_PADRE"));
                rec.put("madre", rs.getString("AP_NOMBRES_MADRE"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return lista;

    }

    @Override
    public void INSERT_PADRES(String AP_NOMBRES_MADRE, String AP_NOMBRES_PADRE, String ID_TRABAJDOR, String US_MODIF, String IP_USUARIO) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_INSERT_PADRES(  ?, ?, ?, ?, ?)}");
            cst.setString(1, AP_NOMBRES_MADRE);
            cst.setString(2, AP_NOMBRES_PADRE);
            cst.setString(3, ID_TRABAJDOR);
            cst.setString(4, US_MODIF);
            cst.setString(5, IP_USUARIO);

            cst.execute();
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
    }

}
