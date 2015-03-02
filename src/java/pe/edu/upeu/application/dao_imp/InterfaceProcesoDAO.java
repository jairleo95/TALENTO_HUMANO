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
 * @author ALFA 3
 */
public interface InterfaceProcesoDAO {

    public List<Map<String, ?>> List_Proceso();

    public List<Map<String, ?>> List_Pro_Paso_Id(String id_req, String id_pro, String id_dir, String id_dep, String id_area,String id_ti_planilla);
}
