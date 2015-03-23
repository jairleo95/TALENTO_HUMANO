/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Direccion;
import pe.edu.upeu.application.model.Via;
import pe.edu.upeu.application.model.Zona;

/**
 *
 * @author joserodrigo
 */
public interface InterfaceDireccionDAO {

    /**
     * direccion del organigrama de la universidad
     *
     * @return
     */
    public List<Direccion> Listar_Direccion();
    public List<Map<String, ?>> List_Direccion();
    /*direccion de ubicacion geografica*/
    public List<Via> Listar_via();
    public List<Zona> Listar_zona();
    //Mantenimiento
    public boolean Editar_Direccion(String id, String nombre, String ncorto, String estado, String filial);
    public boolean Crear_Direccion(String nombre, String ncorto, String estado, String filial);
    public boolean Eliminar_Direccion(String id);
}
