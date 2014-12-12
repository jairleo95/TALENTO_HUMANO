/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfaceSub_ModalidadDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Sub_Modalidad;

/**
 *
 * @author joserodrigo
 */
public class Sub_ModalidadDAO implements InterfaceSub_ModalidadDAO{
    ConexionBD conn;
    @Override
    public List<Sub_Modalidad> Listar_Sub_mo() {
         this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = " select * from RHTX_SUB_MODALIDAD";
        List<Sub_Modalidad> Lista = new ArrayList<Sub_Modalidad>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Sub_Modalidad x = new Sub_Modalidad();
                x.setId_sub_modalidad(rs.getString("id_sub_modalidad"));
                x.setDe_sub_modalidad(rs.getString("de_sub_modalidad"));
                x.setCo_sub_modalidad(rs.getString("co_sub_modalidad"));
                x.setId_modalidad(rs.getString("id_modalidad"));
                Lista.add(x);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }finally {
            this.conn.close();
        }
        return Lista;
    }
    
}
