/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Requerimiento;

/**
 *
 * @author Admin
 */
public interface InterfaceRequerimientoDAO {

    public List<Requerimiento> Listar_Requerimiento();

    public String id_det_req_proc(String iddgp,String motivo);

    public List<Map<String, ?>> List_Req_tipo_planilla(String id_tp);

    public List<Map<String, ?>> List_planilla();

    public List<Map<String, ?>> List_requerimiento(String id);
}
