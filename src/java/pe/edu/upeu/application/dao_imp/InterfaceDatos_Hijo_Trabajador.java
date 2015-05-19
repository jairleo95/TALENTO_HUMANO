/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Datos_Hijo_Trabajador;

/**
 *
 * @author Jose
 */
public interface InterfaceDatos_Hijo_Trabajador {

    public List<Datos_Hijo_Trabajador> LISTA_HIJOS(String id);

    public List<Datos_Hijo_Trabajador> LISTA_HIJO(String idHijo, String idtr);

    public void INSERT_DATOS_HIJO_TRABAJADOR(String ID_DATOS_HIJOS_TRABAJADOR, String ID_TRABAJADOR, String AP_PATERNO, String AP_MATERNO, String NO_HIJO_TRABAJADOR, String FE_NACIMIENTO, String ES_SEXO, String ES_TIPO_DOC, String NU_DOC, String ES_PRESENTA_DOCUMENTO, String ES_INSCRIPCION_VIG_ESSALUD, String ES_ESTUDIO_NIV_SUPERIOR, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, String ES_DATOS_HIJO_TRABAJADOR);

    public int ASIGNACION_F(String idtr);

    public void MOD_HIJOS_TRAB(String ID_DATOS_HIJOS_TRABAJADOR, String AP_PATERNO, String AP_MATERNO, String NO_HIJO_TRABAJADOR, String FE_NACIMIENTO, String ES_SEXO, String ES_TIPO_DOC, String NU_DOC, String ES_INSCRIPCION_VIG_ESSALUD, String ES_ESTUDIO_NIV_SUPERIOR, String id_usuario);

    public void ELIMINAR_HIJO(String id_hijo, String id_trabajador);

    public List<Map<String, ?>> Listar_hijo_filtro(String desde, String hasta,String edad);
    
    public List<Map<String,?>> Listar_Cumpleaños(String mes, String dia, String aps);
}
