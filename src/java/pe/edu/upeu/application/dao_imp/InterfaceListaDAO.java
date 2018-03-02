/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Auto_Mostrar;
import pe.edu.upeu.application.model.Carrera;
import pe.edu.upeu.application.model.Nacionalidad;
import pe.edu.upeu.application.model.Proceso;
import pe.edu.upeu.application.model.Situacion_Educativa;
import pe.edu.upeu.application.model.Tipo_Contrato;
import pe.edu.upeu.application.model.Universidad;
import pe.edu.upeu.application.model.Via;
import pe.edu.upeu.application.model.Zona;

/**
 *
 * @author Admin
 */
public interface InterfaceListaDAO {
    public List<Nacionalidad> List_Nacionalidad();
    public List<Proceso> List_Proceso();
    public List<Carrera> List_Carrera();
    public List<Universidad> List_Universidad();
    public List<Situacion_Educativa> List_Situacion_Educativa();
    
    public List<Auto_Mostrar> List_Auto_mostrar(String id_rol);
    public List<String> List_Estado_Civil();
    public List<String> List_Doc();
    public List<String> List_Gs();
    public List<String> List_Sp();
    public List<String> List_Nom_AFP();
    public List<String> List_Nivel_Educativo();
    public List<String> List_Grado_Academico();
    public List<Via> List_Dom_D1_Id();
    public List<String> List_Dom_D3_Id();
    public List<Zona> List_Dom_D5_Id();
    public List<String> List_Jefe();
    public Map<String,String> list_Condicion_contrato();
    public List<Map<String,String>> listCondicionContratoJson();
    public List<Tipo_Contrato> List_tipo_contrato();
    public List<String> List_Situacion_Actual();
    
    public List<String> lista_años();

    public String[][] List_H();

 }
