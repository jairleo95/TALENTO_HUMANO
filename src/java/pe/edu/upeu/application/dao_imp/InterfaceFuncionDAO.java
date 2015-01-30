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
     public List<Map<String,?>> Listar_fun_x_pu(String id_pu);
}
