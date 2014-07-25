/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.ResultSet;
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
    public boolean Insert_PMC() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
