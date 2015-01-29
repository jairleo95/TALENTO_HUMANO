/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.dao.FuncionDAO;

/**
 *
 * @author joserodrigo
 */
public interface InterfaceFuncionDAO {
    public List<FuncionDAO>Listar_funciones_x_id_pu(String id_pu);
}
