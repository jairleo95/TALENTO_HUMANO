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
     public List<Map<String,?>> Listar_dep_x_dir(String id_de);
     public List<Map<String,?>> Listar_ar_x_dep(String id_ar);
     public List<Map<String,?>> Listar_sec_x_area(String id_se);
     public List<Map<String,?>> Listar_pu_x_sec(String id_pu);
     public void Insertar_funcion(String id_pu,String de_fu, String user_crea, String tipo_funcion);
     public boolean Modificar_funcion(String id_fun, String es_fun, String de_fun,String id_pu, String us_mod,String tipo_funcion );
     public void Eliminar_funcion(String id_fun);
}
