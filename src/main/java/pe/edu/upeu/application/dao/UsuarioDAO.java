/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
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
import pe.edu.upeu.application.model.V_Var_Usuario;
import pe.edu.upeu.application.properties.UserMachineProperties;

/**
 *
 * @author Alfa.sistemas
 */
public class UsuarioDAO implements InterfaceUsuarioDAO {

    ConexionBD conn;

    @Override
    public List<Usuario> List_Usuario() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHTC_USUARIO";
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
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }

        return list;

    }

    @Override
    public List<Usuario> USER_LOGIN(String Usuario, String PWD) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHTC_USUARIO where no_usuario='" + Usuario.trim() + "' and pw_usuario='" + PWD.trim() + "'";
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
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }

        return list;

    }

    @Override
    public List<V_Usuario> Val_Usuario(String Usuario, String PWD) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhvd_usuario where no_usuario='" + Usuario.trim() + "' and pw_usuario='" + PWD + "'";
        List<V_Usuario> list = new ArrayList<V_Usuario>();
        try {
            ResultSet rs = this.conn.query(sql.toString());
            while (rs.next()) {
                V_Usuario us = new V_Usuario();
                us.setId_usuario(rs.getString("id_usuario").trim());
                us.setId_trabajador(rs.getString("id_trabajador"));
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
                us.setNo_seccion(rs.getString("no_seccion"));
                us.setNo_trabajador(rs.getString("no_trabajador"));
                us.setAp_paterno(rs.getString("ap_paterno"));
                us.setAp_materno(rs.getString("ap_materno"));
                us.setAr_foto(rs.getString("ar_foto"));
                us.setId_direccion(rs.getString("id_direccion"));

                list.add(us);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
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

        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
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
                V_Usuario v = new V_Usuario();

                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setId_usuario(rs.getString("id_usuario"));
                v.setId_rol(rs.getString("id_rol"));
                v.setId_empleado(rs.getString("id_empleado"));
                v.setNo_usuario(rs.getString("no_usuario"));
                v.setPw_usuario(rs.getString("pw_usuario"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setId_puesto(rs.getString("id_puesto"));
                v.setNo_area(rs.getString("no_area"));
                v.setId_area(rs.getString("id_area"));
                v.setNo_dep(rs.getString("no_dep"));
                v.setId_departamento(rs.getString("id_departamento"));
                v.setNo_direccion(rs.getString("no_direccion"));
                v.setId_direccion(rs.getString("id_direccion"));
                v.setId_seccion(rs.getString("id_seccion"));
                v.setNo_seccion(rs.getString("no_seccion"));
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setCl_tra(rs.getString("cl_tra"));
                v.setTe_trabajador(rs.getString("te_trabajador"));
                v.setLi_di_dom_a_d1(rs.getString("li_di_dom_a_d1"));
                v.setDi_dom_a_d2(rs.getString("di_dom_a_d2"));
                v.setLi_di_dom_a_d3(rs.getString("li_di_dom_a_d3"));
                v.setDi_dom_a_d4(rs.getString("di_dom_a_d4"));
                v.setLi_di_dom_a_d5(rs.getString("li_di_dom_a_d5"));
                v.setDi_dom_a_d6(rs.getString("di_dom_a_d6"));
                v.setDi_dom_a_ref(rs.getString("di_dom_a_ref"));
                v.setDi_correo_personal(rs.getString("di_correo_personal"));
                v.setDi_correo_inst(rs.getString("di_correo_inst"));
                v.setLi_religion(rs.getString("li_religion"));
                v.setNo_iglesia(rs.getString("no_iglesia"));
                v.setDe_cargo(rs.getString("de_cargo"));
                v.setLi_autoridad(rs.getString("li_autoridad"));
                v.setNo_ap_autoridad(rs.getString("no_ap_autoridad"));
                v.setCl_autoridad(rs.getString("cl_autoridad"));
                v.setId_distrito_ub(rs.getString("id_distrito_ub"));
                v.setId_provincia_ub(rs.getString("id_provincia_ub"));
                v.setId_departamento_ub(rs.getString("id_departamento_ub"));
                v.setNo_departamento_ub(rs.getString("no_departamento_ub"));
                v.setNo_provincia_ub(rs.getString("no_provincia_ub"));
                v.setNo_distrito_ub(rs.getString("no_distrito_ub"));

                list.add(v);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return list;
    }

    @Override
    public void Mod_Pw(String id_usuario, String usuario, String clave) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_MOD_USUARIO_CL( ?,?,?)}");
            cst.setString(1, id_usuario);
            cst.setString(2, usuario);
            cst.setString(3, clave);
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public void Delete_Usuario(String ID) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_ELIMINAR_USUARIO(?)}");
            cst.setString(1, ID);
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public List<Usuario> List_ID_User(String id_user) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from RHTC_USUARIO where ID_USUARIO ='" + id_user + "'";
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
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return list;
    }

    @Override
    public void Insert_usuario(String No_usuario, String pw_usuario, String id_emp, String id_rol, String es_usuario) {
        CallableStatement cst;
        try {
            String id_usuario = "";
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_INSERT_USUARIO( ?,?,?,?,?,?)}");
            cst.setString(1, id_usuario);
            cst.setString(2, No_usuario);
            cst.setString(3, pw_usuario);
            cst.setString(4, id_emp);
            cst.setString(5, id_rol);
            cst.setString(6, es_usuario);
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public List<V_Var_Usuario> List_Usuario_var() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from RHVD_VAR_USUARIO order by ap_paterno";
        List<V_Var_Usuario> list = new ArrayList<V_Var_Usuario>();
        try {
            ResultSet rs = this.conn.query(sql.toString());
            while (rs.next()) {
                V_Var_Usuario v = new V_Var_Usuario();
                v.setId_usuario(rs.getString("id_usuario"));
                v.setNo_usuario(rs.getString("no_usuario"));
                v.setPw_usuario(rs.getString("pw_usuario"));
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setNo_rol(rs.getString("no_rol"));
                v.setId_rol(rs.getString("id_rol"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setId_puesto(rs.getString("id_puesto"));
                v.setNo_seccion(rs.getString("no_seccion"));
                v.setId_seccion(rs.getString("id_seccion"));
                v.setNo_area(rs.getString("no_area"));
                v.setId_area(rs.getString("id_area"));
                v.setNo_dep(rs.getString("no_dep"));
                v.setId_departamento(rs.getString("id_departamento"));
                v.setEs_usuario(rs.getString("es_usuario"));
                list.add(v);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }

        return list;
    }

    @Override
    public List<V_Var_Usuario> List_Usuario_var_id(String id_usu) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from RHVD_VAR_USUARIO where id_usuario='" + id_usu + "'";
        List<V_Var_Usuario> list = new ArrayList<V_Var_Usuario>();
        try {
            ResultSet rs = this.conn.query(sql.toString());
            while (rs.next()) {
                V_Var_Usuario v = new V_Var_Usuario();
                v.setId_usuario(rs.getString("id_usuario"));
                v.setNo_usuario(rs.getString("no_usuario"));
                v.setPw_usuario(rs.getString("pw_usuario"));
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setNo_rol(rs.getString("no_rol"));
                v.setId_rol(rs.getString("id_rol"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setId_puesto(rs.getString("id_puesto"));
                v.setNo_seccion(rs.getString("no_seccion"));
                v.setId_seccion(rs.getString("id_seccion"));
                v.setNo_area(rs.getString("no_area"));
                v.setId_area(rs.getString("id_area"));
                v.setNo_dep(rs.getString("no_dep"));
                v.setId_departamento(rs.getString("id_departamento"));
                v.setEs_usuario(rs.getString("es_usuario"));
                list.add(v);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }

        return list;
    }

    @Override
    public void Mod_rol_usuario(String id_usuario, String IDROLES, String no_user) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_MOD_USUARIO_ROL( ?,?,?)}");
            cst.setString(1, id_usuario);
            cst.setString(2, IDROLES);
            cst.setString(3, no_user);
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public void Activar_usuario(String id_usuario) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_ACTIVAR_USUARIO( ?)}");
            cst.setString(1, id_usuario);
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public void Desactivar_usuario(String id_usuario) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_DESACTIVAR_USUARIO( ?)}");
            cst.setString(1, id_usuario);
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public void Mod_perfil(String ID_USUARIO, String NO_USUARIO, String PW_USUARIO, String TE_TRABAJADOR, String CL_TRA, String DI_CORREO_PERSONAL, String ID_DEPARTAMENTO, String ID_PROVINCIA, String LI_DI_DOM_A_D1, String DI_DOM_A_D2,
            String LI_DI_DOM_A_D3, String DI_DOM_A_D4, String LI_DI_DOM_A_D5, String DI_DOM_A_D6, String DI_DOM_A_REF, String ID_DI_DOM_A_DISTRITO, String ID_TRABAJADOR, String US_MODIF, String IP_USUARIO) {
        CallableStatement cst;
        try {

            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_MOD_PERFIL( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, ?, ?)}");
            cst.setString(1, ID_USUARIO);
            cst.setString(2, NO_USUARIO);
            cst.setString(3, PW_USUARIO);
            cst.setString(4, TE_TRABAJADOR);
            cst.setString(5, CL_TRA);
            cst.setString(6, DI_CORREO_PERSONAL);
            cst.setString(7, ID_DEPARTAMENTO);
            cst.setString(8, ID_PROVINCIA);
            cst.setString(9, LI_DI_DOM_A_D1);
            cst.setString(10, DI_DOM_A_D2);
            cst.setString(11, LI_DI_DOM_A_D3);
            cst.setString(12, DI_DOM_A_D4);
            cst.setString(13, LI_DI_DOM_A_D5);
            cst.setString(14, DI_DOM_A_D6);
            cst.setString(15, DI_DOM_A_REF);
            cst.setString(16, ID_DI_DOM_A_DISTRITO);

            cst.setString(17, ID_TRABAJADOR);
            cst.setString(18, US_MODIF);
            cst.setString(19, IP_USUARIO);

            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }

    }

    @Override
    public String fecha_actual() {
        String fecha = "";
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT TO_CHAR(sysdate,'yyyy-mm-dd','nls_date_language=spanish') FROM dual";
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                fecha = rs.getString(1);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return fecha;
    }

    @Override
    public void Mod_Clave(String id_usuario, String pwd, String us_modif) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_MOD_USUARIO_CLAVE( ?,?,?,?)}");
            cst.setString(1, id_usuario);
            cst.setString(2, pwd);
            cst.setString(3, us_modif);
            cst.setString(4, UserMachineProperties.getAll());
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public Boolean validateIfUserNameExists(String userName) {
        Boolean x = false;
        int count = 0;
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select count(*) from rhtc_usuario where no_usuario='" + userName + "'";
        try {
            ResultSet rs = this.conn.query(sql);
            if (rs.next()) {
                count = rs.getInt(1);
                if (count > 0) {
                    x = true;
                }
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return x;
    }
}
