/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 *
 * @author joserodrigo
 */
public interface InterfacePlantillaContractualDAO {
    public List<Map<String,?>> List_PLantillas(String id_dir,String id_dep,String id_area,String id_sec,String id_puesto);
}
