/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Departamento;

/**
 *
 * @author Admin
 */
public interface InterfaceDepartamentoDAO {

    public List<Departamento> List_Departamento();

    public List<Departamento> List_Departamento_Lima();

    public List<Map<String, ?>> List_departamento_2();

    public List<Map<String, ?>> dep_id(String id_pu);

    public List<Map<String, ?>> Listar_dep_id(String id);

    public List<Map<String, ?>> Listar_dep_x_dir(String id_de);

    //Mantenimiento
    public boolean Editar_Dep(String id, String nombre, String ncorto, String estado, String idDir);

    public boolean Crear_Dep(String nombre, String ncorto, String estado, String idDir);

    public boolean Eliminar_Dep(String id);

    public boolean Activar_Dep(String id);

    public boolean Desactivar_Dep(String id);

    public List<Map<String, ?>> Listar_dep_x_es(String idDir);

}
