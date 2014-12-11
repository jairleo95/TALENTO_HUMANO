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
import pe.edu.upeu.application.dao_imp.InterfaceCentro_CostosDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Centro_Costos;

/**
 *
 * @author joserodrigo
 */
public class Centro_CostosDAO implements InterfaceCentro_CostosDAO{
    ConexionBD conn;
    
    @Override
    public List<Centro_Costos> List_centro_costo() {
         this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from RHTR_CENTRO_COSTO order by DE_CENTRO_COSTO";
        List<Centro_Costos> list = new ArrayList<Centro_Costos>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Centro_Costos d = new Centro_Costos();
                d.setId_centro_costo(rs.getString("ID_CENTRO_COSTO"));
                d.setDe_centro_costo(rs.getString("DE_CENTRO_COSTO"));
                d.setCo_centro_costo(rs.getString("CO_CENTRO_COSTO"));
                d.setId_departamento(rs.getString("ID_DEPARTAMENTO"));
                list.add(d);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }

        return list;
    }
    
}
