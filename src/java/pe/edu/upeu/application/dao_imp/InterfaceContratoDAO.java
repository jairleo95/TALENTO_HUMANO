/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.X_List_Id_Contrato_DGP;

/**
 *
 * @author Admin
 */
public interface InterfaceContratoDAO {
    public boolean Insert_Contrato ();
    public List<X_List_Id_Contrato_DGP> List_id_Contrato_DGP (String id_trabajador,String id_anno);
}
