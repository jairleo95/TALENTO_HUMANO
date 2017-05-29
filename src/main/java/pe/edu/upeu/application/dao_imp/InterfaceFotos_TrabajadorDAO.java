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
 * @author Alfa.sistemas
 */
public interface InterfaceFotos_TrabajadorDAO {
    public String List_id_Fotos_Trabajador(String idtr);
    public void INSERT_FOTOS_TRABAJADOR(String ID_FOTO, String DE_FOTO, String AR_FOTO, String NO_AR_FOTO, String TA_AR_FOTO, String TI_AR_FOTO, String ID_TRABAJADOR);
    public List<Map<String, ?>> Fotos_usuario(String idtr,String tipo);
      
    }
