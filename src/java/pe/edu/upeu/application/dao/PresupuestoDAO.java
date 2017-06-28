/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;
import pe.edu.upeu.application.dao_imp.InterfacePresupuestoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;

/**
 *
 * @author Leandro Burgos
 */
public class PresupuestoDAO implements InterfacePresupuestoDAO {

    String sql;
    ConexionBD cnn;
    PreparedStatement ps;

    @Override
    public boolean Reg_PresupuestoArea(Object s) {
        boolean p = false;
        sql = "INSERT INTO PRESUPUESTO values (null,?,?,?,?,?)";
        Map<String, Object> m = (Map<String, Object>) s;
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, m.get("idA").toString());
            ps.setDouble(2, Double.parseDouble(m.get("PA").toString()));            
            ps.setString(3, m.get("f_i").toString());
            ps.setString(4, m.get("f_fin").toString());
            ps.setInt(5, Integer.parseInt(m.get("NT").toString()));
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (SQLException | NumberFormatException e) {
            System.out.println("Error al agregar Presupuesto " + e);
            p = false;
        }
        return p;
    }

}
