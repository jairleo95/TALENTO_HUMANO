/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.Comentario_DGP;
import pe.edu.upeu.application.model.X_List_Comen_DGP;

/**
 *
 * @author Admin
 */
public interface InterfaceComentario_DGPDAO {
    public boolean Insert_Comentario_DGP ();
    public List<X_List_Comen_DGP> List_Comentario_DGP(String id_dgp);
}
