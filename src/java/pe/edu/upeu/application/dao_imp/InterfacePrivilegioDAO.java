/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.Privilegio;

/**
 *
 * @author Admin
 */
public interface InterfacePrivilegioDAO {
    public boolean Insert_Privilegio();
    public boolean Insert_Proceso();
    public boolean Insert_Detalle_Privilegio();
    public List<Privilegio> List_Privilegio();
}
