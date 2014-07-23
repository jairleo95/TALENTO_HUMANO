/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.Datos_Hijo_Trabajador;
import pe.edu.upeu.application.model.Documentos;

/**
 *
 * @author Admin
 */
public interface InterfaceDocumentoDAO {
    public List<Documentos> List_Id_Doc_Trab(String id_trabajador);
    public List<Documentos> List_Documentos();
    //public List<Documentos> List_Doc_Req_Pla(String id_dgp,String id_trabajador);
    public List<Datos_Hijo_Trabajador> List_Hijos(String id_trabajador);
}
