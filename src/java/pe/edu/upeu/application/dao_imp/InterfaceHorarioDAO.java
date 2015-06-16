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
    public void ELIMINAR_HORARIO(String ID_DET_HORARIO);
    public String Insert_Detalle_Horario(String ID_DET_HOR,String ID_DGP,String ES_DE_HOR,String US_CRE,String FE_CRE,String US_MODIF,String FE_MODIF, String ID_TIPO_HORARIO, String ES_MOD_FORMATO,Double ca_h_total );
    public void modificar_horario(String ho_desde,String ho_hasta,String id_horario);
    public String Max_id_Detalle_Horario ();
    public String id_det_horario (String id_dgp);
    public String id_detalle_horario (String id_dgp);
    public List<V_Horario> List_V_Horario (String iddgp);
    public String Insert_Det_Hor_Casos_Esp(String ID_DET_HOR, String ID_DGP, String ES_DE_HOR, String US_CRE, String FE_CRE, String US_MODIF, String FE_MODIF, String ID_TIPO_HORARIO, String ES_MOD_FORMATO,Double ca_h_total);
}
