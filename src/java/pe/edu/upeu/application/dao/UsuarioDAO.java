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
import pe.edu.upeu.application.model.Trabajador;
import pe.edu.upeu.application.model.V_Usuario;

/**
 *
 * @author Alfa.sistemas
 */
public class UsuarioDAO implements InterfaceUsuarioDAO {

    ConexionBD conn;

    @Override
    public List<Usuario> List_Usuario() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql="SELECT * FROM RHTC_USUARIO";
        List<Usuario> list = new ArrayList<Usuario>();
        try {
            ResultSet rs = this.conn.query(sql);
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
    public List<V_Usuario> Val_Usuario(String Usuario, String PWD) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        //StringBuilder sql = new StringBuilder();
        String sql = "select * from rhvd_usuario where no_usuario='" + Usuario.trim() + "' and pw_usuario='" + PWD + "'";
        List<V_Usuario> list = new ArrayList<V_Usuario>();
        try {
            ResultSet rs = this.conn.query(sql.toString());
            while (rs.next()) {
                V_Usuario us = new V_Usuario();
                us.setId_usuario(rs.getString("id_usuario"));
                us.setId_rol(rs.getString("id_rol"));
                us.setId_empleado(rs.getString("id_empleado"));
                us.setNo_usuario(rs.getString("no_usuario"));
                us.setPw_usuario(rs.getString("pw_usuario"));
                us.setId_puesto(rs.getString("id_puesto"));
                us.setId_area(rs.getString("id_area"));
                us.setNo_area(rs.getString("no_area"));
                us.setNo_dep(rs.getString("no_dep"));
                us.setId_departamento(rs.getString("id_departamento"));
                us.setNo_puesto(rs.getString("no_puesto"));
                list.add(us);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }

        return list;

    }

    @Override
    public int Val_Cuenta(int Usuario) {

        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select count(*) from rhtc_usuario where usuario = '" + Usuario + "'";
        int num = 0;
        try {
            ResultSet rs = this.conn.query(sql.toString());

            while (rs.next()) {
                num = rs.getInt(1);
            }

            if (num >= 1) {
                num = 1;
            } else {
                num = 0;
            }

        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return num;

    }

    @Override
    public boolean Mod_perfil(Usuario proveedor, Trabajador trabajador) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        boolean save = false;
        /*try {
         StringBuilder sql = new StringBuilder();
         sql.append("UPDATE rhtc_usuario set no_usuario)VALUES(").append(proveedor.getId());
         sql.append(", '").append(proveedor.getProv());
         sql.append("', '").append(proveedor.getRuc());
         sql.append("', '").append(proveedor.getDir());
         sql.append("', '").append(proveedor.getTel());
         sql.append("', '").append(proveedor.getEst()).append("')");
         } catch (SQLException e) {
         } finally {
         this.conn.close();
         }*/

        return save;

    }

    @Override
    public List<V_Usuario> Val_Usuario(String id_usuario) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);

        String sql = "select * from rhvd_usuario where id_usuario='" + id_usuario + "'";
        List<V_Usuario> list = new ArrayList<V_Usuario>();
        try {
            ResultSet rs = this.conn.query(sql.toString());
            while (rs.next()) {
                V_Usuario us = new V_Usuario();
                us.setId_usuario(rs.getString("id_usuario"));
                us.setId_rol(rs.getString("id_rol"));
                us.setId_empleado(rs.getString("id_empleado"));
                us.setNo_usuario(rs.getString("no_usuario"));
                us.setPw_usuario(rs.getString("pw_usuario"));
                us.setId_puesto(rs.getString("id_puesto"));
                us.setId_area(rs.getString("id_area"));
                us.setNo_area(rs.getString("no_area"));
                us.setNo_dep(rs.getString("no_dep"));
                us.setId_departamento(rs.getString("id_departamento"));
                us.setNo_puesto(rs.getString("no_puesto"));
                list.add(us);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }

        return list;
    }

    @Override
    public boolean Mod_Pw(String nombre, String usuario, String clave) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select count(*) from rhtc_usuario where no_usuario='" + nombre + "' and id_usuario='" + usuario + "' and pw_usuario='" + clave + "'";
        /*$sql = "select count(*) from usuario where usuario='$user' and idusuario=$iduser and clave='$clave'";
         //echo $sql;

         $exe = oci_parse(Conexion::conex(), $sql);
         oci_execute($exe);
         $row = oci_fetch_array($exe);
         $id = $row[0];
         if ($id == 1) {
         $sql_u = "update usuario set clave='$clave_nueva' where idusuario=$iduser";
         $exe_u = oci_parse(Conexion::conex(), $sql_u);
         oci_execute($exe_u);
         }
         if ($id == 0) {
         echo '<script language="JavaScript" type="text/javascript">
         alert("Las Claves son Incorrectas");
         window.history.back();
         </script> ';
         }*/
        return false;
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
    @Override
    public List<Usuario> List_ID_User(String id_user) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql="select * from RHTC_USUARIO where ID_USUARIO ='"+id_user+"'";
        List<Usuario> list = new ArrayList<Usuario>();
        try {
            ResultSet rs = this.conn.query(sql);
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
}
