/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.Detalle_Privilegio;
import pe.edu.upeu.application.model.Rol;


/**
 *
 * @author Jose
 */
public interface InterfaceRolDAO  {
   
     public List<Rol> List_Rol();
     public List<Detalle_Privilegio> listarURL( String idrol);
     public boolean INSERT_ROLES( String idrol);
}
