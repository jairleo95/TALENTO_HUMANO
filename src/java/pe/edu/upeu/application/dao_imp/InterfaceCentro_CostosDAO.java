/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Centro_Costos;

/**
 *
 * @author joserodrigo
 */
public interface InterfaceCentro_CostosDAO {

    public List<Map<String, ?>> List_centro_costo(String iddep);
    public List<Map<String, ?>> Direccion_CC();
    public List<Map<String, ?>> Departamento_CC(String iddir);
    public List<Map<String, ?>> Centro_Costo_Dep(String iddep);
    public List<Centro_Costos> List_centro_costo();
    public List<Map<String, ?>> List_centr_id(String id_dgp);
    public void Mod_det_centro(String id_det_cen, String id_contrato);
    public List<Centro_Costos> Lis_c_c_id_contr(String id_contrato);
    public  List<Map<String, ?>> Cargar_cc_dgp(String id_dgp);
}
