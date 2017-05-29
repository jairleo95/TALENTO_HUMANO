/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Sub_Modalidad;

/**
 *
 * @author joserodrigo
 */
public interface InterfaceSub_ModalidadDAO {

    public List<Sub_Modalidad> Listar_Sub_mo();
    
    public List<Map<String, ?>> Listar_Sub_mo_x_mod(String id_mod);

    public String id_mod_x_id_con(String id_con);
}
