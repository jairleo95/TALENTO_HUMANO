/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

/**
 *
 * @author joserodrigo
 */
public interface InterfaceDetalle_PrivilegioDAO {
    public void Registrar_Detalle_Priv (String id_rol,String nu_orden, String id_priv, String es_detalle_priv);
    public void Mod_Detalle_Priv (String id_rol,String nu_orden, String id_priv, String es_detalle_priv);
    public void Elim_Detalle_Priv (String id_rol,String nu_orden, String id_priv, String es_detalle_priv);
}
