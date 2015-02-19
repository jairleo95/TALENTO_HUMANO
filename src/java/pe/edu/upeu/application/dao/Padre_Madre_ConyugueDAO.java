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
import java.util.List;

import pe.edu.upeu.application.dao_imp.InterfacePadre_Madre_ConyugueDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Padre_Madre_Conyugue;
import pe.edu.upeu.application.web.controller.CConversion;

/**
 *
 * @author Admin
 */
public class Padre_Madre_ConyugueDAO implements InterfacePadre_Madre_ConyugueDAO {

    ConexionBD conn;
    CConversion c = new CConversion();

    @Override
    public void INSERT_CONYUGUE(String ES_TRABAJA_UPEU_CONYUGUE, String AP_NOMBRES_CONYUGUE, String FE_NAC_CONYUGUE, String TI_DOC_ID, String NU_DOC, String LI_INSCRIPCION_VIG_ESSALUD, String US_MODIF, String FE_MODIF, String IP_USUARIO, String ID_TRABAJADOR, String ID_CONYUGUE) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_INSERT_CONYUGUE(  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, ES_TRABAJA_UPEU_CONYUGUE);
            cst.setString(2, AP_NOMBRES_CONYUGUE);
            cst.setString(3, c.convertFecha(FE_NAC_CONYUGUE));
            cst.setString(4, TI_DOC_ID);
            cst.setString(5, NU_DOC);
            cst.setString(6, LI_INSCRIPCION_VIG_ESSALUD);
            cst.setString(7, US_MODIF);
            cst.setString(8, FE_MODIF);
            cst.setString(9, InetAddress.getLocalHost().getHostAddress());
            //cst.setString(9, null);
            cst.setString(10, ID_TRABAJADOR);
            cst.setString(11, ID_CONYUGUE);
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
    public List<Padre_Madre_Conyugue> List_PMC(String idtr) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT ID_PADRE_MADRE_CONYUGUE, AP_NOMBRES_PADRE,AP_NOMBRES_MADRE, ES_TRABAJA_UPEU_CONYUGUE ,AP_NOMBRES_CONYUGUE, to_char(FE_NAC_CONYUGUE,'yyyy-mm-dd')fe_nac_conyugue, TI_DOC_ID,NU_DOC, LI_INSCRIPCION_VIG_ESSALUD, US_CREACION, FE_CREACION, US_MODIF, FE_MODIF, IP_USUARIO,ID_TRABAJADOR FROM RHTD_PADRE_MADRE_CONYUGUE where id_trabajador='" + idtr.trim() + "'";
        List<Padre_Madre_Conyugue> list = new ArrayList<Padre_Madre_Conyugue>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Padre_Madre_Conyugue pmc = new Padre_Madre_Conyugue();
                pmc.setId_padre_madre_conyugue(rs.getString("id_padre_madre_conyugue"));
                pmc.setAp_nombres_padre(rs.getString("ap_nombres_padre"));
                pmc.setAp_nombres_madre(rs.getString("ap_nombres_madre"));
                pmc.setEs_trabaja_upeu_conyugue(rs.getString("es_trabaja_upeu_conyugue"));
                pmc.setAp_nombres_conyugue(rs.getString("ap_nombres_conyugue"));
                pmc.setFe_nac_conyugue(rs.getString("fe_nac_conyugue"));
                pmc.setTi_doc_id(rs.getString("ti_doc_id"));
                pmc.setNu_doc(rs.getString("nu_doc"));
                pmc.setLi_inscripcion_vig_essalud(rs.getString("li_inscripcion_vig_essalud"));
                pmc.setUs_creacion(rs.getString("us_creacion"));
                pmc.setFe_creacion(rs.getString("fe_creacion"));
                pmc.setUs_modif(rs.getString("us_modif"));
                pmc.setFe_modif(rs.getString("fe_modif"));
                pmc.setIp_usuario(rs.getString("ip_usuario"));
                pmc.setId_trabajador(rs.getString("id_trabajador"));
                list.add(pmc);
            }
        } catch (Exception e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public void MOD_PADRE_MADRE_CONYUGUE(String AP_NOMBRES_PADRE, String AP_NOMBRES_MADRE, String ES_TRABAJA_UPEU_CONYUGUE, String AP_NOMBRES_C, String FE_NAC_C, String ID_TIPO_DOC_C, String NU_DOC_C, String LI_INSCRIPCION_VIG_ESSALUD_C, String ID_TRABAJADOR) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_MOD_PADRE_MAD_CON( ?, ?, ?, ?, ?, ?, ?, ? ,?)}");
            cst.setString(1, AP_NOMBRES_PADRE);
            cst.setString(2, AP_NOMBRES_MADRE);
            cst.setString(3, ES_TRABAJA_UPEU_CONYUGUE);
            cst.setString(4, AP_NOMBRES_C);
            cst.setString(5, FE_NAC_C);
            cst.setString(6, ID_TIPO_DOC_C);
            cst.setString(7, NU_DOC_C);
            cst.setString(8, LI_INSCRIPCION_VIG_ESSALUD_C);
            cst.setString(9, ID_TRABAJADOR);
            cst.execute();
        } catch (SQLException ex) {
        } finally {
            this.conn.close();
        }
    }

    @Override
    public void INSERT_PADRES(String AP_NOMBRES_MADRE, String AP_NOMBRES_PADRE, String ID_TRABAJDOR) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_INSERT_PADRES(  ?, ?, ?)}");
            cst.setString(1, AP_NOMBRES_MADRE);
            cst.setString(2, AP_NOMBRES_PADRE);
            cst.setString(3, ID_TRABAJDOR);

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
