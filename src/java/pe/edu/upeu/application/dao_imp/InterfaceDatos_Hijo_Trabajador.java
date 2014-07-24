/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.Datos_Hijo_Trabajador;

/**
 *
 * @author Jose
 */
public interface InterfaceDatos_Hijo_Trabajador {
    public List<Datos_Hijo_Trabajador> LISTA_HIJOS(String id);
     
}
