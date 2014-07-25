/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.Padre_Madre_Conyugue;

/**
 *
 * @author Admin
 */
public interface InterfacePadre_Madre_ConyugueDAO {
    public boolean Insert_PMC();
    public List<Padre_Madre_Conyugue> List_PMC(String id_pmc);
}
