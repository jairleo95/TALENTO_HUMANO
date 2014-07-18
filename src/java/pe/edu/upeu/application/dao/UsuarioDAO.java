/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import pe.edu.upeu.application.dao_imp.InterfaceUsuarioDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.upeu.application.model.Usuario;

import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;

/**
 *
 * @author Alfa.sistemas
 */
public class UsuarioDAO implements InterfaceUsuarioDAO {

    ConexionBD conn;

    @Override
    public List<Usuario> List_Usuario() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM RHTC_USUARIO");
        List<Usuario> list = new ArrayList<Usuario>();
        try {
            ResultSet rs = this.conn.query(sql.toString());
            while (rs.next()) {
                Usuario us = new Usuario();
                us.setId_usuario(rs.getString("id_usuario"));
                us.setId_rol(rs.getString("id_rol"));
                us.setId_empleado(rs.getString("id_empleado"));
                us.setNo_usuario(rs.getString("no_usuario"));
                us.setPw_usuario(rs.getString("pw_usuario"));
                list.add(us);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }

        return list;

    }

    @Override
    public Usuario Edit_Usuario(String ID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean Edit_Usuario(Usuario usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean Save_Usuario(Usuario usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean Delete_Usuario(String ID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
