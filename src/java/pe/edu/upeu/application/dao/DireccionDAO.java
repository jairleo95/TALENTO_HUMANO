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
import pe.edu.upeu.application.dao_imp.InterfaceDireccionDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Direccion;

/**
 *
 * @author joserodrigo
 */
public class DireccionDAO implements InterfaceDireccionDAO{
ConexionBD conn;
    @Override
    public List<Direccion> Listar_Direccion() {
          this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = " select * from RHTX_DIRECCION";
        List<Direccion> Lista = new ArrayList<Direccion>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Direccion x = new Direccion();
                x.setId_direccion(rs.getString("id_direccion"));
                x.setNo_direccion(rs.getString("no_direccion"));
                x.setNo_corto_dir(rs.getString("no_corto_dir"));
                x.setId_filial(rs.getString("id_filial"));
                x.setEs_direccion(rs.getString("es_direccion"));
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
