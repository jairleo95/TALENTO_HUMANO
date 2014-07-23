/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;


import java.sql.ResultSet;
import java.sql.SQLException;

import pe.edu.upeu.application.dao_imp.InterfaceFotos_TrabajadorDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;


/**
 *
 * @author Alfa.sistemas
 */
public class Fotos_TrabajadorDAO implements InterfaceFotos_TrabajadorDAO {

    ConexionBD cnn;

    @Override
    public String List_id_Fotos_Trabajador(String idtr) {
        this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select id_foto from rhtr_fotos_trabajador where id_trabajador='" + idtr + "' ";
        String id = "";
        try {
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                id = rs.getString("id_foto");
            }
        } catch (SQLException e) {
        }
        return id;
    }

}
