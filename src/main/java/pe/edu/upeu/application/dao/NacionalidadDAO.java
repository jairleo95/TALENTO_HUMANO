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
import pe.edu.upeu.application.dao_imp.InterfaceNacionalidadDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Nacionalidad;
    
/**
 *
 * @author joserodrigo
 */
public class NacionalidadDAO implements InterfaceNacionalidadDAO{
    ConexionBD conn;
    @Override
    public List<Nacionalidad> List_Nacionalidad() {
       this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT ID_NACIONALIDAD,(trim(NO_NACIONALIDAD))as NO_NACIONALIDAD,CO_NACIONALIDAD FROM RHTX_NACIONALIDAD ORDER BY NO_NACIONALIDAD";
        List<Nacionalidad> list = new ArrayList<Nacionalidad>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Nacionalidad x = new Nacionalidad();
                x.setId_nacionalidad(rs.getString("ID_NACIONALIDAD"));
                x.setNo_nacionalidad(rs.getString("NO_NACIONALIDAD"));
                x.setCo_nacionalidad(rs.getString("CO_NACIONALIDAD"));
                list.add(x);
            }

        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }

        return list;
    }
    
}
