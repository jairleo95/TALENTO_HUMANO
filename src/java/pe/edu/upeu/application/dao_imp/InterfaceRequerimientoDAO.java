/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.Requerimiento;

/**
 *
 * @author Admin
 */
public interface InterfaceRequerimientoDAO {
    public List<Requerimiento> Listar_Requerimiento();
    public List<Requerimiento> id_det_proc();
    public List<Requerimiento> Validar_Req_DGP();
}
