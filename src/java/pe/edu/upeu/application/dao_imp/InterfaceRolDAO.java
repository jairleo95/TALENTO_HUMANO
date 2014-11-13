/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;

import pe.edu.upeu.application.model.Rol;
import pe.edu.upeu.application.model.V_Privilegio;

/**
 *
 * @author Jose
 */
public interface InterfaceRolDAO {

    public List<Rol> List_Rol();

    public List<V_Privilegio> listarURL(String idrol);

    public void INSERT_ROLES(String no_rol);
    
    public void Eliminar_Roles(String id_rol);
}
