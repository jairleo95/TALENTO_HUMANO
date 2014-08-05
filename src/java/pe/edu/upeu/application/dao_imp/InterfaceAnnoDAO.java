/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.Anno;
import pe.edu.upeu.application.model.Contrato;


/**
 *
 * @author Admin
 */
public interface InterfaceAnnoDAO {
    public List<Anno> List_Anno();
    public String List_Anno_Max_Cont(String id_Trabajador); 
    public List<Contrato> List_A_Cont (String id_dgp);
}
