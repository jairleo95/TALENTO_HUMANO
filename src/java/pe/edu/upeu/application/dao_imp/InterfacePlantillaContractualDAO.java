/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Plantilla_Contractual;
/**
 *
 * @author joserodrigo
 */
public interface InterfacePlantillaContractualDAO {
    public List<Map<String,?>> List_PLantillas(String id_puesto);
    public List<Map<String,?>> List_PLanti_x_sel(String id_pu, String id_sec, String id_are, String id_dep,String id_dir);
    public List<Map<String,?>> List_PLant_x_sel(String id_pu, String id_sec, String id_are, String id_dep,String id_dir);
    public void Crear_Plantilla(String no_pl);
    public String Obt_no_arch();
    public String List_pl_con_x_id(String id_plan_con);
}
