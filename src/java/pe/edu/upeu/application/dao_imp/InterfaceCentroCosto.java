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
 * @author Andres
 */
public interface InterfaceCentroCosto {
    public List<Map<String,?>> listarCcosto();
    public List<Map<String,?>> listarCcosto(String idCCosto);
    public List<Map<String, ?>> List_Direccion();
    public List<Map<String, ?>> List_Depxdir(String iddep);
    public List<Map<String, ?>> List_Arxdep(String iddep);
    public List<Map<String, ?>> List_SecxArea(String idArea);
    public boolean crearCCosto(String CO_CENTRO_COSTO, String DE_CENTRO_COSTO, String ID_DEPARTAMENTO, String ID_AREA);
    public boolean editarCCosto(String ID_CENTRO_COSTO, String CO_CENTRO_COSTO, String DE_CENTRO_COSTO, String ID_DEPARTAMENTO, String ID_AREA);
    public boolean eliminarCCosto(String ID_CENTRO_COSTO);
}
