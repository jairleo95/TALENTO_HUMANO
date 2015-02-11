/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Carrera;
import pe.edu.upeu.application.model.Tipo_Institucion;
import pe.edu.upeu.application.model.Universidad;

/**
 *
 * @author JAIR
 */
public interface InterfaceCarrera_UniversidadDAO {

    public List<Map<String, ?>> Tipo_Institucion(String id);

    public List<Tipo_Institucion> List_Tipo_Ins();
    public List<Map<String, ?>> Istitucion(String id);

    public List<Map<String, ?>> Carrera(String id);
    public List<Carrera> List_Carrera();
 }
