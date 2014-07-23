/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao;

import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfaceComentario_DGPDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Comentario_DGP;

/**
 *
 * @author Admin
 */
public class Comentario_DGPDAO implements InterfaceComentario_DGPDAO{
    ConexionBD conn;

    @Override
    public boolean Insert_Comentario_DGP() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Comentario_DGP> List_Comentario_DGP() {
       this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
       String sql= "select * from comentario_dgp cm, det_usuario u where cm.idusuario=u.idusuario and cm.iddetalle_dgp=$iddgp order by cm.idcomentario_dgp desc";
       return null;
    }
    
}
