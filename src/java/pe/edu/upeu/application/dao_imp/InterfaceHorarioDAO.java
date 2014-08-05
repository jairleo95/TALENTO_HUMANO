/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.V_Horario;

/**
 *
 * @author Admin
 */
public interface InterfaceHorarioDAO {
    public void Insert_Horario(String ID_HOR, String HO_DESDE,String HO_HASTA,String DIA_HOR,String ES_HOR,String ID_DET_HOR);
    public void Insert_Detalle_Horario(String ID_DET_HOR,String ID_DGP,String ES_DE_HOR,String US_CRE,String FE_CRE,String US_MODIF,String FE_MODIF);
    public String Max_id_Detalle_Horario ();
    public List<V_Horario> List_V_Horario (String iddgp);
}
