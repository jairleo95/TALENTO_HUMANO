/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;

/**
 *
 * @author JAIR
 */
public interface InterfacePasoDAO {

    public List<Map<String, ?>> List_Paso(String proceso);

    public void INSERT_PASOS(String ID_PASOS, String ID_PROCESO, String DE_PASOS, String NU_PASOS, String CO_PASOS);
    public void DELETE_PASOS(String ID_PASOS);

}
