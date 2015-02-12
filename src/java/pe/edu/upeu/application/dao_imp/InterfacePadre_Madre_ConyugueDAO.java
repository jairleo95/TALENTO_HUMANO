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
 public void INSERT_PADRE_MADRE_CONYUGUE(String ES_TRABAJA_UPEU_CONYUGUE, String AP_NOMBRES_CONYUGUE, String FE_NAC_CONYUGUE, String TI_DOC_ID, String NU_DOC, String LI_INSCRIPCION_VIG_ESSALUD, String US_MODIF, String FE_MODIF, String IP_USUARIO, String ID_TRABAJADOR, String ID_CONYUGUE) ;
  public List<Padre_Madre_Conyugue> List_PMC(String id_pmc);
  public void MOD_PADRE_MADRE_CONYUGUE(String AP_NOMBRES_PADRE, String AP_NOMBRES_MADRE, String ES_TRABAJA_UPEU_CONYUGUE, String AP_NOMBRES_CONYUGUE, String FE_NAC_CONYUGUE, String TI_DOC_ID, String NU_DOC, String LI_INSCRIPCION_VIG_ESSALUD, String US_MODIF, String FE_MODIF, String ID_TRABAJADOR);
  
}
