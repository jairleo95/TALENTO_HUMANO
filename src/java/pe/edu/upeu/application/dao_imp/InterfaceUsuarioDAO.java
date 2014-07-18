/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import pe.edu.upeu.application.model.Usuario;
import java.util.List;

/**
 *
 * @author Alfa.sistemas
 */
public interface InterfaceUsuarioDAO {
    public List<Usuario> List();
    public Usuario Edit( int ID);
    public boolean Edit(Usuario usuario);
    public boolean Save(Usuario usuario);
    public boolean Delete(int ID);
}
