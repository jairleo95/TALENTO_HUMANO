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
    public void Crear_Plantilla(String no_pl,String User_crea);
    public void Insertar_pertenencia(String id_plt_con,String dir,String dep,String area,String sec,String puesto,String id_user);
    public String Obt_no_arch();
    public String List_pl_con_x_id(String id_plan_con);
    public String ob_id_pl_max();
    public void Activar_pl_pu(String id_pp,String id_user);
    public void Desactivar_pl_pu(String id_pp,String id_user);
}
