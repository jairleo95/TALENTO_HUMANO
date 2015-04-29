/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.V_Dgp_Plazo;

/**
 *
 * @author JAIR
 */
public interface InterfacePlazo_DgpDAO {

    public List<Map<String, ?>> List_Plazo(String t_list);

    public List<V_Dgp_Plazo> Lista_detalle_plazo(String id);

    public List<Map<String, ?>> Listar_Plazo();

    public List<Map<String, ?>> Listar_Plazo_id(String id_tipo, String iddgp);

    public String fecha_maxima_plazo();

    public void INSERT_PLAZO(String ID_PLAZO, String NO_PLAZO, String DET_ALERTA, String FE_DESDE, String FE_HASTA, String ES_PLAZO, String ID_REQUERIMIENTO);

    public void UPDATE_PLAZO(String ID_PLAZO, String NO_PLAZO, String DET_ALERTA, String FE_DESDE, String FE_HASTA, String ES_PLAZO);

    public void REMOVE_PLAZO(String ID_PLAZO);

}
