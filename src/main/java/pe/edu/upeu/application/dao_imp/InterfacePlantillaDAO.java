/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.X_List_Plantilla;

/**
 *
 * @author Admin
 */
public interface InterfacePlantillaDAO {
    public List<X_List_Plantilla> List_Planilla(String id_direc, String id_depart,String id_seccion,String id_puesto,String id_area);
}
