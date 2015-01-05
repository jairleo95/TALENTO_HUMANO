/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Seccion;

/**
 *
 * @author Jose
 */
public interface InterfaceSeccionDAO {

    public List<Seccion> LISTA_RH_SECCION();

    public String ID_SECCION(String id_puesto);

    public List<Map<String, ?>> List_sec_id(String id_are);

    public List<Map<String, ?>> List_pu_id(String id_pu);
    
    public List<Map<String, ?>> selec_sec(String id_pu);
}
