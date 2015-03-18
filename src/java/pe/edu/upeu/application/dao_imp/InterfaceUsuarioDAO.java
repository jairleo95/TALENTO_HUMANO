/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import pe.edu.upeu.application.model.Usuario;
import java.util.List;
import pe.edu.upeu.application.model.Trabajador;
import pe.edu.upeu.application.model.V_Usuario;
import pe.edu.upeu.application.model.V_Var_Usuario;

/**
 *
 * @author Alfa.sistemas
 */
public interface InterfaceUsuarioDAO {

    public List<Usuario> List_Usuario();

    public List<V_Usuario> Val_Usuario(String Usuario, String PWD);
    
    public List<Usuario> USER_LOGIN(String Usuario, String PWD);

    public int Val_Cuenta(int Usuario);

    public boolean Mod_perfil(Usuario proveedor, Trabajador trabajador);

    public List<V_Usuario> Val_Usuario(String id_usuario);

    public void Mod_Pw(String id_usuario, String usuario, String clave);

    public void Delete_Usuario(String ID);

    public List<Usuario> List_ID_User(String id_user);

    public void Insert_usuario(String No_usuario, String pw_usuario, String id_emp, String id_rol, String es_usuario);

    public void Mod_rol_usuario(String id_usuario, String IDROLES, String no_user);

    public void Activar_usuario(String id_usuario);

    public void Desactivar_usuario(String id_usuario);

    public List<V_Var_Usuario> List_Usuario_var();

    public List<V_Var_Usuario> List_Usuario_var_id(String id_usu);

    public void Mod_perfil(String ID_USUARIO, String NO_USUARIO_SP, String PW_USUARIO_SP, String TE_TRABAJADOR, String CL_TRA, String DI_CORREO_PERSONAL, String ID_DEPARTAMENTO, String ID_PROVINCIA, String LI_DI_DOM_A_D1, String DI_DOM_A_D2,
            String LI_DI_DOM_A_D3, String DI_DOM_A_D4, String LI_DI_DOM_A_D5, String DI_DOM_A_D6, String DI_DOM_A_REF, String ID_DI_DOM_A_DISTRITO , String ID_TRABAJADOR);
}
