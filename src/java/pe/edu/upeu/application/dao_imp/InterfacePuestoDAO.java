/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.Puesto;

/**
 *
 * @author Admin
 */
public interface  InterfacePuestoDAO {
    public boolean Guardar_Puesto();
    public boolean Eliminar_Puesto();
    public List<Puesto> List_Puesto();
    public List<Puesto> List_Id_Puesto( String id_puesto);
    public boolean Modif_Puesto(String id_puesto,String no_puesto, String no_corto_pu,String es_puesto,String id_seccion,String co_grupo);
    
}
