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

    public List<Map<String, ?>> Listar_Plazo(String tipo,String req,int dias,String dep);

    public List<Map<String, ?>> Listar_Plazo_id(String id_tipo, String iddgp);

    public String fecha_maxima_plazo();

    public String INSERT_PLAZO(String ID_PLAZO, String NO_PLAZO, String DET_ALERTA, String FE_DESDE, String FE_HASTA, String ES_PLAZO, String ID_REQUERIMIENTO, String TI_PLAZO, int CA_DIAS_TOLERANCIA, String ID_DEPARTAMENTO_TOLERANCIA);

    public void UPDATE_PLAZO(String ID_PLAZO, String NO_PLAZO, String DET_ALERTA, String FE_DESDE, String FE_HASTA, String ES_PLAZO);

    public void REMOVE_PLAZO(String ID_PLAZO);
    
    public void validar_Vig_plazos();

    public String HABILITAR_FECHA(String tipo, String req, String dia, String dep);
    
    public void Validar_Cumplimiento_plazo_t2();
    public int Validar_cumple_dias_pt2(String dgp);
    
    public void Validar_Cumplimiento_plazo_t1();

}
