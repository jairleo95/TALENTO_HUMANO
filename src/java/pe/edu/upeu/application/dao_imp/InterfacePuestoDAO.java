/*
 +

 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Puesto;
import pe.edu.upeu.application.model.V_Puesto_Direccion;

/**
 *
 * @author Admin
 */
public interface InterfacePuestoDAO {

    public boolean Guardar_Puesto();

    public void Registrar_Puesto_Paso(String ID_DETALLE_PASOS, String ID_PASOS, String ID_PUESTO, String ES_DETALLE_PASOS, String CO_PUESTO);

    public boolean Eliminar_Puesto();

    public List<Puesto> List_Puesto();

    public List<Puesto> List_Puesto_lima();

    public String List_Puesto_x_iddgp(String id_dgp);

    public List<V_Puesto_Direccion> List_Puesto_Dep(String id_departamento);

    public List<V_Puesto_Direccion> List_Det_Puesto();

    public List<Puesto> List_Id_Puesto(String id_puesto);

    public boolean Modif_Puesto(String id_puesto, String no_puesto, String no_corto_pu, String es_puesto, String id_seccion, String co_grupo);

    public List<Map<String, ?>> Listar_Puesto_id(String id);

    public List<Map<String, ?>> List_puesto();
    
    public String puesto(String id_cto);
}
