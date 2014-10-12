/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
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

    @Override
    public void INSERT_FOTOS_TRABAJADOR(String ID_FOTO, String DE_FOTO, String AR_FOTO, String NO_AR_FOTO, String TA_AR_FOTO, String TI_AR_FOTO, String ID_TRABAJADOR) {
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = cnn.conex.prepareCall("{CALL RHSP_INSERT_FOTOS_TRABAJADOR( ?, ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, null);
            cst.setString(2, DE_FOTO);
            cst.setString(3, AR_FOTO);
            cst.setString(4, NO_AR_FOTO);
            cst.setString(5, TA_AR_FOTO);
            cst.setString(6, TI_AR_FOTO);
            cst.setString(7, ID_TRABAJADOR);
            cst.execute();
        } catch (SQLException ex) {
        } finally {
            this.cnn.close();
        }
    }

}
