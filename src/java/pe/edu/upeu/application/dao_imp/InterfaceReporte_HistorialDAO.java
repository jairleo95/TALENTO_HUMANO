/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;

/**
 *
 * @author Andres
 */
public interface InterfaceReporte_HistorialDAO {

    public List<Map<String, ?>> List_historial_modf_hijo(String FE_INICIO, String FE_FIN, String tipo);

    public List<Map<String, ?>> Lista_campos_modif(String fecha1, String fecha2,String id);

    public List<Map<String, ?>> Listar_Tra_Fecha(String FE_INICIO, String FE_FIN);

    public List<Map<String, ?>> Listar_His_Estado_Civil(String FE_INICIO, String FE_FIN);

    public List<Map<String, ?>> Listar_Mod_Tra(String ID_TRABAJADOR);
    public List<Map<String, ?>> Listar_hist_fecha(String FE_MODIF, String idtra);
    public List<Map<String, ?>> Listar_dat_actual(String ID_TRABAJADOR);

    public List<Map<String, ?>> ip_usuario(String IP_USUARIO);

    public List<Map<String, ?>> list_fecha_modif(String Hijo);

}
