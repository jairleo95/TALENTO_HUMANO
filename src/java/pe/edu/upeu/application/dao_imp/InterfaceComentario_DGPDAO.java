/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.X_List_Comen_DGP;

/**
 *
 * @author Admin
 */
public interface InterfaceComentario_DGPDAO {

    public void INSERT_COMENTARIO_DGP(String ID_COMENTARIO_DGP, String ID_DGP, String ID_AUTORIZACION, String CM_COMENTARIO, String US_CREACION, String FE_CREACION, String US_MODIFICACION, String FE_MODIFICACION, String ES_COMENTARIO_DGP);

    public List<X_List_Comen_DGP> List_Comentario_DGP(String id_dgp);
}
