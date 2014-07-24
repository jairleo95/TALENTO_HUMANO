/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.Horario;

/**
 *
 * @author Admin
 */
public interface InterfaceHorarioDAO {
    public boolean Insert_Horario();
    public boolean Insert_Detalle_Horatio();
    public String Max_id_Horatio ();
    public List<Horario> List_Horario ();
}
