/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Padre_Madre_Conyugue;

/**
 *
 * @author Admin
 */
public interface InterfacePadre_Madre_ConyugueDAO {

    public void INSERT_CONYUGUE(String ES_TRABAJA_UPEU_CONYUGUE, String AP_NOMBRES_CONYUGUE, String FE_NAC_CONYUGUE, String TI_DOC_ID, String NU_DOC, String LI_INSCRIPCION_VIG_ESSALUD, String US_MODIF, String IP_USUARIO, String ID_TRABAJADOR, String ID_CONYUGUE);


    public void MOD_PADRE_MADRE_CONYUGUE(String AP_NOMBRES_PADRE, String AP_NOMBRES_MADRE, String ES_TRABAJA_UPEU_C, String AP_NOMBRES_C, String FE_NAC, String ID_TIPO_DOC_C, String NU_DOC_C, String LI_INSCRIPCION_VIG_ESSALUD_C, String ID_TRABAJADOR, String US_MODIF, String IP_USUARIO);

    public void INSERT_PADRES(String AP_NOMBRES_MADRE, String AP_NOMBRES_PADRE, String ID_TRABAJDOR, String US_MODIF, String IP_USUARIO);

    public List<Map<String, ?>> Listar_Padres(String id);

    public boolean MOD_PADRES(String AP_NOMBRES_PADRE, String AP_NOMBRES_MADRE, String ID_TRABAJADOR, String USER);
}
