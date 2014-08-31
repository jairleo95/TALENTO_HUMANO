/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;

/**
 *
 * @author JAIR
 */
public interface InterfaceCarrera_UniversidadDAO {

    public List<Map<String, ?>> Tipo_Institucion(String id);

    public List<Map<String, ?>> Istitucion(String id);

    public List<Map<String, ?>> Carrera(String id);
}
