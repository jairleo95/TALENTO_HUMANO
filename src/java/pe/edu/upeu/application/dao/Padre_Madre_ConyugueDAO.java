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
import static oracle.security.o3logon.b.a;
import pe.edu.upeu.application.dao_imp.InterfacePadre_Madre_ConyugueDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Padre_Madre_Conyugue;

/**
 *
 * @author Admin
 */
public class Padre_Madre_ConyugueDAO implements InterfacePadre_Madre_ConyugueDAO {

    ConexionBD conn;

    @Override
    public void INSERT_PADRE_MADRE_CONYUGUE(String ID_PADRE_MADRE_CONYUGUE, String AP_NOMBRES_PADRE, String AP_NOMBRES_MADRE, String ES_TRABAJA_UPEU_CONYUGUE, String AP_NOMBRES_CONYUGUE, String FE_NAC_CONYUGUE, String TI_DOC_ID, String NU_DOC, String LI_INSCRIPCION_VIG_ESSALUD, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, String ID_TRABAJADOR) {
        CallableStatement cst;
        try {
              this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_INSERT_PMC( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, ID_PADRE_MADRE_CONYUGUE);
            cst.setString(2, AP_NOMBRES_PADRE);
            cst.setString(3, AP_NOMBRES_MADRE);
            cst.setString(4, ES_TRABAJA_UPEU_CONYUGUE);
            cst.setString(5, AP_NOMBRES_CONYUGUE);
            cst.setString(6, FE_NAC_CONYUGUE);
            cst.setString(7, TI_DOC_ID);
            cst.setString(8, NU_DOC);
            cst.setString(9, LI_INSCRIPCION_VIG_ESSALUD);
            cst.setString(10, US_CREACION);
            cst.setString(11, FE_CREACION);
            cst.setString(12, US_MODIF);
            cst.setString(13, FE_MODIF);
            cst.setString(14, IP_USUARIO);
            cst.setString(15, ID_TRABAJADOR);
            cst.execute();
        } catch (SQLException ex) {
        } finally {
            this.conn.close();
        }
    }

    @Override
    public List<Padre_Madre_Conyugue> List_PMC(String id_pmc) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "Select * from rhtd_area ";
        List<Padre_Madre_Conyugue> list = new ArrayList<Padre_Madre_Conyugue>();
        try {
            ResultSet rs = this.conn.query(sql);
            Padre_Madre_Conyugue pmc = new Padre_Madre_Conyugue();
            while (rs.next()) {
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

}
