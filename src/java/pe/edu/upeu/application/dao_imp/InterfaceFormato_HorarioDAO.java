/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Formato_Horario;
import pe.edu.upeu.application.model.Tipo_Horario;

/**
 *
 * @author Alex
 */
public interface InterfaceFormato_HorarioDAO {
    public void Insert_Horario(String ID_TIPO_HORARIO,String NO_HORARIO, String DE_HORARIO, String ES_HORARIO, Double CA_HORAS);
    public List<Tipo_Horario> Listar_Tipo_Horario ();
    public List<Map<String, ?>> List_Tipo_Horario();
    public List<Map<String, ?>> List_Formato_h(String id_th);
    public void Insert_Formato_Horario(String ID_FORMATO_HORARIO, String NO_TURNO, String NO_DIA, String HO_DESDE, String HO_HASTA, String ES_F_HORARIO, String ID_TIPO_HORARIO);
    public List<Formato_Horario> Listar_Formato_Horario(String idth);
}
