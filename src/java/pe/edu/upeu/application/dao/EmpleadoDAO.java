/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import pe.edu.upeu.application.dao_imp.InterfaceEmpleadoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;

/**
 *
 * @author Alfa.sistemas
 */
public class EmpleadoDAO implements InterfaceEmpleadoDAO {

    ConexionBD conn;

    @Override
    public String Id_Puesto_Personal(String ide) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT 'DGP-' ||MAX (SUBSTR(ID_DGP,5,8)) FROM RHTM_DGP";
        String id = null;
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            id = rs.getString(1);
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return id;
    }

}
