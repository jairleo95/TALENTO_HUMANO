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
import pe.edu.upeu.application.dao_imp.InterfaceRolDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Detalle_Privilegio;
import pe.edu.upeu.application.model.Rol;
import pe.edu.upeu.application.model.V_Privilegio;

/**
 *
 * @author Jose
 */
public class RolDAO implements InterfaceRolDAO {

    ConexionBD conn;

    @Override
    public List<Rol> List_Rol() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from RHTR_ROL";
        List<Rol> list = new ArrayList<Rol>();
        try {
            ResultSet rs = this.conn.query(sql);
            Rol r = new Rol();
            while (rs.next()) {
                r.setId_rol(rs.getString("id_rol"));
                r.setNo_rol(rs.getString("no_rol"));
                list.add(r);
            }

        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }

        return list;

    }

    @Override
    public List<V_Privilegio> listarURL(String idrol) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from  RHVD_PRIVILEGIO where ID_ROL='" + idrol + "'";
        List<V_Privilegio> list = new ArrayList<V_Privilegio>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_Privilegio d = new V_Privilegio();
                d.setDi_url(rs.getString("di_url"));
                d.setId_detalle_privilegio(rs.getString("id_detalle_privilegio"));
                d.setId_privilegio(rs.getString("id_privilegio"));
                d.setId_rol(rs.getString("id_rol"));
                d.setNo_link(rs.getString("no_link"));
                d.setNu_orden(rs.getInt("nu_orden"));
                list.add(d);

            }

        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }

        return list;
    }

    @Override
    public boolean INSERT_ROLES(String idrol) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
