/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Privilegio_Rol;

import pe.edu.upeu.application.model.Rol;
import pe.edu.upeu.application.model.V_Privilegio;
import pe.edu.upeu.application.model.V_Rol;

/**
 *
 * @author Jose
 */
public interface InterfaceRolDAO {

    public List<Rol> List_Rol();

    public List<V_Privilegio> listarURL(String idrol,String id_modulo);

    public List<V_Privilegio> LISTAR_MODULOS(String idrol);

    public void INSERT_ROLES(String no_rol, String es_rol);

    public void Mod_Rol(String Id_rol, String No_Rol, String Es_Rol);

    public void Desactivar_Roles(String id_rol);

    public void Activar_Roles(String id_rol);

    public List<Privilegio_Rol> Listar_Rol_Privilegio(String id_rol);

    public List<Rol> Listar_Rol_id(String id_rol);

    public void Eliminar_rol(String id_Rol);
    
    public List<Map<String,?>> List_rol();
    public List<Map<String,?>> List_rol(String idRol);

}
