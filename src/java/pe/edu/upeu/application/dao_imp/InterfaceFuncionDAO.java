/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Funciones;

/**
 *
 * @author joserodrigo
 */
public interface InterfaceFuncionDAO {
     public List<Funciones> Listar_funciones();
     public List<Map<String,?>> Listar_Funciones();
     public List<Map<String,?>> Listar_fun_x_pu(String id_pu);
     public void Insertar_funcion(String id_pu,String de_fu, String user_crea);
     public boolean Modificar_funcion(String id_fun, String es_fun, String de_fun,String id_pu, String us_mod);
     public void Eliminar_funcion(String id_fun);
}
