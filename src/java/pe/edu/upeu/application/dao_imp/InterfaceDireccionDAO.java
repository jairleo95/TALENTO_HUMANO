/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.Direccion;
import pe.edu.upeu.application.model.Via;
import pe.edu.upeu.application.model.Zona;

/**
 *
 * @author joserodrigo
 */
public interface InterfaceDireccionDAO {
    public List<Direccion> Listar_Direccion(); 
    public List<Via> Listar_via(); 
    public List<Zona> Listar_zona(); 
}
