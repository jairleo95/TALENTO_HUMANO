/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao;

import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfaceFuncionDAO;
import pe.edu.upeu.application.factory.ConexionBD;

/**
 *
 * @author joserodrigo
 */
public class FuncionDAO implements InterfaceFuncionDAO{
    ConexionBD cnn;
    @Override
    public List<FuncionDAO> Listar_funciones_x_id_pu(String id_pu) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
